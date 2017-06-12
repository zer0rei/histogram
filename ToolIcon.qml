import QtQuick 2.0

Item {
    id: iconContainer
    height: parent.height * 0.8
    anchors.bottom: parent.bottom
    width: parent.width / 5
    property alias iconUrl: icon.source
    property alias name: iconText.text
    property alias loadMouseArea: loadMouseArea

    Image {
        id: icon
        height: parent.height * 0.5
        width: height
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/default_tool_icon.svg"
    }

    Text {
        id: iconText
        text: "icon"
        color: "white"
        font.pointSize: 11
        visible: true
        renderType: Text.QtRendering
        elide: Text.ElideNone
        font.weight: Font.Normal
        font.bold: true
        font.capitalization: Font.Capitalize
        font.family: "Arial"
        fontSizeMode: Text.Fit
        verticalAlignment: Text.AlignVCenter
        anchors.top: icon.bottom
        anchors.topMargin: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    states: [
        State {
            name: "PRESSED"
            PropertyChanges { target: iconContainer; opacity: 0.7}
        }
    ]

    MouseArea {
        id: loadMouseArea
        anchors.fill: parent
        onPressed: {iconContainer.state = "PRESSED"}
        onReleased: {iconContainer.state = ""}
    }
}

