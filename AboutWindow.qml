import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: aboutWindow
    title: "About"
    modality: Qt.ApplicationModal
    width: 350
    height: 320
    minimumWidth: 350
    minimumHeight: 320
    maximumWidth: 350
    maximumHeight: 320
    AboutWindowForm {}
}
