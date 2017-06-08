import QtQuick 2.7

Rectangle {
    id: container

    width: 640
    height: 480
    color: "#00000000"
    property alias aboutText: aboutText
    opacity: 1

    Rectangle {
        id: mainSpace
        x: 192
        y: 72
        width: parent.width * 0.7
        height: parent.height * 0.85
        color: "#4e6071"
        clip: true

        MouseArea {
            id: mainMouseArea
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
                x: parent.width - (1.5 * parent.height)
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
                    opacity: 1
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 15
                }
            }
        }
    }

    Rectangle {
        id: imagelistSpace
        x: 0
        y: 72
        width: parent.width * 0.3
        height: parent.height * 0.85
        color: "#111620"
        clip: true

        Column {
            id: column
            x: 0
            y: parent.height * 0.05
            width: parent.width
            height: parent.height * 0.95
        }

        Text {
            id: imagelistText
            x: parent.width * 0.1
            y: 0
            width: parent.width * 0.8
            height: parent.height * 0.05
            color: "#a9a9a9"
            text: qsTr("Images")
            verticalAlignment: Text.AlignVCenter
            renderType: Text.NativeRendering
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: menuSpace
        x: 192
        y: 0
        width: parent.width * 0.7
        height: parent.height * 0.15
        color: "#445a6f"
        clip: true

        Row {
            id: row
            x: 0
            y: 0
            width: parent.width
            height: parent.height
        }
    }

    Rectangle {
        id: logoSpace
        x: 0
        y: 0
        width: parent.width * 0.3
        height: parent.height * 0.15
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
}
