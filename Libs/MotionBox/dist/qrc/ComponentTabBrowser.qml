//=================================================================================================
/*
    Copyright (C) 2015-2020 Sky kit authors. <http://omega.gg/Sky>

    Author: Benjamin Arnaud. <http://bunjee.me> <bunjee@omega.gg>

    This file is part of SkyComponents.

    - GNU Lesser General Public License Usage:
    This file may be used under the terms of the GNU Lesser General Public License version 3 as
    published by the Free Software Foundation and appearing in the LICENSE.md file included in the
    packaging of this file. Please review the following information to ensure the GNU Lesser
    General Public License requirements will be met: https://www.gnu.org/licenses/lgpl.html.

    - Private License Usage:
    Sky kit licensees holding valid private licenses may use this file in accordance with the
    private license agreement provided with the Software or, alternatively, in accordance with the
    terms contained in written agreement between you and Sky kit authors. For further information
    contact us at contact@omega.gg.
*/
//=================================================================================================

import QtQuick 2.14
import Sky 1.0

ComponentTab
{
    id: componentTabBrowser

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    property bool isContextualHovered: (index == parent.indexHover
                                        &&
                                        index == parent.indexContextual)

    //---------------------------------------------------------------------------------------------
    // Style

    property color colorContextualHoverA: st.itemTab_colorContextualHoverA
    property color colorContextualHoverB: st.itemTab_colorContextualHoverB

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    iconWidth: st.componentTabBrowser_iconWidth

    iconDefaultSize: st.size16x16

    x: parent.getItemX(index)

    z: (index == parent.indexTop)

    clip: (componentTabBrowser == parent.pClipItem)

    isHovered: (index == parent.indexHover || index == parent.indexContextual)

    isCurrent: (item == parent.currentTab)

    icon: (item.cover == "") ? item.videoShot
                             : item.cover

    iconDefault: parent.iconDefault

    text:
    {
        if (item.title)
        {
            return item.title;
        }
        else if (item.isLoading)
        {
            return qsTr("Loading...");
        }
        else return qsTr("New Tab");
    }

    iconFillMode: Image.PreserveAspectCrop

    iconCache: (item.cover != "")

    acceptedButtons: Qt.NoButton

    textMargin: parent.getItemMargin(index)

    background.gradient: Gradient
    {
        GradientStop
        {
            position: 0.0

            color:
            {
                if      (isCurrent)           return colorSelectA;
                else if (isContextualHovered) return colorContextualHoverA;
                else if (isHovered)           return colorHoverA;
                else                          return colorA;
            }
        }

        GradientStop
        {
            position: 1.0

            color:
            {
                if      (isCurrent)           return colorSelectB;
                else if (isContextualHovered) return colorContextualHoverB;
                else if (isHovered)           return colorHoverB;
                else                          return colorB;
            }
        }
    }

    //---------------------------------------------------------------------------------------------
    // Animations
    //---------------------------------------------------------------------------------------------

    Behavior on x
    {
        enabled: (parent.isAnimated && index != parent.indexStatic)

        PropertyAnimation
        {
            duration: parent.durationAnimation

            easing.type: st.easing
        }
    }

    Behavior on width
    {
        enabled: (parent.isAnimated && index != parent.indexStatic)

        PropertyAnimation
        {
            duration: parent.durationAnimation

            easing.type: st.easing
        }
    }
}
