/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "berryQtWorkbenchPresentationFactory.h"

#include "berryNativeTabFolder.h"
#include "berryEmptyTabFolder.h"
#include "berryShell.h"
#include "berryIMemento.h"

#include "internal/util/berryPresentablePartFolder.h"
#include "internal/util/berryTabbedStackPresentation.h"

#include "internal/berryQtSash.h"
#include <internal/berryQtControlWidget.h>

#include <QtWidgets/QApplication>

namespace berry
{

QtWorkbenchPresentationFactory::QtWorkbenchPresentationFactory()
{}

QtWorkbenchPresentationFactory::QtWorkbenchPresentationFactory(
  const QtWorkbenchPresentationFactory& /*other*/)
  : QObject()
{

}

StackPresentation::Pointer QtWorkbenchPresentationFactory::CreateEditorPresentation(
    QWidget* parent, IStackPresentationSite::Pointer site)
{
  auto   folder = new NativeTabFolder(parent);

  //    /*
  //     * Set the minimum characters to display, if the preference is something
  //     * other than the default. This is mainly intended for RCP applications
  //     * or for expert users (i.e., via the plug-in customization file).
  //     *
  //     * Bug 32789.
  //     */
  //    final IPreferenceStore store = PlatformUI.getPreferenceStore();
  //    if (store
  //        .contains(IWorkbenchPreferenceConstants.EDITOR_MINIMUM_CHARACTERS)) {
  //      final int minimumCharacters = store
  //          .getInt(IWorkbenchPreferenceConstants.EDITOR_MINIMUM_CHARACTERS);
  //      if (minimumCharacters >= 0) {
  //        folder.setMinimumCharacters(minimumCharacters);
  //      }
  //    }

  auto   partFolder = new PresentablePartFolder(folder);

  StackPresentation::Pointer result(new TabbedStackPresentation(site,
      partFolder)); //, new StandardEditorSystemMenu(site));

  //  DefaultThemeListener themeListener =
  //      new DefaultThemeListener(folder, result.getTheme());
  //  result.getTheme().addListener(themeListener);
  //
  //  new DefaultMultiTabListener(result.getApiPreferences(), IWorkbenchPreferenceConstants.SHOW_MULTIPLE_EDITOR_TABS, folder);
  //
  //  new DefaultSimpleTabListener(result.getApiPreferences(), IWorkbenchPreferenceConstants.SHOW_TRADITIONAL_STYLE_TABS, folder);

  return result;
}

StackPresentation::Pointer QtWorkbenchPresentationFactory::CreateViewPresentation(
    QWidget* parent, IStackPresentationSite::Pointer site)
{

  auto   folder = new NativeTabFolder(static_cast<QWidget*> (parent));

  //    final IPreferenceStore store = PlatformUI.getPreferenceStore();
  //    final int minimumCharacters = store
  //        .getInt(IWorkbenchPreferenceConstants.VIEW_MINIMUM_CHARACTERS);
  //    if (minimumCharacters >= 0) {
  //      folder.setMinimumCharacters(minimumCharacters);
  //    }

  auto   partFolder = new PresentablePartFolder(folder);

  //folder->SetUnselectedCloseVisible(false);
  //folder->SetUnselectedImageVisible(true);

  StackPresentation::Pointer result(new TabbedStackPresentation(site,
      partFolder)); //, new StandardViewSystemMenu(site));

  //  DefaultThemeListener themeListener =
  //      new DefaultThemeListener(folder, result.getTheme());
  //  result.getTheme().addListener(themeListener);
  //
  //  new DefaultSimpleTabListener(result.getApiPreferences(), IWorkbenchPreferenceConstants.SHOW_TRADITIONAL_STYLE_TABS, folder);

  return result;
}

StackPresentation::Pointer QtWorkbenchPresentationFactory::CreateStandaloneViewPresentation(
    QWidget* parent, IStackPresentationSite::Pointer site, bool showTitle)
{

  if (showTitle)
  {
    return this->CreateViewPresentation(parent, site);
  }
  auto   folder = new EmptyTabFolder(static_cast<QWidget*> (parent),
      true);
  StackPresentation::Pointer presentation(new TabbedStackPresentation(site,
      folder)); //, new StandardViewSystemMenu(site));

  return presentation;
}

QString QtWorkbenchPresentationFactory::GetId()
{
  return "berryQtWorkbenchPresentationFactory";
}

QWidget* QtWorkbenchPresentationFactory::CreateSash(QWidget* parent, int style)
{
  Qt::Orientation orientation =
      style & SASHORIENTATION_HORIZONTAL ? Qt::Horizontal : Qt::Vertical;
  QWidget* sash = new QtSash(orientation, static_cast<QWidget*> (parent));
  sash->setObjectName("Sash widget");
  if (orientation == Qt::Horizontal)
    sash->setFixedHeight(this->GetSashSize(style));
  else
    sash->setFixedWidth(this->GetSashSize(style));

  return sash;
}

int QtWorkbenchPresentationFactory::GetSashSize(int /*style*/)
{
  return 3;
}

void QtWorkbenchPresentationFactory::UpdateTheme()
{
  QWidgetList topLevels = QApplication::topLevelWidgets();
  QListIterator<QWidget*> topIt(topLevels);
  while (topIt.hasNext())
  {
    QWidget* topWidget = topIt.next();
    QList<NativeTabFolder*> folders =
        topWidget->findChildren<NativeTabFolder*> ();
    QListIterator<NativeTabFolder*> i(folders);
    while (i.hasNext())
    {
      i.next()->UpdateColors();
    }
  }
}

}
