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

ComponentWall
{
    id: componentWall

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    property bool isContextualHovered: (index == parent.indexHover
                                        &&
                                        index == parent.indexContextual)

    property bool isHighlighted: (item == parent.highlightedTab)

    property int logoMargin: itemContent.width / parent.logoRatio

    //---------------------------------------------------------------------------------------------
    // Style

    property color colorBarContextualHoverA: st.itemTab_colorContextualHoverA
    property color colorBarContextualHoverB: st.itemTab_colorContextualHoverB

    property color colorHighlightA: st.itemTab_colorHighlightA
    property color colorHighlightB: st.itemTab_colorHighlightB

    property color colorHighlightHoverA: st.itemTab_colorHighlightHoverA
    property color colorHighlightHoverB: st.itemTab_colorHighlightHoverB

    property color colorHighlightContextualA: st.itemTab_colorHighlightContextualA
    property color colorHighlightContextualB: st.itemTab_colorHighlightContextualB

    //---------------------------------------------------------------------------------------------
    // Private

    property bool pCurrent: (isCurrent || isHighlighted)

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    iconWidth: st.componentWallBookmarkTrack_iconWidth

    iconDefaultSize: st.size16x16

    z:
    {
        if (index == parent.indexTop) return 3;
        else if (isHighlighted)          return  2;
        else if (isCurrent || isHovered) return  1;
        else if (opacity == 1.0)         return  0;
        else                             return -1;
    }

    isHovered: (index == parent.indexHover || index == parent.indexContextual)

    isCurrent: (item == currentTab)

    image: item.coverShot

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

    itemImage.anchors.leftMargin: (itemImage.isSourceDefault) ? logoMargin : 0

    itemImage.anchors.rightMargin: itemImage.anchors.leftMargin

    itemImage.clip: (itemImage.fillMode == Image.PreserveAspectCrop)

    itemImage.sourceDefault: parent.logo

    itemImage.fillMode: player.fillMode

    itemImage.cache: false

    itemImage.scaling: itemImage.isSourceDefault

    itemBar.gradient: Gradient
    {
        GradientStop
        {
            position: 0.0

            color:
            {
                if (isHighlighted)
                {
                    if      (isContextualHovered) return colorHighlightContextualA;
                    else if (isHovered)           return colorHighlightHoverA;
                    else                          return colorHighlightA;
                }
                else if (isCurrent)           return colorBarSelectA;
                else if (isContextualHovered) return colorBarContextualHoverA;
                else if (isHovered)           return colorBarHoverA;
                else                          return colorBarA;
            }
        }

        GradientStop
        {
            position: 1.0

            color:
            {
                if (isHighlighted)
                {
                    if      (isContextualHovered) return colorHighlightContextualB;
                    else if (isHovered)           return colorHighlightHoverB;
                    else                          return colorHighlightB;
                }
                else if (isCurrent)           return colorBarSelectB;
                else if (isContextualHovered) return colorBarContextualHoverB;
                else if (isHovered)           return colorBarHoverB;
                else                          return colorBarB;
            }
        }
    }

    //---------------------------------------------------------------------------------------------
    // Style

    gradient: Gradient
    {
        GradientStop
        {
            position: 0.0

            color: (itemImage.isSourceDefault) ? parent.defaultColorA
                                               : st.componentWallBookmarkTrack_colorA
        }

        GradientStop
        {
            position: 1.0

            color: (itemImage.isSourceDefault) ? parent.defaultColorB
                                               : st.componentWallBookmarkTrack_colorB
        }
    }

    colorBorder:
    {
        if (isHighlighted)
        {
            if      (isContextualHovered) return colorHighlightContextualA;
            else if (isHovered)           return colorHighlightHoverA;
            else                          return st.border_color;
        }
        else if (isCurrent)           return colorBarSelectB;
        else if (isContextualHovered) return colorBarContextualHoverA;
        else if (isHovered)           return colorBarHoverA;
        else                          return st.border_color;
    }

    textColor: (pCurrent) ? st.text2_color
                          : st.text1_color

    textStyle: (isCurrent) ? st.text_raised
                           : st.text_sunken

    iconStyle: (isCurrent) ? st.icon_raised
                           : st.icon_sunken

    textStyleColor: (isCurrent) ? st.text1_colorShadow
                                : st.text1_colorSunken

    filterIcon: (pCurrent) ? st.icon2_filter
                           : st.icon1_filter

    filterIconShadow: st.icon1_filterShadow

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    TabBarProgress
    {
        anchors.bottom: parent.bottom

        width: (item.currentTime * (parent.width - itemIcon.width)) / item.duration

        x: itemIcon.width

        visible: (isCurrent == false && isHighlighted == false && item.currentTime > 0)

        enabled: player.isPlaying
    }
}
