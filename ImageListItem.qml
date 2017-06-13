import QtQuick 2.4
import QtQuick.Dialogs 1.2

ImageListItemForm {
    // get image name from url
    function basename(str)
    {
        return (str.slice(str.lastIndexOf("/")+1))
    }

    imageName: basename(imagePath.toString())

    // item mouse area signal handlers
    itemMouseArea.onClicked: {
        imageListView.currentIndex = index;
        mouse.accepted = false;
    }

    // delete image mouse area signal handlers
    deleteMouseArea.onClicked:  {
        imageListModel.remove(index)
    }

    deleteMouseArea.onEntered: {
        deleteImage.visible = true
    }

    deleteMouseArea.onExited: {
        deleteImage.visible = false
    }
}
