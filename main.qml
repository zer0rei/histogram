import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    minimumWidth: 540
    minimumHeight: 400
    width: 640
    height: 480
    title: qsTr("Histogram")

    ImageDialog {
        id: myImageDialog
    }

    AboutWindow {
        id: myAboutWindow
    }

    MainForm {
        // loadIcon Mouse Signals
        loadMouseArea.onClicked: {
            if (!myImageDialog.isVisible) {
                myImageDialog.isVisible = true
            }
        }

        // main Mouse Signals
        mainMouseArea.onClicked: {
            if (!myImageDialog.isVisible) {
                myImageDialog.isVisible = true
            }
        }

        // about Mouse Signals
        aboutMouseArea.onClicked: {
            if (!myAboutWindow.visible) {
                myAboutWindow.visible = true
            }
        }

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
