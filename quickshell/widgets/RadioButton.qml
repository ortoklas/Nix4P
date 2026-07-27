import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Item {
    id: root

    implicitWidth: 24
    implicitHeight: 24

    property bool playing: false

    Image {
        anchors.centerIn: parent

        source: "../assets/icons/radio.svg"

        width: 20
        height: 20

        fillMode: Image.PreserveAspectFit
        opacity: root.playing ? 1.0 : 0.35
    }

    Process {
        id: statusProcess

        command: [
            "python3",
            "/home/highv/.config/home-manager/radio/radio-status.py"
        ]

        stdout: SplitParser {
            onRead: data => {
                root.playing = data.trim() === "playing"
            }
        }

        running: true
    }

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            statusProcess.running = true
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            if (root.playing) {
                Quickshell.execDetached([
                    "/home/highv/.local/bin/radio-toggle"
                ])
            } else {
                Quickshell.execDetached([
                    "/home/highv/.local/bin/radio-next"
                ])
            }
        }

        onWheel: event => {
            if (event.angleDelta.y > 0) {
                Quickshell.execDetached([
                    "/home/highv/.local/bin/radio-next"
                ])
            } else {
                Quickshell.execDetached([
                    "/home/highv/.local/bin/radio-prev"
                ])
            }

            event.accepted = true
        }
    }
}
