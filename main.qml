import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    minimumWidth: 400
    minimumHeight: 300
    width: 640
    height: 480
    title: qsTr("Histogram")

    MainForm {
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
