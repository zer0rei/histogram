import QtQuick 2.4
import QtCharts 2.2

Item {
    anchors.fill: parent
    property alias imageSource: image.source
    property alias fileName: fileName.text
    property alias imageType: imageType.text
    property alias imageColor: imageColor.text
    property alias imageWidth: imageWidth.text
    property alias imageHeight: imageHeight.text
    property alias redHistogramSeries: redHistogramSeries
    property alias greenHistogramSeries: greenHistogramSeries
    property alias blueHistogramSeries: blueHistogramSeries
    property alias greyHistogramSeries: greyHistogramSeries
    property double maxYAxis: 0

    Rectangle {
        id: infoSpace
        y: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.375
        color: "#00000000"
        border.color: "#00000000"

        Rectangle {
            id: infoTitleContainer
            width: parent.width * 0.4
            height: parent.height * 0.15
            anchors.left: parent.left
            anchors.top: parent.top
            color: "#00000000"
            border.color: "#00000000"

            Text {
                id: infoTitle
                width: parent.width
                height: parent.height * 0.8
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("INFO")
                font.bold: true
                color: "#ffffff"
                font.family: "Arial"
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignTop
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: infoContainer
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.height * 0.85
            color: "#475767"

            Flickable {
                id: imageFlickable
                anchors.right: parent.right
                anchors.top: parent.top
                width: parent.width * 0.525
                height: parent.height
                flickableDirection: Flickable.HorizontalFlick
                clip: true

                Image {
                    id: image
                    fillMode: Image.PreserveAspectFit
                    height: parent.height
                    anchors.right: parent.right
                    anchors.top: parent.top
                }
            }

            Column {
                id: infoColumn
                width: parent.width * 0.4
                height: parent.height * 0.8
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05

                Rectangle {
                    id: fileNameContainer
                    width: parent.width
                    height: parent.height * 0.15
                    color: "#00000000"
                    border.color: "#00000000"

                    Text {
                        id: fileNameLabel
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: parent.width * 0.4
                        height: parent.height * 0.9
                        text: qsTr("Name:")
                        color: "#ababab"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }

                    Flickable {
                        id: fileNameFlickable
                        anchors.right: parent.right
                        anchors.top: parent.top
                        width: parent.width * 0.6
                        height: parent.height * 0.9
                        flickableDirection: Flickable.HorizontalFlick
                        clip: true

                        Text {
                            id: fileName
                            anchors.fill: parent
                            color: "#d8d8d8"
                            font.pixelSize: 12
                            font.capitalization: Font.AllUppercase
                            font.family: "Arial"
                            fontSizeMode: Text.Fit
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                Rectangle {
                    id: imageTypeContainer
                    width: parent.width
                    height: parent.height * 0.15
                    color: "#00000000"
                    border.color: "#00000000"
                    Text {
                        id: imageTypeLabel
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: parent.width * 0.4
                        height: parent.height * 0.9
                        text: qsTr("Type:")
                        color: "#ababab"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }

                    Text {
                        id: imageType
                        anchors.right: parent.right
                        anchors.top: parent.top
                        width: parent.width * 0.6
                        height: parent.height * 0.9
                        color: "#d8d8d8"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }

                Rectangle {
                    id: imageColorContainer
                    width: parent.width
                    height: parent.height * 0.15
                    color: "#00000000"
                    border.color: "#00000000"
                    Text {
                        id: imageColorLabel
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: parent.width * 0.4
                        height: parent.height * 0.9
                        text: qsTr("Color:")
                        color: "#ababab"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }

                    Text {
                        id: imageColor
                        anchors.right: parent.right
                        anchors.top: parent.top
                        width: parent.width * 0.6
                        height: parent.height * 0.9
                        color: "#d8d8d8"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }

                Rectangle {
                    id: imageWidthContainer
                    width: parent.width
                    height: parent.height * 0.15
                    color: "#00000000"
                    border.color: "#00000000"
                    Text {
                        id: imageWidthLabel
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: parent.width * 0.4
                        height: parent.height * 0.9
                        text: qsTr("Width:")
                        color: "#ababab"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }

                    Text {
                        id: imageWidth
                        anchors.right: parent.right
                        anchors.top: parent.top
                        width: parent.width * 0.6
                        height: parent.height * 0.9
                        color: "#d8d8d8"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }

                Rectangle {
                    id: imageHeightContainer
                    width: parent.width
                    height: parent.height * 0.15
                    color: "#00000000"
                    border.color: "#00000000"
                    Text {
                        id: imageHeightLabel
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: parent.width * 0.4
                        height: parent.height * 0.9
                        text: qsTr("Height:")
                        color: "#ababab"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }

                    Text {
                        id: imageHeight
                        anchors.right: parent.right
                        anchors.top: parent.top
                        width: parent.width * 0.6
                        height: parent.height * 0.9
                        color: "#d8d8d8"
                        font.family: "Arial"
                        fontSizeMode: Text.Fit
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }
            }
        }
    }

    Rectangle {
        id: histogramSpace
        anchors.top: infoSpace.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.55
        color: "#00000000"
        border.color: "#00000000"

        Rectangle {
            id: histogramTitleContainer
            width: parent.width * 0.4
            height: parent.height * 0.11
            anchors.left: parent.left
            anchors.top: parent.top
            color: "#00000000"
            border.color: "#00000000"

            Text {
                id: histogramTitle
                width: parent.width
                height: parent.height * 0.8
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("HISTOGRAM")
                font.bold: true
                color: "#ffffff"
                font.family: "Arial"
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignTop
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: histogramContainer
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.height * 0.89
            color: "#475767"

            ChartView {
                anchors.fill: parent
                backgroundColor: "#475767"
                theme: ChartView.ChartThemeDark
                margins.top: parent.height * 0.025
                margins.bottom: parent.height * 0.025
                margins.left: parent.width * 0.025
                margins.right: parent.width * 0.025
                legend.visible: false

                ValueAxis {
                    id: xAxis
                    min: 0
                    max: 255
                    tickCount: 2
                    labelFormat: "%.0f"
                    labelsColor: "#ababab"
                    labelsFont: Qt.font({pixelSize: 12})
                    gridVisible: false
                    color: "#ababab"
                }

                ValueAxis {
                    id: yAxis
                    min: 0
                    max: maxYAxis
                    tickCount: 2
                    labelFormat: "%.0f"
                    labelsColor: "#ababab"
                    labelsFont: Qt.font({pixelSize: 9})
                    gridVisible: false
                    color: "#ababab"
                }

                LineSeries {
                    id: "redHistogramSeries"
                    axisX: xAxis
                    axisY: yAxis
                    width: 2
                    color: '#fc635d'
                }

                LineSeries {
                    id: "greenHistogramSeries"
                    axisX: xAxis
                    axisY: yAxis
                    width: 2
                    color: '#4dd4ad'
                }

                LineSeries {
                    id: "blueHistogramSeries"
                    axisX: xAxis
                    axisY: yAxis
                    width: 2
                    color: '#5389db'
                }

                LineSeries {
                    id: "greyHistogramSeries"
                    axisX: xAxis
                    axisY: yAxis
                    width: 2
                    color: '#d8d8d8'
                }
            }
        }
    }
}
