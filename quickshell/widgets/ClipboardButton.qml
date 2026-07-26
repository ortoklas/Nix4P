import QtQuick
import QtQuick.Layouts
import Quickshell

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

        text: "󰅍"

        color: mouseArea.containsMouse
            ? Theme.text
            : Theme.textMuted

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 20
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            ClipboardState.panelOpen = !ClipboardState.panelOpen
        }
    }
}
