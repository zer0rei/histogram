#include "imagemanipulator.h"

ImageManipulator::ImageManipulator(QObject *parent) : QObject(parent) {
}

QVector<int> ImageManipulator::histogramRed() const {
    return m_histogramRed;
}

QVector<int> ImageManipulator::histogramGreen() const {
    return m_histogramGreen;
}

QVector<int> ImageManipulator::histogramBlue() const {
    return m_histogramBlue;
}

void ImageManipulator::loadImage(QUrl url) {
    if (!url.isValid())
        return;

    image.load(url.path());
    calculateHistogram();
    emit histogramCalculated(url, image.isGrayscale(), image.width(), image.height());
}

void ImageManipulator::calculateHistogram() {
    if (image.isNull())
        return;

    initHistogram();

    QColor currentColor;
    for (int i = 0; i < image.width(); i++) {
        for (int j = 0; j < image.height(); j++) {
            currentColor = image.pixelColor(i, j);
            m_histogramRed[currentColor.red()]++;
            m_histogramGreen[currentColor.green()]++;
            m_histogramBlue[currentColor.blue()]++;
        }
    }
}

void ImageManipulator::initHistogram() {
    // Size
    m_histogramRed.resize(HISTOGRAM_SIZE);
    m_histogramGreen.resize(HISTOGRAM_SIZE);
    m_histogramBlue.resize(HISTOGRAM_SIZE);
    // Fill
    m_histogramRed.fill(0);
    m_histogramGreen.fill(0);
    m_histogramBlue.fill(0);
}
