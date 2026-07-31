import QtQuick
import QtQuick.Layouts
import Quickshell

import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: KeybindState.panelOpen

    anchors {
        top: true
        right: true
    }

    margins.top: 70

    implicitWidth: 500
    implicitHeight: 650

    color: "transparent"

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

            // HEADER
            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "󰘳"

                    color: Theme.accent

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 24
                }

                Text {
                    text: "KEYBINDINGS"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                    font.bold: true

                    Layout.fillWidth: true
                }

                Text {
                    text: "Nix4P"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1

                color: Theme.surfaceAlt
            }

            // APPLICATIONS
            Text {
                text: "APPLICATIONS"

                color: Theme.accent

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 11
                font.bold: true

                Layout.topMargin: 4
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SPACE"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Launcher"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + ENTER"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Terminal"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + B"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Browser"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + E"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "File manager"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            // WINDOW MANAGEMENT
            Text {
                text: "WINDOW MANAGEMENT"

                color: Theme.accent

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 11
                font.bold: true

                Layout.topMargin: 8
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + ARROWS"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Focus window"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + ARROWS"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Move window"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + Q"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Close window"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + F"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Fullscreen"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + T"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Toggle floating"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            // WORKSPACES
            Text {
                text: "WORKSPACES"

                color: Theme.accent

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 11
                font.bold: true

                Layout.topMargin: 8
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + 1–5"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Switch workspace"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + 1–5"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Move window to workspace"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            // SYSTEM
            Text {
                text: "SYSTEM"

                color: Theme.accent

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 11
                font.bold: true

                Layout.topMargin: 8
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + ;"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Screenshot"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + R"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Reload Quickshell"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }
            
            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + Q"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true

                    Layout.preferredWidth: 190
                }

                Text {
                    text: "Exit Hyprland"

                    color: Theme.textMuted

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13

                    Layout.fillWidth: true
                }
            }

            Item {
                Layout.fillHeight: true
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1

                color: Theme.surfaceAlt
            }

            Text {
                text: "Press the cheat-sheet button again to close"

                color: Theme.textMuted

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 11

                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
