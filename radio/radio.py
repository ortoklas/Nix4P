#!/usr/bin/env python3

import json
import socket
import subprocess
import sys
from pathlib import Path

STATIONS_FILE = Path.home() / ".config/home-manager/radio/stations.txt"
STATE_DIR = Path.home() / ".local/state/nixml4w-radio"
STATE_DIR.mkdir(parents=True, exist_ok=True)

STATION_INDEX = STATE_DIR / "station-index"
MPV_SOCKET = STATE_DIR / "mpv.sock"


def load_stations():
    stations = []

    with STATIONS_FILE.open() as f:
        for line in f:
            line = line.strip()

            if not line or "|" not in line:
                continue

            name, url = line.split("|", 1)
            stations.append((name.strip(), url.strip()))

    return stations


def get_index():
    try:
        return int(STATION_INDEX.read_text().strip())
    except (FileNotFoundError, ValueError):
        return 0


def set_index(index):
    STATION_INDEX.write_text(str(index))


def notify(name):
    subprocess.Popen(
        [
            "notify-send",
            "-a",
            "NixML4W Radio",
            "📻 Radio",
            name,
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )


def start_station(index):
    stations = load_stations()

    if not stations:
        return

    index %= len(stations)
    name, url = stations[index]

    set_index(index)

    subprocess.run(
        [
            "pkill",
            "-f",
            "mpv.*nixml4w-radio",
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    try:
        MPV_SOCKET.unlink()
    except FileNotFoundError:
        pass

    subprocess.Popen(
        [
            "mpv",
            "--no-video",
            "--no-terminal",
            "--title=NixML4W Radio",
            "--input-ipc-server=" + str(MPV_SOCKET),
            "--force-window=no",
            "--",
            url,
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    print(name)
    notify(name)


def send_mpv_command(command):
    if not MPV_SOCKET.exists():
        return

    try:
        with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
            sock.connect(str(MPV_SOCKET))
            sock.sendall(
                (
                    json.dumps({"command": command}) + "\n"
                ).encode()
            )
    except (FileNotFoundError, ConnectionRefusedError):
        pass


def toggle():
    if not MPV_SOCKET.exists():
        start_station(get_index())
        return

    send_mpv_command(["cycle", "pause"])


def next_station():
    start_station(get_index() + 1)


def previous_station():
    start_station(get_index() - 1)


def main():
    if len(sys.argv) < 2:
        return

    command = sys.argv[1]

    if command == "toggle":
        toggle()

    elif command == "next":
        next_station()

    elif command == "prev":
        previous_station()

    elif command == "select" and len(sys.argv) >= 3:
        stations = load_stations()
        name = " ".join(sys.argv[2:])

        for index, (station_name, url) in enumerate(stations):
            if station_name == name:
                start_station(index)
                break

    elif command == "current":
        stations = load_stations()

        if stations:
            print(stations[get_index() % len(stations)][0])


if __name__ == "__main__":
    main()
