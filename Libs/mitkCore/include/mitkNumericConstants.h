/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#ifndef MITKNUMERICCONSTANTS_H_
#define MITKNUMERICCONSTANTS_H_

#include <MitkCoreExports.h>

namespace mitk
{
  typedef double ScalarType;

  MITK_CORE_EXPORT extern const ScalarType eps;
  MITK_CORE_EXPORT extern const ScalarType sqrteps;
  MITK_CORE_EXPORT extern const double large;
}

#endif // MITKNUMERICCONSTANTS_H_
