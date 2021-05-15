file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/qclickablelabel.cpp
  src/QmitkAboutDialog.cpp
  src/QmitkBasePropertyView.cpp
  src/QmitkBoolPropertyWidget.cpp
  src/QmitkBoundingObjectWidget.cpp
  src/QmitkCallbackFromGUIThread.cpp
  src/QmitkColorPropertyEditor.cpp
  src/QmitkColorPropertyView.cpp
  src/QmitkColorTransferFunctionCanvas.cpp
  src/QmitkCrossWidget.cpp
  src/QmitkEditPointDialog.cpp
  src/QmitkEnumerationPropertyWidget.cpp
  src/QmitkFFmpegWriter.cpp
  src/QmitkFileChooser.cpp
  src/QmitkGnuplotWidget.cpp
  src/QmitkHistogram.cpp
  src/QmitkHotkeyLineEdit.cpp
  src/QmitkModulesDialog.cpp
  src/QmitkModuleTableModel.cpp
  src/QmitkNumberPropertyEditor.cpp
  src/QmitkNumberPropertySlider.cpp
  src/QmitkNumberPropertyView.cpp
  src/QmitkPiecewiseFunctionCanvas.cpp
  src/QmitkPlotDialog.cpp
  src/QmitkPlotWidget.cpp
  src/QmitkPointListModel.cpp
  src/QmitkPointListView.cpp
  src/QmitkPointListViewWidget.cpp
  src/QmitkPointListWidget.cpp
  src/QmitkPrimitiveMovieNavigatorWidget.cpp
  src/QmitkPropertyViewFactory.cpp
  #src/QmitkPropertyListPopup.cpp
  src/QmitkSelectableGLWidget.cpp
  src/QmitkSliceWidget.cpp
  src/QmitkSliderNavigatorWidget.cpp
  src/QmitkStandardViews.cpp
  src/QmitkStepperAdapter.cpp
  src/QmitkStringPropertyEditor.cpp
  src/QmitkStringPropertyOnDemandEdit.cpp
  src/QmitkStringPropertyView.cpp
  src/QmitkTransferFunctionCanvas.cpp
  src/QmitkTransferFunctionGeneratorWidget.cpp
  src/QmitkTransferFunctionWidget.cpp
  src/QmitkUGCombinedRepresentationPropertyWidget.cpp
  src/QmitkVideoBackground.cpp
  src/QtWidgetsExtRegisterClasses.cpp
)

set(MOC_H_FILES
  include/qclickablelabel.h
  include/QmitkAboutDialog.h
  include/QmitkBasePropertyView.h
  include/QmitkBoolPropertyWidget.h
  include/QmitkBoundingObjectWidget.h
  include/QmitkCallbackFromGUIThread.h
  include/QmitkColorPropertyEditor.h
  include/QmitkColorPropertyView.h
  include/QmitkColorTransferFunctionCanvas.h
  include/QmitkCrossWidget.h
  include/QmitkEditPointDialog.h
  include/QmitkEnumerationPropertyWidget.h
  include/QmitkFFmpegWriter.h
  include/QmitkFileChooser.h
  include/QmitkGnuplotWidget.h
  include/QmitkHotkeyLineEdit.h
  include/QmitkNumberPropertyEditor.h
  include/QmitkNumberPropertySlider.h
  include/QmitkNumberPropertyView.h
  include/QmitkPiecewiseFunctionCanvas.h
  include/QmitkPlotWidget.h
  include/QmitkPointListModel.h
  include/QmitkPointListView.h
  include/QmitkPointListViewWidget.h
  include/QmitkPointListWidget.h
  include/QmitkPrimitiveMovieNavigatorWidget.h
  #include/QmitkPropertyListPopup.h
  include/QmitkSelectableGLWidget.h
  include/QmitkSliceWidget.h
  include/QmitkSliderNavigatorWidget.h
  include/QmitkStandardViews.h
  include/QmitkStepperAdapter.h
  include/QmitkStringPropertyEditor.h
  include/QmitkStringPropertyOnDemandEdit.h
  include/QmitkStringPropertyView.h
  include/QmitkTransferFunctionCanvas.h
  include/QmitkTransferFunctionGeneratorWidget.h
  include/QmitkTransferFunctionWidget.h
  include/QmitkUGCombinedRepresentationPropertyWidget.h
  include/QmitkVideoBackground.h
)

set(UI_FILES
  src/QmitkAboutDialogGUI.ui
  src/QmitkGnuplotWidget.ui
  src/QmitkPrimitiveMovieNavigatorWidget.ui
  src/QmitkSelectableGLWidget.ui
  src/QmitkSliceWidget.ui
  src/QmitkSliderNavigator.ui
  src/QmitkTransferFunctionGeneratorWidget.ui
  src/QmitkTransferFunctionWidget.ui
)

set(QRC_FILES
  resource/QtWidgetsExt.qrc
)

list(REMOVE_ITEM H_FILES include/QmitkPropertyListPopup.h)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES} ${KIT_MOC_SRCS})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})