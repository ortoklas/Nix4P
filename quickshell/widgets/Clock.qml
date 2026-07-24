import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../theme"

Item {
    id: clock

    implicitWidth: clockColumn.implicitWidth
    implicitHeight: clockColumn.implicitHeight

    property string timeText: ""
    property string dateText: ""

    ColumnLayout {
        id: clockColumn

        anchors.centerIn: parent
        spacing: 0

        Text {
            Layout.alignment: Qt.AlignHCenter

            text: clock.timeText
            color: Theme.text

            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 15
            font.bold: true
        }

        Text {
            Layout.alignment: Qt.AlignHCenter

            text: clock.dateText
            color: Theme.textMuted

            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 9
        }
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: calendarPanel.visible = !calendarPanel.visible
    }

    PanelWindow {
        id: calendarPanel

        visible: false

        anchors {
            top: true
            left: true
        }

        margins.top: 58
        margins.left: 1000

        implicitWidth: 320
        implicitHeight: 360

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 0

            radius: 20

            color: Theme.backgroundAlt

            border.width: 1
            border.color: Theme.accentStrong

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 18

                spacing: 12

                // MONTH HEADER
                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: "‹"

                        color: Theme.text

                        font.pixelSize: 28
                        font.bold: true

                        MouseArea {
                            anchors.fill: parent

                            onClicked: calendar.previousMonth()
                        }
                    }

                    Text {
                        Layout.fillWidth: true

                        text: calendar.monthName + " " + calendar.year

                        horizontalAlignment: Text.AlignHCenter

                        color: Theme.text

                        font.family: "JetBrainsMono Nerd Font"
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Text {
                        text: "›"

                        color: Theme.text

                        font.pixelSize: 28
                        font.bold: true

                        MouseArea {
                            anchors.fill: parent

                            onClicked: calendar.nextMonth()
                        }
                    }
                }

                // WEEKDAY HEADER
                GridLayout {
                    Layout.fillWidth: true

                    columns: 7

                    Repeater {
                        model: [
                            "Su",
                            "Mo",
                            "Tu",
                            "We",
                            "Th",
                            "Fr",
                            "Sa"
                        ]

                        Text {
                            Layout.fillWidth: true

                            text: modelData

                            horizontalAlignment: Text.AlignHCenter

                            color: Theme.textMuted

                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 10
                            font.bold: true
                        }
                    }
                }

                // DAYS
                GridLayout {
                    id: dayGrid

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    columns: 7

                    Repeater {
                        model: 42

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            radius: width / 2

                            color: {
                                if (calendar.isCurrentDay(index))
                                    return Theme.accentStrong

                                return "transparent"
                            }

                            Text {
                                anchors.centerIn: parent

                                text: calendar.dayNumber(index)

                                color: calendar.isCurrentDay(index)
                                    ? Theme.text
                                    : Theme.textMuted

                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 11
                                font.bold: calendar.isCurrentDay(index)
                            }
                        }
                    }
                }
            }
        }
    }

    QtObject {
        id: calendar

        property date currentDate: new Date()

        property string monthName: {
            var months = [
                "January", "February", "March",
                "April", "May", "June",
                "July", "August", "September",
                "October", "November", "December"
            ]

            return months[currentDate.getMonth()]
        }

        property int year: currentDate.getFullYear()

        function daysInMonth(year, month) {
            return new Date(year, month + 1, 0).getDate()
        }

        function firstDayOfMonth() {
            return new Date(
                currentDate.getFullYear(),
                currentDate.getMonth(),
                1
            ).getDay()
        }

        function dayNumber(index) {
            var day = index - firstDayOfMonth() + 1
            var totalDays = daysInMonth(
                currentDate.getFullYear(),
                currentDate.getMonth()
            )

            if (day < 1 || day > totalDays)
                return ""

            return day
        }

        function isCurrentDay(index) {
            var day = index - firstDayOfMonth() + 1

            var today = new Date()

            return day === today.getDate()
                && currentDate.getMonth() === today.getMonth()
                && currentDate.getFullYear() === today.getFullYear()
        }

        function previousMonth() {
            currentDate = new Date(
                currentDate.getFullYear(),
                currentDate.getMonth() - 1,
                1
            )
        }

        function nextMonth() {
            currentDate = new Date(
                currentDate.getFullYear(),
                currentDate.getMonth() + 1,
                1
            )
        }
    }

    Process {
        id: timeProcess

        command: [
            "date",
            "+%H:%M"
        ]

        stdout: SplitParser {
            onRead: data => clock.timeText = data.trim()
        }

        running: true
    }

    Process {
        id: dateProcess

        command: [
            "date",
            "+%a %b %d"
        ]

        stdout: SplitParser {
            onRead: data => clock.dateText = data.trim()
        }

        running: true
    }

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            timeProcess.running = true
            dateProcess.running = true
        }
    }
}
