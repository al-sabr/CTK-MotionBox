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

Item
{
    id: pageAboutText

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    property url url

    property string text

    //---------------------------------------------------------------------------------------------
    // Aliases
    //---------------------------------------------------------------------------------------------

    property alias cover: logo.source

    //---------------------------------------------------------------------------------------------

    property alias scrollArea: scrollArea

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    anchors.fill: parent

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    ScrollArea
    {
        id: scrollArea

        anchors.left  : parent.left
        anchors.right : parent.right
        anchors.top   : parent.top
        anchors.bottom: bar.top

        contentHeight: itemTextW.y + itemTextW.height + st.dp16

        ButtonLogo
        {
            id: logo

            anchors.top: parent.top

            anchors.topMargin: st.dp16

            anchors.horizontalCenter: parent.horizontalCenter

            sourceSize.height: st.dp64

            fillMode: Image.PreserveAspectFit

            onClicked: gui.openUrl(url)
        }

        TextRich
        {
            id: itemText

            anchors.left : parent.left
            anchors.right: parent.right

            anchors.top: (logo.isSourceDefault) ? parent.top
                                                : logo.bottom

            anchors.topMargin: st.dp16

            horizontalAlignment: Text.AlignHCenter

            text: getStyle() + pageAboutText.text

            color: st.text3_color

            style: st.text_raised

            font.pixelSize: st.dp14
        }

        ButtonLogo
        {
            id: logoW

            anchors.top: itemText.bottom

            anchors.topMargin: st.dp20

            anchors.horizontalCenter: parent.horizontalCenter

            sourceSize: st.size32x32

            source: st.icon_w

            onClicked: gui.openUrl("http://omega.gg/about")
        }

        TextLogo
        {
            id: itemTextW

            anchors.top: logoW.bottom

            text: qsTr("omega Movement")
        }
    }

    BarTitle
    {
        id: bar

        anchors.left  : parent.left
        anchors.right : parent.right
        anchors.bottom: parent.bottom

        height: st.dp32 + borderSizeHeight

        borderBottom: 0

        ButtonPiano
        {
            anchors.top   : parent.top
            anchors.bottom: parent.bottom

            width: st.dp100

            text: qsTr("Back")

            onClicked: pageAbout.loadMain()
        }
    }
}
