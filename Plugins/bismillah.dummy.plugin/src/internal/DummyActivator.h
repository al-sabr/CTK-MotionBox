#ifndef DUMMYACTIVATOR
#define DUMMYACTIVATOR

#include <ctkPluginActivator.h>

class DummyActivator : public QObject, public ctkPluginActivator
{
  Q_OBJECT
  Q_PLUGIN_METADATA(IID "bismillah_dummy_plugin")
  Q_INTERFACES(ctkPluginActivator)

public:
  void start(ctkPluginContext *context) override;
  void stop(ctkPluginContext *context) override;

private:
  //static ctkPluginContext* context;
};

#endif // MOTIONBOXACTIVATOR
