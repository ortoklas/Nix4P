import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io

import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: ClipboardState.panelOpen

    anchors {
        top: true
        left: true
    }

    margins.top: 70

    implicitWidth: 500
    implicitHeight: 650

    color: "transparent"

    property string clipboardHistory: ""

    Process {
        id: historyProcess

        command: ["cliphist", "list"]

        stdout: StdioCollector {
            onStreamFinished: {
                clipboardHistory = text
            }
        }
    }

    Process {
        id: copyProcess
    }

    Component.onCompleted: {
        historyProcess.running = true
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 10

        radius: 24

        color: Theme.backgroundAlt

        border.width: 1
        border.color: Theme.accentStrong

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 22

            spacing: 12

            Text {
                text: "󰅍  CLIPBOARD HISTORY"

                color: Theme.text

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 18
                font.bold: true
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1

                color: Theme.surfaceAlt
            }

            ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                clip: true

                ListView {
                    id: clipboardList

                    anchors.fill: parent

                    model: clipboardHistory
                        ? clipboardHistory.trim().split("\n")
                        : []

                    spacing: 6

                    delegate: Rectangle {
                        width: clipboardList.width
                        height: 44

                        radius: 10

                        color: mouseArea.containsMouse
                            ? Theme.accentStrong
                            : Theme.surface

                        Text {
                            anchors.fill: parent
                            anchors.margins: 10

                            text: modelData

                            color: Theme.text

                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 12

                            elide: Text.ElideRight

                            verticalAlignment: Text.AlignVCenter
                        }

                        MouseArea {
                            id: mouseArea

                            anchors.fill: parent

                            hoverEnabled: true

                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                var entry = modelData
                                var id = entry.split("\t")[0]

                                copyProcess.command = [
                                    "sh",
                                    "-c",
                                    "cliphist decode \"$1\" | wl-copy",
                                    "sh",
                                    id
                                ]
                                
                                copyProcess.running = true
                                
                                ClipboardState.panelOpen = false
                            }
                        }
                    }
                }
            }
        }
    }
}
