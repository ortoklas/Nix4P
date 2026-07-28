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
            "/home/highv/.config/home-manager/scripts/weather.sh"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                root.temperature = text.trim()
            }
        }
    }

    Timer {
        interval: 900000
        running: true
        repeat: true

        onTriggered: weatherProcess.running = true
    }

    Component.onCompleted: weatherProcess.running = true

    Image {
        id: weatherIcon

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        source: "../assets/icons/weather-icons-23-svgrepo-com.svg"

        width: 24
        height: 24

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

        onClicked: {
            console.log("Weather clicked")
        }
    }
}
