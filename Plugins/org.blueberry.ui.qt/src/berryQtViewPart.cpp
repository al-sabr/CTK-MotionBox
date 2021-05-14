/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "berryQtViewPart.h"

namespace berry
{

void QtViewPart::CreatePartControl(QWidget* parent)
{
  this->CreateQtPartControl(static_cast<QWidget*>(parent));
}

}
