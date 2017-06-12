import QtQuick 2.0

ListView {
    id: imageListView

    Component {
        id: imageListComponent
        ImageListItem {
            width: parent.width
            height: 55
        }
    }

    delegate: imageListComponent
}
