import QtQuick 2.4

ImageListItemForm {
    // get image name from url
    function basename(str)
    {
        return (str.replace(/^.*[\\\/](.*)\..*$/, '$1'))
    }

    imageName: basename(imagePath.toString())

    // item mouse area signal handlers
    itemMouseArea.onClicked: {
        imageListView.currentIndex = index;
    }

    // delete image mouse area signal handlers
    deleteMouseArea.onClicked:  {
        imageListModel.remove(index);
        if (imageListModel.count === 0) {
            modelEmptied(true);
        }
    }

    deleteMouseArea.onEntered: {
        deleteImage.visible = true;
    }

    deleteMouseArea.onExited: {
        deleteImage.visible = false;
    }

}
