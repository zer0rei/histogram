import QtQuick 2.0
import QtQuick.Dialogs 1.2

Item {
    id: imageDialog
    property alias isVisible: fileDialog.visible
    signal fileChosen(url file)

    FileDialog {
        id: fileDialog
        title: "Choose a bitmap image"
        folder: shortcuts.desktop
        nameFilters: ["Image files (*.bmp *.png *.jpg *.jpeg)"]
        selectedNameFilter: "Image files"
        onAccepted: {
            fileChosen(fileDialog.fileUrl);
        }
        onRejected: {
            // don't do anything
        }
    }
}
