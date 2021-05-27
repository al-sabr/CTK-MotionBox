//=================================================================================================
/*
    Copyright (C) 2015-2020 MotionBox authors united with omega. <http://omega.gg/about>

    Author: Benjamin Arnaud. <http://bunjee.me> <bunjee@omega.gg>

    This file is part of MotionBox.

    - GNU General Public License Usage:
    This file may be used under the terms of the GNU General Public License version 3 as published
    by the Free Software Foundation and appearing in the LICENSE.md file included in the packaging
    of this file. Please review the following information to ensure the GNU General Public License
    requirements will be met: https://www.gnu.org/licenses/gpl.html.

    - Private License Usage:
    MotionBox licensees holding valid private licenses may use this file in accordance with the
    private license agreement provided with the Software or, alternatively, in accordance with the
    terms contained in written agreement between you and MotionBox authors. For further information
    contact us at contact@omega.gg.
*/
//=================================================================================================

import QtQuick 2.14
import Sky 1.0

Panel
{
    id: panelApplication

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    /* read */ property bool isExposed : false
    /* read */ property bool isAnimated: false

    /* read */ property int indexCurrent: -1

    /* read */ property string sourceSettings: "PageSettingsMain.qml"
    /* read */ property string sourceAbout   : "PageAboutMain.qml"

    //---------------------------------------------------------------------------------------------
    // Private

    property int pMessageValue: 0
    property int pCreditsValue: 0

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    // FIXME Qt5.12 Win8: Panel size changes for no reason when hidden.
    x: -width

    y: barWindow.y + barWindow.height - height

    width: st.dp320 + borderRight

    height: bar.height
            +
            (st.barTitleSmall_height + st.border_size * 2 + st.buttonPush_height + st.dp3 * 2) * 4

    borderLeft: 0
    borderTop : 0

    visible: false

    backgroundOpacity: st.panelContextual_backgroundOpacity

    //---------------------------------------------------------------------------------------------
    // States
    //---------------------------------------------------------------------------------------------

    states: State
    {
        name: "visible"; when: isExposed

        PropertyChanges
        {
            target: panelApplication

            x: 0
            y: barWindow.y + barWindow.height
        }
    }

    transitions: Transition
    {
        SequentialAnimation
        {
            NumberAnimation
            {
                properties: "x, y"

                duration: st.duration_fast

                easing.type: st.easing
            }

            ScriptAction
            {
                script:
                {
                    if (isExposed == false) visible = false;

                    isAnimated = false;
                }
            }
        }
    }

    //---------------------------------------------------------------------------------------------
    // Events
    //---------------------------------------------------------------------------------------------

    onActiveFocusChanged: if (activeFocus) loader.item.forceActiveFocus()

    //---------------------------------------------------------------------------------------------
    // Keys
    //---------------------------------------------------------------------------------------------

    Keys.onPressed:
    {
        if (event.key == Qt.Key_Escape)
        {
            event.accepted = true;

            collapse();
        }
        else if (event.key == Qt.Key_Tab || event.key == Qt.Key_Backtab)
        {
            collapse();
        }
    }

    //---------------------------------------------------------------------------------------------
    // Functions
    //---------------------------------------------------------------------------------------------

    function expose()
    {
        if (isExposed || isAnimated) return;

        if (indexCurrent == -1)
        {
            indexCurrent = 0;

            loader.load(Qt.resolvedUrl("PageSettings.qml"));
        }

        visible = true;

        isAnimated = st.animate;

        isExposed = true;

        barWindow.buttonApplication.checked = true;

        focus();
    }

    function collapse()
    {
        if (isExposed == false || isAnimated) return;

        isAnimated = st.animate;

        isExposed = false;

        barWindow.buttonApplication.checked = false;
    }

    function toggleExpose()
    {
        if (isExposed) collapse();
        else           expose  ();
    }

    //---------------------------------------------------------------------------------------------

    function setAboutPage(page)
    {
        if (indexCurrent != 1)
        {
            indexCurrent = 1;

            sourceAbout = page;

            if (isExposed == false)
            {
                loader.load(Qt.resolvedUrl("PageAbout.qml"));

                expose();
            }
            else loader.loadLeft(Qt.resolvedUrl("PageAbout.qml"));
        }
        else if (isExposed == false)
        {
            loader.item.load(Qt.resolvedUrl(page));

            expose();
        }
        else loader.item.loadLeft(Qt.resolvedUrl(page));

        loader.item.forceActiveFocus();
    }

    //---------------------------------------------------------------------------------------------
    // Private

    function pSelectTab(index)
    {
        if (loader.isAnimated || indexCurrent == index) return;

        indexCurrent = index;

        if (indexCurrent == 0)
        {
            sourceSettings = "PageSettingsMain.qml";

            loader.loadRight(Qt.resolvedUrl("PageSettings.qml"));
        }
        else
        {
            sourceAbout = "PageAboutMain.qml";

            loader.loadLeft(Qt.resolvedUrl("PageAbout.qml"));
        }

        loader.item.forceActiveFocus();
    }

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    BarTitle
    {
        id: bar

        anchors.left : parent.left
        anchors.right: parent.right

        height: st.dp32 + borderSizeHeight

        borderTop: 0

        ButtonPianoFull
        {
            id: buttonSettings

            width: Math.round(parent.width / 2)

            checkable: true
            checked  : (indexCurrent == 0)

            checkHover: false

            icon          : st.icon20x20_setting
            iconSourceSize: st.size20x20

            text: qsTr("Settings")

            font.pixelSize: st.dp14

            onPressed: Qt.callLater(pSelectTab, 0)
        }

        ButtonPianoFull
        {
            anchors.left : buttonSettings.right
            anchors.right: parent.right

            borderRight: 0

            checkable: true
            checked  : (indexCurrent == 1)

            checkHover: false

            icon          : st.icon20x20_about
            iconSourceSize: st.size20x20

            text: qsTr("About")

            font.pixelSize: st.dp14

            onPressed: Qt.callLater(pSelectTab, 1)
        }
    }

    LoaderSlide
    {
        id: loader

        anchors.left  : parent.left
        anchors.right : parent.right
        anchors.top   : bar.bottom
        anchors.bottom: parent.bottom
    }
}
