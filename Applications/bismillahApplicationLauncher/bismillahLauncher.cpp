/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include <mitkBaseApplication.h>

#include <QFileInfo>
#include <QVariant>

int main(int argc, char **argv)
{
  mitk::BaseApplication app(argc, argv);
  app.setApplicationName("bismillah");
  app.setOrganizationName("Ar-Rahman/Ar-Rahim Foundation");

  // Preload the org.blueberry.core.expressions plugin to work around a bug in
    // GCC that leads to undefined symbols while loading certain libraries even though
    // the symbols are actually defined.
#if defined __GNUC__ && !defined __clang__
  auto library = QFileInfo(argv[0]).dir().path() + "/../lib/plugins/liborg_blueberry_core_expressions.so";

  if (!QFileInfo(library).exists())
      library = "liborg_blueberry_core_expressions";

  app.setPreloadLibraries(QStringList() << library);
#endif

  QString appId = "bismillah.fractal.core.application";

  app.setProperty(mitk::BaseApplication::PROP_APPLICATION, appId);

  // Run the workbench.
  return app.run();
}
