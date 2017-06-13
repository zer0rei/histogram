import QtQuick 2.0

ListView {
    id: imageListView

    delegate: ImageListItem {
        width: parent.width
        height: 55
    }

    highlight: Rectangle {
        color: "#009EFA"
    }

    model: ListModel {
        id: imageListModel
    }

    function addModelElement(imageUrl) {
        var url = Qt.resolvedUrl(imageUrl)
        for (var i = 0; i < imageListModel.count; i++) {
            if(imageListModel.get(i).imagePath === url)
                return
        }
        imageListModel.insert(0, {"imagePath": url})
        imageListView.currentIndex = 0
    }
}
