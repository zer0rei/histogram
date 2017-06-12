import QtQuick 2.4

Item {
    property alias deleteMouseArea: deleteMouseArea
    property alias deleteImage: deleteImage
    property alias deleteItem: deleteItem
    property alias imageName: itemName.text

    Rectangle {
        id: imageContainer
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        height: parent.height * 0.8
        width: height
        radius: height / 2
        border.color: "#ffffff"
        border.width: 1
        color: "#00000000"

        Image {
            id: image
            source: imageUrl
            anchors.fill: parent
        }
    }

    Flickable {
        id: flickable
        flickableDirection: Flickable.HorizontalFlick
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: imageContainer.right
        anchors.leftMargin: 10
        width: parent.width * 0.75 - imageContainer.height - deleteImage.width
        height: parent.height
        clip: true

        Text {
            id: itemName
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            width: parent.width
            height: parent.height
            anchors.left: parent.left
            color: "#ffffff"
            font.pixelSize: 15
        }
    }

    Rectangle {
        id: deleteItem
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        height: parent.height * 0.15
        width: height
        radius: height / 2
        anchors.rightMargin: parent.width * 0.05
        color: "#d33939"

        Image {
            id: deleteImage
            width: parent.width * 0.6
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/delete_icon.svg"
            visible: false
        }

        MouseArea {
            id: deleteMouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}
