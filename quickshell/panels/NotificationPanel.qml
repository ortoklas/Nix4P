import QtQuick
import QtQuick.Layouts
import Quickshell

import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: NotificationState.panelOpen

    anchors {
        top: true
        right: true
    }

    implicitWidth: 360
    implicitHeight: 500

    color: "transparent"

    Rectangle {
        anchors {
            top: parent.top
            right: parent.right
            margins: 16
        }

        width: 340
        height: 480

        radius: 18

        color: Theme.backgroundAlt
        border.color: Theme.surfaceAlt
        border.width: 1

        ColumnLayout {
            anchors {
                fill: parent
                margins: 18
            }

            spacing: 12

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "Notifications"

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                    font.bold: true

                    color: Theme.text

                    Layout.fillWidth: true
                }

                Text {
                    text: "Clear"

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12

                    color: Theme.accent

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            NotificationState.server.trackedNotifications.forEach(
                                function(notification) {
                                    notification.dismiss()
                                }
                            )
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true

                height: 1

                color: Theme.surfaceAlt
            }

            ListView {
                id: notificationList

                Layout.fillWidth: true
                Layout.fillHeight: true

                clip: true

                spacing: 8

                model: NotificationState.server.trackedNotifications

                delegate: Rectangle {
                    required property var modelData

                    width: notificationList.width
                    height: notificationContent.implicitHeight + 24

                    radius: 12

                    color: Theme.surface

                    ColumnLayout {
                        id: notificationContent

                        anchors {
                            fill: parent
                            margins: 12
                        }

                        spacing: 4

                        Text {
                            text: modelData.summary

                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 14
                            font.bold: true

                            color: Theme.text

                            Layout.fillWidth: true
                        }

                        Text {
                            text: modelData.body

                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 12

                            color: Theme.textMuted

                            wrapMode: Text.Wrap

                            Layout.fillWidth: true
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            modelData.dismiss()
                        }
                    }
                }
            }
        }
    }
}
