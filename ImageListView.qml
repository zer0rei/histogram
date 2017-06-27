import QtQuick 2.0

Item {
    id: imageListViewContainer
    signal currentFileChanged(url currentUrl)
    signal modelEmptied(bool isEmpty)

    ListView {
        id: imageListView
        anchors.fill: parent

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

        onCurrentItemChanged: {
            var currentUrl = imageListModel.get(currentIndex).imagePath;
            currentFileChanged(currentUrl);
        }
    }

    function addModelElement(imageUrl) {
        var url = Qt.resolvedUrl(imageUrl);
        for (var i = 0; i < imageListModel.count; i++) {
            if (imageListModel.get(i).imagePath === url) {
                imageListView.currentIndex = i;
                return;
            }
        }

        imageListModel.insert(0, {"imagePath": url});
        imageListView.currentIndex = 0;
        if (imageListModel.count === 1) {
            modelEmptied(false);
        }
    }
}
