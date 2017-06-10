import QtQuick 2.7

Rectangle {
    id: container
    anchors.fill: parent
    color: "#00000000"
    property alias loadMouseArea: loadMouseArea
    property alias loadIcon: loadIcon
    property alias aboutMouseArea: aboutMouseArea
    property alias about: about
    property alias mainMouseArea: mainMouseArea
    property alias aboutText: aboutText
    opacity: 1

    Rectangle {
        id: logoSpace
        x: 0
        y: 0
        width: parent.width * 0.3
        height: 70
        color: "#15283b"
        clip: true

        Text {
            id: logoText
            x: parent.width * 0.1
            y: parent.height * 0.2
            width: parent.width * 0.8
            height: parent.height * 0.6
            color: "#a9a9a9"
            text: qsTr("Histogram")
            font.pixelSize: 25
            visible: true
            renderType: Text.QtRendering
            elide: Text.ElideNone
            font.weight: Font.Normal
            font.bold: true
            font.capitalization: Font.Capitalize
            font.family: "Arial"
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Rectangle {
        id: toolSpace
        anchors.left: logoSpace.right
        width: parent.width * 0.7
        height: 70
        color: "#445a6f"
        clip: true

        Row {
            id: toolRow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 200
            height: parent.height * 0.7

            ToolIcon {
                id: loadIcon
                name: "load"

                MouseArea {
                    id: loadMouseArea
                    anchors.fill: parent
                }
            }

            ToolIcon {
                name: "tool2"
            }

            ToolIcon {
                name: "tool3"
            }

            ToolIcon {
                name: "tool4"
            }

            ToolIcon {
                name: "tool5"
            }
        }
    }

    Rectangle {
        id: imagelistSpace
        anchors.top: logoSpace.bottom
        width: parent.width * 0.3
        height: parent.height - 70
        color: "#111620"
        clip: true

        Text {
            id: imagelistText
            x: parent.width * 0.05
            y: 0
            width: parent.width * 0.9
            height: parent.height * 0.05
            color: "#a9a9a9"
            text: qsTr("Images")
            opacity: 0.6
            verticalAlignment: Text.AlignVCenter
            renderType: Text.NativeRendering
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: mainSpace
        anchors.left: imagelistSpace.right
        anchors.top: toolSpace.bottom
        width: parent.width * 0.7
        height: parent.height - 70
        color: "#4e6071"
        clip: true

        Rectangle {
            id: mainContainer
            x: 0
            y: 0
            width: parent.width
            height: parent.height * 0.95
            color: "#00000000"
            border.color: "#00000000"

            Image {
                id: loadImage
                x: 67
                y: 47
                width: ((parent.width < parent.height) ? parent.width : parent.height) * 0.7
                height: width
                opacity: 0.7
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "images/load_image.svg"

                MouseArea {
                    id: mainMouseArea
                    width: parent.width
                    height: parent.height
                }
            }
        }

        Rectangle {
            id: infoBar
            x: 0
            y: parent.height * 0.95
            width: parent.width
            height: parent.height * 0.04
            color: "#00000000"
            border.color: "#00000000"

            Rectangle {
                id: about
                x: parent.width - (2 * parent.height)
                width: parent.height
                height: parent.height
                color: "#a9a9a9"
                radius: parent.height / 2
                opacity: 0.7

                Text {
                    id: aboutText
                    width: parent.width
                    height: parent.height
                    color: "#393939"
                    text: qsTr("?")
                    font.bold: false
                    font.pointSize: 20
                    renderType: Text.NativeRendering
                    opacity: 1
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                MouseArea {
                    id: aboutMouseArea
                    hoverEnabled: true
                    anchors.fill: about
                }
            }
        }
    }
}
