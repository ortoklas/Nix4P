import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Item {
    id: root

    implicitWidth: 80
    implicitHeight: 24

    property string temperature: "--"

    Process {
        id: weatherProcess

        command: [
            "cat",
            "/home/highv/.cache/nix4p/weather"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                var result = text.trim()

                if (result !== "")
                    root.temperature = result
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true

        onTriggered: weatherProcess.running = true
    }

    Component.onCompleted: {
        weatherProcess.running = true
    }

    Image {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        source: "../assets/icons/weather-icons-23-svgrepo-com.svg"

        width: 28
        height: 28

        fillMode: Image.PreserveAspectFit
    }

    Text {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        text: root.temperature

        color: Theme.text

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 12
    }

    MouseArea {
        anchors.fill: parent

        onClicked: weatherProcess.running = true
    }
}
