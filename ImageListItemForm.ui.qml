import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    property alias itemMouseArea: itemMouseArea
    property alias deleteMouseArea: deleteMouseArea
    property alias deleteImage: deleteImage
    property alias deleteItem: deleteItem
    property alias imageName: itemName.text

    MouseArea {
        id: itemMouseArea
        anchors.fill: parent
    }

    Rectangle {
        id: imageContainer
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        height: parent.height * 0.7
        width: height
        radius: height / 2
        border.color: "#ffffff"
        border.width: 1
        color: "#00000000"

        Image {
            id: image
            source: imagePath
            width: parent.width - 2
            height: parent.height - 2
            fillMode: Image.PreserveAspectCrop
            anchors.centerIn: parent
            property bool rounded: true
            property bool adapt: false

            layer.enabled: rounded
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: image.width
                    height: image.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: image.adapt ? image.width : Math.min(
                                                 image.width, image.height)
                        height: image.adapt ? image.height : width
                        radius: Math.min(width, height)
                    }
                }
            }
        }
    }

    Flickable {
        id: itemNameFlickable
        flickableDirection: Flickable.HorizontalFlick
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: imageContainer.right
        anchors.leftMargin: 10
        width: parent.width * 0.75 - imageContainer.height - deleteImage.width
        height: parent.height
        interactive: false
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
        color: "#f41919"

        Image {
            id: deleteImage
            width: parent.width * 0.6
            height: width
            fillMode: Image.PreserveAspectFit
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
