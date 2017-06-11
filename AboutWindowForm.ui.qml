import QtQuick 2.4

Rectangle {
    id: container
    width: 350
    height: 320
    color: "#ececec"
    border.color: "#00000000"

    Image {
        id: icon
        x: 43
        y: 42
        width: 81
        height: 81
        source: "images/histogram_icon.svg"
    }

    Text {
        id: title
        x: 179
        y: 42
        color: "#000000"
        text: qsTr("Histogram")
        font.family: "Arial"
        font.pixelSize: 25
    }

    Text {
        id: subtitle
        anchors.horizontalCenter: title.horizontalCenter
        anchors.top: title.bottom
        color: "#808080"
        text: qsTr("Version 1.0.0")
        font.family: "Arial"
        font.pixelSize: 11
    }

    Rectangle {
        id: codeBox
        y: 155
        anchors.horizontalCenter: title.horizontalCenter
        anchors.top: subtitle.bottom
        anchors.topMargin: 20
        width: 120
        height: 20
        color: "#fafafa"
        radius: 5

        Text {
            id: codeLink
            anchors.fill: parent
            color: "#7d7d7d"
            text: qsTr("Code: @github")
            verticalAlignment: Text.AlignVCenter
            styleColor: "#00000000"
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
            font.pixelSize: 12
        }
    }

    Text {
        id: text1
        anchors.horizontalCenter: parent.horizontalCenter
        y: 153
        text: qsTr("GI3 Project - ENSA Marrakech")
        anchors.horizontalCenterOffset: 0
        font.pixelSize: 12
    }

    Text {
        id: text2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 187
        width: 288
        height: 71
        color: "#a2a2a2"
        text: qsTr("This Software utilize the following material, the use of which is hereby acknowledged:"
                   + "\n\n" + "Qt 5.9 - © 2017, The Qt Company")
        anchors.horizontalCenterOffset: 0
        fontSizeMode: Text.Fit
        elide: Text.ElideNone
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        font.pixelSize: 9
    }

    Text {
        id: footer
        anchors.horizontalCenter: parent.horizontalCenter
        y: 290
        color: "#646464"
        text: qsTr("© 2017 Elguaoussi Hamza. All rights reserved")
        font.pixelSize: 8
    }
}
