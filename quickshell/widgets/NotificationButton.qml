import QtQuick
import Quickshell

import "../theme"

Item {
    id: root

    implicitWidth: 28
    implicitHeight: 28

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            NotificationState.togglePanel()
        }
    }

    Text {
        anchors.centerIn: parent

        text: "󰂚"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 18

        color: Theme.text
    }

}
