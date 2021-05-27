/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "FractalCoreApplication.h"

// Berry
#include <berryPlatformUI.h>
#include <berryQtWorkbenchAdvisor.h>

#include <QPoint>
#include <QtWidgets/QWidget>

class FractalCoreCustomWorkbenchWindowAdvisor : public QObject, public berry::WorkbenchWindowAdvisor {
public:
    FractalCoreCustomWorkbenchWindowAdvisor::FractalCoreCustomWorkbenchWindowAdvisor(
        berry::IWorkbenchWindowConfigurer::Pointer configurer)
        : berry::WorkbenchWindowAdvisor(configurer)
    {
    }

    FractalCoreCustomWorkbenchWindowAdvisor::~FractalCoreCustomWorkbenchWindowAdvisor()
    {
    }

    void FractalCoreCustomWorkbenchWindowAdvisor::PostWindowOpen() {
        
        berry::IWorkbenchWindowConfigurer::Pointer configurer = this->GetWindowConfigurer();
        
        configurer->SetWindowFlags(Qt::Window | Qt::FramelessWindowHint);
        berry::Shell::Pointer shell = configurer->GetWindow()->GetShell();

        QWidget* win = shell->GetControl();
        
    }

    void FractalCoreCustomWorkbenchWindowAdvisor::PreWindowOpen()
    {
        berry::IWorkbenchWindowConfigurer::Pointer configurer = this->GetWindowConfigurer();

        configurer->SetInitialSize(QPoint(600, 400));
        configurer->SetTitle("Bismillah");
        configurer->SetShowMenuBar(true);
        configurer->SetShowToolBar(true);
        configurer->SetShowPerspectiveBar(true);
        configurer->SetShowStatusLine(true);
        
    }

    void FractalCoreCustomWorkbenchWindowAdvisor::CreateWindowContents(berry::Shell::Pointer shell)
    {
        WorkbenchWindowAdvisor::CreateWindowContents(shell);
    }
};


class FractalCoreApplicationWorkbenchAdvisor : public berry::WorkbenchAdvisor
{
public:
  static const QString DEFAULT_PERSPECTIVE_ID;

  berry::WorkbenchWindowAdvisor *CreateWorkbenchWindowAdvisor(berry::IWorkbenchWindowConfigurer::Pointer configurer) override
  {
    return new FractalCoreCustomWorkbenchWindowAdvisor(configurer);
  }

  void Initialize(berry::IWorkbenchConfigurer::Pointer configurer) override
  {
    // do nothing
  }

  QString GetInitialWindowPerspectiveId() override { return DEFAULT_PERSPECTIVE_ID; }
};

const QString FractalCoreApplicationWorkbenchAdvisor::DEFAULT_PERSPECTIVE_ID = "bismillah.fractal.core.prespective";

FractalCoreApplication::FractalCoreApplication()
{
}

FractalCoreApplication::~FractalCoreApplication()
{
}

QVariant FractalCoreApplication::Start(berry::IApplicationContext * /*context*/)
{
  QScopedPointer<berry::Display> display(berry::PlatformUI::CreateDisplay());

  QScopedPointer<FractalCoreApplicationWorkbenchAdvisor> wbAdvisor(new FractalCoreApplicationWorkbenchAdvisor());
  int code = berry::PlatformUI::CreateAndRunWorkbench(display.data(), wbAdvisor.data());

  // exit the application with an appropriate return code
  return code == berry::PlatformUI::RETURN_RESTART ? EXIT_RESTART : EXIT_OK;
}

void FractalCoreApplication::Stop()
{
}
