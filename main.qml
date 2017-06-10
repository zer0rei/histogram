import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.0

Window {
    visible: true
    minimumWidth: 540
    minimumHeight: 400
    width: 640
    height: 480
    title: qsTr("Histogram")

    FileDialog {
        id: imageDialog
        title: "Choose a bitmap image"
        folder: shortcuts.desktop
        nameFilters: ["Image files (*.bmp)"]
        selectedNameFilter: "Image files (*.bmp)"
        onAccepted: {
            console.log("You chose: " + imageDialog.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    MainForm {
        // load icon Mouse Signals
        loadMouseArea.onClicked: {
            if (!imageDialog.visible) {
                imageDialog.open();
            }
        }

        // main Mouse Signals
        mainMouseArea.onClicked: {
            if (!imageDialog.visible) {
                imageDialog.open();
            }
        }

        // about Mouse Signals
        aboutMouseArea.onEntered: {
            about.opacity = 1
        }
        aboutMouseArea.onExited: {
            about.opacity = 0.7
        }
        aboutMouseArea.onPressed: {
            about.opacity = 0.5
        }
        aboutMouseArea.onReleased: {
            if (aboutMouseArea.containsMouse)
                about.opacity = 1
            else
                about.opacity = 0.7
        }

    }
}
