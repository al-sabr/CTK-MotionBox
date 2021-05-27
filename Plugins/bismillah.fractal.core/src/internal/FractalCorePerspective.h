/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#ifndef FractalCorePerspective_H_
#define FractalCorePerspective_H_

// Berry
#include <berryIPerspectiveFactory.h>

// Qt
#include <QObject>

class FractalCorePerspective : public QObject, public berry::IPerspectiveFactory
{
  Q_OBJECT
  Q_INTERFACES(berry::IPerspectiveFactory)

public:
	FractalCorePerspective();

  void CreateInitialLayout(berry::IPageLayout::Pointer layout) override;
};

#endif /* MotionBoxPerspective_H_ */
