#ifndef IMAGEMANIPULATOR_H
#define IMAGEMANIPULATOR_H

#include <QObject>
#include <QDebug>
#include <QImage>
#include <QVector>
#include <QUrl>

class ImageManipulator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<int> histogramRed READ histogramRed)
    Q_PROPERTY(QVector<int> histogramGreen READ histogramGreen)
    Q_PROPERTY(QVector<int> histogramBlue READ histogramBlue)
    Q_PROPERTY(QVector<int> manipHistogramRed READ manipHistogramRed)
    Q_PROPERTY(QVector<int> manipHistogramGreen READ manipHistogramGreen)
    Q_PROPERTY(QVector<int> manipHistogramBlue READ manipHistogramBlue)

public:
    explicit ImageManipulator(QObject *parent = nullptr);
    void initHistogram(QVector<int>* histogram);
    void calculateHistogram();
    void calculateHistogramNegative();
    QVector<int> equalizeTransformation(QVector<int> histogram);
    void calculateHistogramEqualization();
    int otsuTreshold(QVector<int> in_histogram);
    void calculateHistogramTreshold();

    // Property Getters
    QVector<int> histogramRed() const;
    QVector<int> histogramGreen() const;
    QVector<int> histogramBlue() const;
    QVector<int> manipHistogramRed() const;
    QVector<int> manipHistogramGreen() const;
    QVector<int> manipHistogramBlue() const;

private:
    QUrl url;
    QImage image;
    const int HISTOGRAM_SIZE = 256;
    QVector<int> m_histogramRed;
    QVector<int> m_histogramGreen;
    QVector<int> m_histogramBlue;
    QVector<int> m_manipHistogramRed;
    QVector<int> m_manipHistogramGreen;
    QVector<int> m_manipHistogramBlue;

signals:
    void histogramCalculated(QVariant url, QVariant isGryscale, QVariant width, QVariant height);
    void manipCalculated(QVariant name, QVariant isGrayscale);

public slots:
    void loadImage(QUrl url);
    void loadManipulation(QString name);

};

#endif // IMAGEMANIPULATOR_H
