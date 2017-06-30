#include <math.h>
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

QVector<int> ImageManipulator::manipHistogramRed() const {
    return m_manipHistogramRed;
}

QVector<int> ImageManipulator::manipHistogramGreen() const {
    return m_manipHistogramGreen;
}

QVector<int> ImageManipulator::manipHistogramBlue() const {
    return m_manipHistogramBlue;
}

void ImageManipulator::loadImage(QUrl myUrl) {
    if (!myUrl.isValid())
        return;

    url = myUrl;
    image.load(url.path());
    calculateHistogram();
    emit histogramCalculated(url, image.isGrayscale(), image.width(), image.height());
}

void ImageManipulator::loadManipulation(QString name) {
    if (!url.isValid())
        return;

    if (name == QString("raw")) {
        emit histogramCalculated(url, image.isGrayscale(), image.width(), image.height());
        return;
    }
    else if (name == QString("negative")) {
        calculateHistogramNegative();
    }
    else if (name == QString("equalize")) {
        calculateHistogramEqualization();
    }
    else if (name == QString("treshold")) {
        calculateHistogramTreshold();
    }
    else {
        return;
    }

    emit manipCalculated(name, image.isGrayscale());
}

void ImageManipulator::calculateHistogram() {
    if (image.isNull())
        return;

    initHistogram(&m_histogramRed);
    initHistogram(&m_histogramGreen);
    initHistogram(&m_histogramBlue);

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

void ImageManipulator::calculateHistogramNegative() {
    if (image.isNull())
        return;

    initHistogram(&m_manipHistogramRed);
    initHistogram(&m_manipHistogramGreen);
    initHistogram(&m_manipHistogramBlue);

    for (int i = 0; i < HISTOGRAM_SIZE; i++) {
        m_manipHistogramRed[i] = m_histogramRed[HISTOGRAM_SIZE - 1 - i];
        m_manipHistogramGreen[i] = m_histogramGreen[HISTOGRAM_SIZE - 1 - i];
        m_manipHistogramBlue[i] = m_histogramBlue[HISTOGRAM_SIZE - 1 - i];
    }
}

void ImageManipulator::calculateHistogramEqualization() {
    if (image.isNull())
        return;

    initHistogram(&m_manipHistogramRed);
    initHistogram(&m_manipHistogramGreen);
    initHistogram(&m_manipHistogramBlue);

    QVector<int> redTransformation = equalizeTransformation(m_histogramRed);
    QVector<int> greenTransformation = equalizeTransformation(m_histogramGreen);
    QVector<int> blueTransformation = equalizeTransformation(m_histogramBlue);

    QColor currentColor;
    for (int i = 0; i < image.width(); i++) {
        for (int j = 0; j < image.height(); j++) {
            currentColor = image.pixelColor(i, j);
            m_manipHistogramRed[redTransformation[currentColor.red()]]++;
            m_manipHistogramGreen[greenTransformation[currentColor.green()]]++;
            m_manipHistogramBlue[blueTransformation[currentColor.blue()]]++;
        }
    }
}

QVector<int> ImageManipulator::equalizeTransformation(QVector<int> in_histogram) {
    int pixel_count = image.width() * image.height();
    int i = 0;
    while (!in_histogram[i]) {
        i++;
    }

    if (in_histogram[i] == pixel_count)
        return in_histogram;

    QVector<int> transformation;
    initHistogram(&transformation);
    double scale = (HISTOGRAM_SIZE - 1.) / (pixel_count - in_histogram[i]);

    int sum = 0;
    for (; i < HISTOGRAM_SIZE; i++) {
        sum += in_histogram[i];
        transformation[i] = fmax(0, fmin(int(round(sum * scale)), HISTOGRAM_SIZE - 1));
    }

    return transformation;
}

void ImageManipulator::calculateHistogramTreshold() {
    if (image.isNull())
        return;

    initHistogram(&m_manipHistogramRed);
    initHistogram(&m_manipHistogramGreen);
    initHistogram(&m_manipHistogramBlue);

    int redTreshold = otsuTreshold(m_histogramRed);
    int greenTreshold = otsuTreshold(m_histogramGreen);
    int blueTreshold = otsuTreshold(m_histogramBlue);

    QColor currentColor;
    for (int i = 0; i < image.width(); i++) {
        for (int j = 0; j < image.height(); j++) {
            currentColor = image.pixelColor(i, j);
            m_manipHistogramRed[currentColor.red() >= redTreshold ? 255 : 0]++;
            m_manipHistogramGreen[currentColor.green() >= greenTreshold ? 255 : 0]++;
            m_manipHistogramBlue[currentColor.blue() >= blueTreshold ? 255 : 0]++;
        }
    }

}

int ImageManipulator::otsuTreshold(QVector<int> in_histogram) {
    int pixel_count = image.width() * image.height();
    int sum = 0;
    int sumB = 0;
    int wB = 0;
    int wF = 0;
    int mB;
    int mF;
    int max = 0;
    int middle;
    int seuil = 0;

    for (int i = 0; i < 256; ++i) {
      wB += in_histogram[i];
      if (wB == 0)
        continue;
      wF = pixel_count - wB;
      if (wF == 0)
        break;
      sumB += i * in_histogram[i];
      mB = sumB / wB;
      mF = (sum - sumB) / wF;
      middle = wB * wF * ((mB - mF) * (mB - mF));
      if (middle > max) {
        max = middle;
        seuil = i;
      }
    }

    return seuil;
}

void ImageManipulator::initHistogram(QVector<int>* histogram) {
    // Size
    histogram->resize(HISTOGRAM_SIZE);
    // Fill
    histogram->fill(0);
}
