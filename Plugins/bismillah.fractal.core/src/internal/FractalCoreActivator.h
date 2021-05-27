/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#ifndef FRACTALCOREACTIVATOR_H
#define FRACTALCOREACTIVATOR_H

#include <ctkPluginActivator.h>

class FractalCoreActivator : public QObject, public ctkPluginActivator
{
  Q_OBJECT
  Q_PLUGIN_METADATA(IID "bismillah_fractal_core")
  Q_INTERFACES(ctkPluginActivator)

public:
  void start(ctkPluginContext *context) override;
  void stop(ctkPluginContext *context) override;

};

#endif // FRACTALCOREACTIVATOR_H
