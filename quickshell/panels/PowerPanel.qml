import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../theme"
import "../widgets"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: PowerState.panelOpen

    anchors {
        top: true
        right: true
    }

    margins.top: 70

    implicitWidth: 200
    implicitHeight: 330

    color: "transparent"

    Rectangle {
        id: panel

        anchors.fill: parent

        anchors.margins: 10

        radius: 24

        color: "#9923233a"   // Theme.backgroundAlt at 20% opacity

        border.width: 1
        border.color: Theme.accentStrong

        ColumnLayout {
            anchors.fill: parent

            anchors.margins: 14

            spacing: 8

            PowerAction {
                icon: "󰌾"
                label: "Lock"

                command: [
                    "/home/highv/.nix-profile/bin/hyprlock"
                ]
            }

            PowerAction {
                icon: "󰍃"
                label: "Logout"

                command: [
                    "/run/current-system/sw/bin/hyprctl",
                    "dispatch",
                    "exit"
                ]
            }

            PowerAction {
                icon: "󰜉"
                label: "Restart"

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "reboot"
                ]
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 44

                radius: 22

                color: Theme.accentStrong

                border.width: 1
                border.color: Theme.accent

                Text {
                    anchors.centerIn: parent

                    text: "󰍹  UEFI"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent

                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        uefiReboot.running = true
                    }
                }
            }

            Process {
                id: uefiReboot

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "reboot",
                    "--firmware-setup"
                ]
            }

            PowerAction {
                icon: "󰐥"
                label: "Shutdown"

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "poweroff"
                ]
            }
        }
    }
}
