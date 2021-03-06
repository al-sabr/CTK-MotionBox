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

BaseButton
{
    id: checkBox

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    property int margins: height / 8

    property int radius: background.height / 3.75

    property int borderSize     : st.border_size
    property int borderSizeFocus: st.border_sizeFocus

    //---------------------------------------------------------------------------------------------
    // Style

    property color color     : st.lineEdit_color
    property color colorHover: st.lineEdit_colorHover

    //---------------------------------------------------------------------------------------------
    // Aliases
    //---------------------------------------------------------------------------------------------

    property alias background: background
    property alias itemFocus : itemFocus

    //---------------------------------------------------------------------------------------------
    // Signals
    //---------------------------------------------------------------------------------------------

    signal checkClicked

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    width : st.checkBox_width
    height: st.checkBox_height

    //---------------------------------------------------------------------------------------------
    // Events
    //---------------------------------------------------------------------------------------------

    onClicked: onClick()

    //---------------------------------------------------------------------------------------------
    // Functions
    //---------------------------------------------------------------------------------------------

    function onClick()
    {
        checked = !(checked);

        checkClicked();
    }

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    Rectangle
    {
        id: itemFocus

        anchors.fill: background

        anchors.margins: -borderSizeFocus

        radius: Math.round(checkBox.radius * (height / background.height))

        opacity: (window.isActive && isFocused)

        color: "transparent"


        border.width: borderSize + borderSizeFocus
        border.color: st.border_colorFocus
    }

    Rectangle
    {
        id: background

        anchors.fill: parent

        anchors.margins: margins

        radius: checkBox.radius

        color: (checkBox.enabled && (isFocused || isHovered)) ? colorHover
                                                              : checkBox.color


        border.width: borderSize
        border.color: st.border_color
    }

    Image
    {
        anchors.fill: parent

        sourceSize: Qt.size(width, height)

        visible: checked

        opacity: (checkBox.enabled) ? 1.0 : st.icon_opacityDisable

        source: st.checkBox_sourceCheck

        Behavior on opacity
        {
            PropertyAnimation
            {
                duration: st.duration_fast

                easing.type: st.easing
            }
        }
    }
}
