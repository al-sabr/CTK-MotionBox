/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "FractalCoreActivator.h"
#include "FractalCoreApplication.h"
#include "FractalCorePerspective.h"
#include "EmptyView1.h"

#include "berryMacros.h"

void FractalCoreActivator::start(ctkPluginContext *context)
{
  BERRY_REGISTER_EXTENSION_CLASS(FractalCoreApplication, context)
  BERRY_REGISTER_EXTENSION_CLASS(FractalCorePerspective, context)
  BERRY_REGISTER_EXTENSION_CLASS(EmptyView1, context)
}

void FractalCoreActivator::stop(ctkPluginContext *context)
{
  Q_UNUSED(context)
}
