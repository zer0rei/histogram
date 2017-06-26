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

public:
    explicit ImageManipulator(QObject *parent = nullptr);
    void calculateHistogram();
    void initHistogram();
    QVector<int> histogramRed() const;
    QVector<int> histogramGreen() const;
    QVector<int> histogramBlue() const;

private:
    QImage image;
    const int HISTOGRAM_SIZE = 256;
    QVector<int> m_histogramRed;
    QVector<int> m_histogramGreen;
    QVector<int> m_histogramBlue;

signals:
    void histogramCalculated(QVariant url, QVariant isGreyscale, QVariant width, QVariant height);

public slots:
    void loadImage(QUrl url);
};

#endif // IMAGEMANIPULATOR_H
