import QtQuick 2.0

Item {
    id: mainSpaceContainer
    property alias mainMouseArea: mainMouseArea

    Image {
        id: loadImage
        width: ((parent.width < parent.height) ? parent.width : parent.height) * 0.75
        height: width
        opacity: 0.9
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/load_image.svg"

        MouseArea {
            id: mainMouseArea
            width: parent.width
            height: parent.height
        }
    }

    MainSpaceOutput {
        id: outputSpace
        visible: false
    }

    function changeState(isModelEmpty) {
        if (isModelEmpty === true) {
            mainSpaceContainer.state = ""
        } else {
            mainSpaceContainer.state = "imageChosen"
        }
    }

    function setOutput(url, isGrayscale, width, height, histogramRed, histogramGreen, histogramBlue) {
        var str = url.toString();
        outputSpace.imageSource = url;
        outputSpace.fileName = str.replace(/^.*[\\\/](.*)\..*$/, '$1');
        outputSpace.imageType = str.replace(/.*\.(.*)$/, '$1').toUpperCase();
        outputSpace.imageColor = (isGrayscale === true) ? 'GRAYSCALE' : 'RGB';
        outputSpace.imageWidth = width;
        outputSpace.imageHeight = height;

        // Calculate max for chart yAxis
        var arr = histogramRed.concat(histogramGreen, histogramBlue);
        var maxArray = arr.reduce(function(a, b) {
            return (a >= b) ? a : b;
        });
        outputSpace.maxYAxis = maxArray;

        // Empty series then add histogram points
        if (outputSpace.redHistogramSeries.count === 256)
            outputSpace.redHistogramSeries.removePoints(0, 256);
        if (outputSpace.greenHistogramSeries.count === 256)
            outputSpace.greenHistogramSeries.removePoints(0, 256);
        if (outputSpace.blueHistogramSeries.count === 256)
            outputSpace.blueHistogramSeries.removePoints(0, 256);
        if (outputSpace.greyHistogramSeries.count === 256)
            outputSpace.greyHistogramSeries.removePoints(0, 256);
        for (var i = 0; i < 256; i++) {
            if (isGrayscale)
                outputSpace.greyHistogramSeries.append(i, histogramRed[i]);
            else {
                outputSpace.redHistogramSeries.append(i, histogramRed[i]);
                outputSpace.greenHistogramSeries.append(i, histogramGreen[i]);
                outputSpace.blueHistogramSeries.append(i, histogramBlue[i]);
            }
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges {
                target: loadImage
                visible: true
            }
            PropertyChanges {
                target: outputSpace
                visible: false
            }
        },
        State {
            name: "imageChosen"
            PropertyChanges {
                target: loadImage
                visible: false
            }
            PropertyChanges {
                target: outputSpace
                visible: true
            }
        }

    ]
}
