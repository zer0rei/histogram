import QtQuick 2.7

Rectangle {
    id: container
    anchors.fill: parent
    color: "#00000000"
    property alias loadIcon: loadIcon
    property alias rawIcon: rawIcon
    property alias rawMouseArea: rawIcon.iconMouseArea
    property alias negativeIcon: negativeIcon
    property alias negativeMouseArea: negativeIcon.iconMouseArea
    property alias equalizeIcon: equalizeIcon
    property alias equalizeMouseArea: equalizeIcon.iconMouseArea
    property alias tresholdIcon: tresholdIcon
    property alias tresholdMouseArea: tresholdIcon.iconMouseArea
    property alias loadMouseArea: loadIcon.iconMouseArea
    property alias about: about
    property alias aboutText: aboutText
    property alias aboutMouseArea: aboutMouseArea
    property alias imageListView: imageListView
    property alias mainMouseArea: mainContainer.mainMouseArea
    property alias mainContainer: mainContainer

    opacity: 1

    Rectangle {
        id: logoSpace
        x: 0
        y: 0
        width: (parent.width < 800) ? parent.width * 0.3 : 240
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
        width: (parent.width < 800) ? (parent.width * 0.7) : (parent.width - 240)
        height: 70
        color: "#445a6f"
        clip: true

        Row {
            id: toolRow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            width: 250
            height: parent.height * 0.7

            ToolIcon {
                id: loadIcon
                name: "load"
                iconUrl: "images/load_tool_icon.svg"
            }

            ToolIcon {
                id: rawIcon
                name: "raw"
                iconUrl: "images/raw_tool_icon.svg"
            }

            ToolIcon {
                id: negativeIcon
                name: "negative"
                iconUrl: "images/negative_tool_icon.svg"
            }

            ToolIcon {
                id: equalizeIcon
                name: "equalize"
                iconUrl: "images/equalize_tool_icon.svg"
            }

            ToolIcon {
                id: tresholdIcon
                name: "treshold"
                iconUrl: "images/treshold_tool_icon.svg"
            }
        }
    }

    Rectangle {
        id: imagelistSpace
        anchors.top: logoSpace.bottom
        width: (parent.width < 800) ? parent.width * 0.3 : 240
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

        ImageListView {
            id: imageListView
            anchors.top: imagelistText.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.height * 0.95
            clip: true
        }
    }

    Rectangle {
        id: mainSpace
        anchors.left: imagelistSpace.right
        anchors.top: toolSpace.bottom
        width: (parent.width < 800) ? (parent.width * 0.7) : (parent.width - 240)
        height: parent.height - 70
        color: "#4e6071"
        clip: true

        MainSpace {
            id: mainContainer
            x: 0
            y: 0
            width: parent.width
            height: parent.height * 0.95
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
