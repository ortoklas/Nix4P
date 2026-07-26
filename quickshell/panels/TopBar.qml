import QtQuick
import QtQuick.Layouts
import Quickshell

import "../widgets"
import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 44

    color: "transparent"

    Rectangle {
        id: mainPanel

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        width: mainContent.implicitWidth + 36
        height: 44

        radius: height / 2

        color: Theme.backgroundAlt
        border.color: Theme.surfaceAlt
        border.width: 1

        RowLayout {
            id: mainContent

            anchors.centerIn: parent

            spacing: 16

            // LAUNCHER
            Launcher {
            }

            Rectangle {
                width: 1
                height: 22

                color: Theme.surfaceAlt
            }

            // WORKSPACES
            Workspaces {
            }

            Rectangle {
                width: 1
                height: 22

                color: Theme.surfaceAlt
            }

            // CLOCK
            Clock {
            }

            Rectangle {
                width: 1
                height: 22

                color: Theme.surfaceAlt
            }

            // WEATHER
            WeatherButton {
            }

            // VOLUME
            VolumeButton {
            }

            // NETWORK
            NetworkButton {
            }

            // RADIO
            RadioButton {
            }

            // NOTIFICATIONS
            NotificationButton {
            }

            Rectangle {
                width: 1
                height: 22

                color: Theme.surfaceAlt
            }

            // CLIPBOARD
            ClipboardButton {
            }

            // KEYBINDS
            KeybindsButton {
            }

            // RELOAD QUICKSHELL
            ReloadButton {
            }

            // POWER
            PowerButton {
            }
        }
    }
}
