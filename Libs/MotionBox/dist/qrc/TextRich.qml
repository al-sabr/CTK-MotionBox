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

TextBase
{
    id: textRich

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------
    // Style

    property color colorLink     : st.text_colorLink
    property color colorLinkHover: st.text_colorLinkHover

    //---------------------------------------------------------------------------------------------
    // Private

    property string pLink

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    textFormat: Text.RichText


    //---------------------------------------------------------------------------------------------
    // Functions
    //---------------------------------------------------------------------------------------------

    function getStyle(style)
    {
        return "<style>"
               +
               "p { margin: 0 0 " + st.dp8 + "px 0; }"
               +
               "p.br { margin-bottom: " + st.dp20 + "px; }"
               +
               "a { text-decoration: none; color: " + colorLink + "; }"
               +
               style + "</style>";
    }

    //---------------------------------------------------------------------------------------------
    // Events

    function onLinkClicked(link)
    {
        Qt.openUrlExternally(link)
    }

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    MouseArea
    {
        anchors.fill: parent

        hoverEnabled: true

        onPositionChanged:
        {
            pLink = textRich.linkAt(mouseX, mouseY);

            if (pLink)
            {
                 cursor = Qt.PointingHandCursor;
            }
            else cursor = Qt.ArrowCursor;
        }

        onExited: cursor = Qt.ArrowCursor

        onReleased:
        {
            if (pLink == "") return;

            var link = textRich.linkAt(mouseX, mouseY);

            if (pLink == link)
            {
                onLinkClicked(link);
            }
        }
    }
}
