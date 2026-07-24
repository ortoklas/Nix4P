#!/usr/bin/env python3

import json
import socket
from pathlib import Path

SOCKET = Path.home() / ".local/state/nixml4w-radio/mpv.sock"

if not SOCKET.exists():
    print("stopped")
    raise SystemExit

try:
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
        sock.settimeout(0.5)
        sock.connect(str(SOCKET))
        sock.sendall(
            b'{"command":["get_property","pause"]}\n'
        )

        response = sock.recv(4096).decode()

        if '"data":false' in response:
            print("playing")
        else:
            print("paused")

except Exception:
    print("stopped")
