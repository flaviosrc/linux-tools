#!/usr/bin/env python3

import readline
import json
import os
import sys
import urllib.error
import urllib.request
from datetime import datetime

APP_NAME = "ollama-chat"
HOME = os.environ.get("HOME", "")
CONFIG_DIR = f"{HOME}/.config/{APP_NAME}"
CONFIG_FILE = f"{CONFIG_DIR}/config.json"

def load_config():
    """Load existing config"""

    try:
        with open(CONFIG_FILE) as f:
            return json.load(f)

    except FileNotFoundError:
        raise FileNotFoundError(f"The config file {CONFIG_FILE} does not exist.")


def load_history(chat_file):
    """Load a previous conversation from a chat-*.json file"""

    try:
        with open(chat_file) as f:
            return json.load(f)

    except FileNotFoundError:
        raise FileNotFoundError(f"The chat file {chat_file} does not exist.")


def save_history(chat_file, messages):
    """Persist the full conversation to the chat file"""

    with open(chat_file, "w") as f:
        json.dump(messages, f, indent=2, ensure_ascii=False)


def send_message(api_url, model, num_ctx, messages):
    """Send the full message history and return the assistant reply"""

    url = f"{api_url}/api/chat"

    payload = {
        "model": model,
        "messages": messages,
        "options": {
            "num_ctx" : num_ctx
        }
    }

    reply = ""

    try:
        request = urllib.request.Request(
            url,
            data=json.dumps(payload).encode(),
            headers={"Content-Type": "application/json"},
        )

        with urllib.request.urlopen(request) as response:
            for line in response:
                try:
                    chunk = json.loads(line)
                    content = chunk.get("message", {}).get("content", "")
                    reply += content
                    print(content, end="", flush=True)
                except json.JSONDecodeError:
                    continue

        print()

    except urllib.error.URLError as exc:
        print(f"Request failed: {exc}")
        return None

    return reply


def main():
    config = load_config()

    # Resume a previous chat if a chat-*.json path was given as argument
    if len(sys.argv) > 1:
        chat_file = sys.argv[1]
        messages = load_history(chat_file)
    else:
        timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
        chat_file = f"chat-{timestamp}.json"
        messages = []

    print()
    print("Ollama Chat")

    print()
    print(f"Ollama API URL: {config['api_url']}")
    print(f"Model: {config['model']}")
    print(f"Context Window: {config['num_ctx']}")
    print(f"Chat File: {chat_file}")

    try:
        while (1) :
            print()
            message = input("Prompt: ").strip()

            if not message:
                continue

            messages.append({"role": "user", "content": message})

            print()
            reply = send_message(
                config["api_url"],
                config["model"],
                config["num_ctx"],
                messages
            )

            if reply is None:
                # Request failed, drop the unanswered user message
                messages.pop()
                continue

            messages.append({"role": "assistant", "content": reply})
            save_history(chat_file, messages)

    except (KeyboardInterrupt, EOFError):
        print()
        if messages:
            save_history(chat_file, messages)
            print(f"Conversation saved to {chat_file}")

    print()

if __name__ == "__main__":
    main()