/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "FractalCorePerspective.h"

// Berry
#include "berryIViewLayout.h"

FractalCorePerspective::FractalCorePerspective()
{
}

void FractalCorePerspective::CreateInitialLayout(berry::IPageLayout::Pointer layout)
{
	// Editors are placed for free.
	QString editorAreaId = layout->GetEditorArea();

	//! [Visibility of editor area]
	// set editor area to visible
	layout->SetEditorAreaVisible(true);
	//! [Visibility of editor area]
	//! 

	layout->AddView("bismillah.fractal.core.emptyview1", berry::IPageLayout::LEFT, 1.0f, editorAreaId);
	
}
