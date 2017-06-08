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
        anchors.fill: parent
    }
}
