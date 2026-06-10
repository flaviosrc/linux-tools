#!/usr/bin/env python3

import json
import os

APP_NAME = "ollama-chat"
HOME = os.environ.get("HOME", "")
CONFIG_DIR = f"{HOME}/.config/{APP_NAME}"
CONFIG_FILE = f"{CONFIG_DIR}/config.json"

def main():
    """Run first-time configuration."""

    print("First-time setup")
    print()

    api_url = input(
        "Enter Ollama API URL "
        "[http://localhost:11434]: "
    ).strip()

    if not api_url:
        api_url = "http://localhost:11434"

    model = input(
        "Enter Ollama model "
        "[llama3]: "
    ).strip()

    if not model:
        model = "llama3"

    num_ctx = input(
        "Enter context length size(number of tokens) "
        "[131072]: "
    ).strip()

    if not num_ctx:
        num_ctx = "131072"

    os.makedirs(CONFIG_DIR, exist_ok=True)

    config = {
        "api_url": api_url,
        "model": model,
        "num_ctx": num_ctx
    }

    with open(CONFIG_FILE, "w") as f:
        json.dump(config, f, indent=4)

    print(f"\nConfiguration saved to {CONFIG_FILE}")

if __name__ == "__main__":
    main()
