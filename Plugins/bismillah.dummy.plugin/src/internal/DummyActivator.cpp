#include "DummyActivator.h"
#include "MediaPerspective.h"

// Qt includes
#ifdef QT_4
#include <QDeclarativeComponent>
#else
#include <QQmlComponent>
#endif

// Application includes
#include "ControllerCore.h"
#include "WControllerView"
#include <WMockApplication>
#include <WControllerView>
#include <WControllerApplication.h>

void DummyActivator::start(ctkPluginContext *context)
{
  WMockApplication::create(nullptr, WControllerApplication::Type::Single);

  //---------------------------------------------------------------------------------------------
  // Controllers

  W_CREATE_CONTROLLER(WControllerView);

  //---------------------------------------------------------------------------------------------
  // MetaType registering
  //---------------------------------------------------------------------------------------------

  qRegisterMetaType<QIODevice*>("QIODevice *");

  qRegisterMetaType<QList<QUrl> >("QList<QUrl>");

  //---------------------------------------------------------------------------------------------
  // Controllers @ MotionBox/main.cpp § line #42

  W_CREATE_CONTROLLER(ControllerCore);

  #ifdef SK_DESKTOP
      core->applyArguments(0, nullptr);
  #endif

      //---------------------------------------------------------------------------------------------

  #ifndef SK_DEPLOY
      sk->setQrc(false);
  #endif

  sk->startScript();

  BERRY_REGISTER_EXTENSION_CLASS(MediaPerspective, context)
}

void DummyActivator::stop(ctkPluginContext *context)
{
  Q_UNUSED(context)

}
