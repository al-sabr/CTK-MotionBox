#ifndef MEDIAPERSPECTIVE
#define MEDIAPERSPECTIVE

// Berry
#include <berryIPerspectiveFactory.h>

// Qt
#include <QObject>

class MediaPerspective : public QObject, public berry::IPerspectiveFactory
{
  Q_OBJECT
  Q_INTERFACES(berry::IPerspectiveFactory)

public:
  /** Standard constructor.*/
  MediaPerspective();
  /** Standard destructor.*/
  ~MediaPerspective() override;

  void CreateInitialLayout(berry::IPageLayout::Pointer layout) override;
};

#endif /* MEDIAPERSPECTIVE */
