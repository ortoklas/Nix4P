pragma Singleton

import QtQuick
import Quickshell

Item {
    id: root

    function togglePanel() {
        Quickshell.execDetached([
            "swaync-client",
            "-t"
        ])
    }

    function closePanel() {
        Quickshell.execDetached([
            "swaync-client",
            "-C"
        ])
    }
}
