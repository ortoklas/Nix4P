import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Rectangle {
    id: button

    implicitWidth: 32
    implicitHeight: 32

    radius: 16

    color: mouseArea.containsMouse
        ? Theme.accentStrong
        : "transparent"

    Text {
        anchors.centerIn: parent

        text: "󰑐"

        color: mouseArea.containsMouse
            ? Theme.text
            : Theme.textMuted

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 20
    }

    Process {
        id: reloadProcess

        command: [
            "/run/current-system/sw/bin/systemd-run",
            "--user",
            "--no-block",
            "--quiet",
            "/run/current-system/sw/bin/sh",
            "-c",
            "sleep 0.5; qs --daemonize"
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            reloadProcess.running = true
            Qt.callLater(function() {
                Quickshell.quit()
            })
        }
    }
}
