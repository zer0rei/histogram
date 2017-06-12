import QtQuick 2.4

ImageListItemForm {
    property url imageUrl

    // get image name from url
    function basename(str)
    {
        return (str.slice(str.lastIndexOf("/")+1))
    }

    imageName: basename(imageUrl.toString())

    // delete image signal handlers
    deleteMouseArea.onEntered: {
        deleteImage.visible = true
    }
    deleteMouseArea.onExited: {
        deleteImage.visible = false
    }
    deleteMouseArea.onPressed: {
        deleteItem.opacity = 0.7
    }
    deleteMouseArea.onReleased: {
        if (deleteMouseArea.containsMouse)
            deleteItem.opacity = 1
        else
            deleteItem.opacity = 0.7
    }
}
