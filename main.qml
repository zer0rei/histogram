import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    id: myMainWindow
    visible: true
    minimumWidth: 540
    minimumHeight: 400
    width: 640
    height: 480
    title: qsTr("Histogram")
    signal fileChanged(url myUrl)

    // Histogram Calculated Slot
    function onHistogramCalculated(url, isGrayscale, width, height) {
        myMainForm.mainContainer.setOutput(url, isGrayscale, width, height,
                                           imageManipulator.histogramRed,
                                           imageManipulator.histogramGreen,
                                           imageManipulator.histogramBlue);
    }

    ImageDialog {
        id: myImageDialog
        onFileChosen: {
            fileChosen.connect(myMainForm.imageListView.addModelElement)
        }
    }

    AboutWindow {
        id: myAboutWindow
    }

    MainForm {
        id: myMainForm

        // imageListView Signals
        imageListView.onCurrentFileChanged: {
            fileChanged(currentUrl);
        }

        imageListView.onModelEmptied: {
            myMainForm.imageListView.modelEmptied.connect(mainContainer.changeState)
        }

        // loadIcon Mouse Signals
        loadMouseArea.onClicked: {
            if (!myImageDialog.isVisible) {
                myImageDialog.isVisible = true;
            }
        }

        // main Mouse Signals
        mainMouseArea.onClicked: {
            if (!myImageDialog.isVisible) {
                myImageDialog.isVisible = true;
            }
        }

        // about Mouse Signals
        aboutMouseArea.onClicked: {
            if (!myAboutWindow.visible) {
                myAboutWindow.visible = true;
            }
        }

        aboutMouseArea.onEntered: {
            about.opacity = 1;
        }

        aboutMouseArea.onExited: {
            about.opacity = 0.7;
        }

        aboutMouseArea.onPressed: {
            about.opacity = 0.5;
        }

        aboutMouseArea.onReleased: {
            if (aboutMouseArea.containsMouse)
                about.opacity = 1;
            else
                about.opacity = 0.7;
        }

    }
}
