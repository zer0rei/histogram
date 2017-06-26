#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "imagemanipulator.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    ImageManipulator imageManipulator;
    QObject::connect(window, SIGNAL(fileChanged(QUrl)),
                         &imageManipulator, SLOT(loadImage(QUrl)));

    QObject::connect(&imageManipulator, SIGNAL(histogramCalculated(QVariant, QVariant, QVariant, QVariant)),
                                               window, SLOT(onHistogramCalculated(QVariant, QVariant, QVariant, QVariant)));

    // Context Properties
    engine.rootContext()->setContextProperty("imageManipulator", &imageManipulator);

    return app.exec();
}
