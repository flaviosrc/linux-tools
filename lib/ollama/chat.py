#!/usr/bin/env python3

import json
import os
import urllib.error
import urllib.request

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


def send_message(api_url, model, message):
    url = f"{api_url}/api/chat"

    payload = {
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": message
            }
        ],
    }

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
                    print(
                        chunk.get("message", {}).get("content", ""),
                        end="",
                        flush=True,
                    )
                except json.JSONDecodeError:
                    continue

    except urllib.error.URLError as exc:
        print(f"Request failed: {exc}")


def main():
    config = load_config()

    print("Ollama Chat")
    print()

    message = input("Prompt: ").strip()

    send_message(config["api_url"], config["model"], message)

    print()

if __name__ == "__main__":
    main()
