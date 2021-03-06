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

MouseArea
{
    id: buttonCheck

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    property int margins: height / 5

    property int radius: background.height

    property int borderSize: st.border_size

    property bool checked: false

    //---------------------------------------------------------------------------------------------
    // Style

    property color colorA: st.buttonCheck_colorA
    property color colorB: st.buttonCheck_colorB

    property color colorActiveA: st.buttonCheck_colorActiveA
    property color colorActiveB: st.buttonCheck_colorActiveB

    property color colorHandleA: st.buttonCheck_colorHandleA
    property color colorHandleB: st.buttonCheck_colorHandleB

    property color colorHandleHoverA: st.buttonCheck_colorHandleHoverA
    property color colorHandleHoverB: st.buttonCheck_colorHandleHoverB

    property color colorHandlePressA: st.buttonCheck_colorHandlePressA
    property color colorHandlePressB: st.buttonCheck_colorHandlePressB

    //---------------------------------------------------------------------------------------------
    // Private

    property bool pMaximum: (handle.x == model.handleMaximum)

    property bool pMove: false

    //---------------------------------------------------------------------------------------------
    // Signals
    //---------------------------------------------------------------------------------------------

    signal checkClicked

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    width : st.buttonCheck_width
    height: st.buttonCheck_height

    hoverEnabled: enabled

    drag.target: handle
    drag.axis  : Drag.XAxis

    drag.minimumX: model.handleMinimum
    drag.maximumX: model.handleMaximum

    //---------------------------------------------------------------------------------------------
    // Events
    //---------------------------------------------------------------------------------------------

    onPositionChanged: pMove = true

    onPressed: pMove = false

    onReleased:
    {
        if (pMove == false) return;

        if ((model.position + handle.width / 2) < width / 2)
        {
            handle.x = 0;

            if (checked == false) return;

            checked = false;
        }
        else
        {
            handle.x = model.handleMaximum;

            if (checked) return;

            checked = true;
        }

        checkClicked();
    }

    onClicked:
    {
        checked = !(checked);

        checkClicked();
    }

    //---------------------------------------------------------------------------------------------

    onWidthChanged: pUpdate()

    onCheckedChanged: pUpdate()

    //---------------------------------------------------------------------------------------------
    // Functions
    //---------------------------------------------------------------------------------------------
    // Private

    function pUpdate()
    {
        if (checked)
        {
             handle.x = model.handleMaximum;
        }
        else handle.x = 0;
    }

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    ModelRange
    {
        id: model

        handleMaximum: width - handle.width

        onHandleMaximumChanged: pUpdate()
    }

    Rectangle
    {
        id: background

        anchors.fill: parent

        anchors.margins: margins

        radius: buttonCheck.radius

        gradient: Gradient
        {
            GradientStop
            {
                position: 0.0

                color: (pMaximum) ? colorActiveA : colorA
            }

            GradientStop
            {
                position: 1.0

                color: (pMaximum) ? colorActiveB : colorB
            }
        }


        border.width: borderSize
        border.color: st.border_color
    }

    MouseArea
    {
        id: handle

        width : parent.height
        height: width

        acceptedButtons: Qt.NoButton

        hoverEnabled: parent.enabled

        onXChanged: model.position = x

        Rectangle
        {
            anchors.fill: parent

            anchors.margins: margins

            radius: buttonCheck.radius

            gradient: Gradient
            {
                GradientStop
                {
                    position: 0.0

                    color:
                    {
                        if (buttonCheck.pressed)
                        {
                            return colorHandlePressA;
                        }
                        else if (handle.containsMouse)
                        {
                            return colorHandleHoverA;
                        }
                        else return colorHandleA;
                    }
                }

                GradientStop
                {
                    position: 1.0

                    color:
                    {
                        if (buttonCheck.pressed)
                        {
                            return colorHandlePressB;
                        }
                        else if (handle.containsMouse)
                        {
                            return colorHandleHoverB;
                        }
                        else return colorHandleB;
                    }
                }
            }


            border.width: borderSize
            border.color: st.border_color
        }
    }
}
