import QtQuick 2.0
import QtQuick.Dialogs 1.0

Item {
    id: imageDialog
    property alias isVisible: fileDialog.visible
    signal fileChosen(url file)

    FileDialog {
        id: fileDialog
        title: "Choose a bitmap image"
        folder: shortcuts.desktop
        selectedNameFilter: "Image files (*.bmp, *.png, *.jpg, *.jpeg, *.tif. *.tiff)"
        onAccepted: {
            imageDialog.fileChosen(fileDialog.fileUrl);
        }
        onRejected: {
            console.log("Canceled")
        }
    }
}
