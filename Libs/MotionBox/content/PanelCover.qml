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

import QtQuick 1.0
import Sky     1.0

Panel
{
    id: panelCover

    //---------------------------------------------------------------------------------------------
    // Properties
    //---------------------------------------------------------------------------------------------

    /* read */ property bool isExposed : false
    /* read */ property bool isExpanded: false

    /* read */ property bool hasItem: false

    /* read */ property bool detail: true

    /* read */ property ListPlaylist list
    /* read */ property Playlist  playlist

    /* read */ property int trackState

    /* read */ property url source

    /* read */ property string title
    /* read */ property url    cover

    /* read */ property string author
    /* read */ property string feed

    /* read */ property int duration: 0

    /* read */ property int quality: 0

    //---------------------------------------------------------------------------------------------
    // Private

    property bool pAnimate  : false
    property bool pAnimating: false

    property bool pClearLater: false

    property int pHeight: buttonTrack.height - buttonTrack.borderBottom

    //---------------------------------------------------------------------------------------------
    // Aliases
    //---------------------------------------------------------------------------------------------

    property alias buttonTrack: buttonTrack

    //---------------------------------------------------------------------------------------------
    // Settings
    //---------------------------------------------------------------------------------------------

    width: panelLibrary.width

    height: Math.round(panelLibrary.contentWidth * 0.5625) + borderTop + buttonTrack.height
            +
            details.height

    y: parent.height - buttonTrack.height

    borderLeft  : 0
    borderBottom: 0

    visible: false

    color: st.panelImage_color

    //---------------------------------------------------------------------------------------------
    // States
    //---------------------------------------------------------------------------------------------

    states:
    [
        State
        {
            name: "expanded"; when: (isExpanded && detail == false)

            PropertyChanges
            {
                target: panelCover

                y: parent.height - height + details.height
            }
        },
        State
        {
            name: "expandedDetail"; when: isExpanded

            PropertyChanges
            {
                target: panelCover

                y: parent.height - height
            }
        },
        State
        {
            name: "exposedBrowse"; when: (isExposed
                                          &&
                                          panelTracks.isExpanded && panelBrowse.isExposed)

            PropertyChanges
            {
                target: panelCover

                width: panelBrowse.widthColum + st.border_size

                y: parent.height - height
            }
        },
        State
        {
            name: "exposed"; when: isExposed

            PropertyChanges
            {
                target: panelCover

                y: parent.height - height
            }
        },
        State
        {
            name: "hiddenBrowse"; when: (player.source == "" && panelBrowse.isExposed)

            PropertyChanges
            {
                target: panelCover

                width: panelBrowse.widthColum + st.border_size

                y: parent.height
            }
        },
        State
        {
            name: "hidden"; when: (player.source == "" || gui.isExpanded)

            PropertyChanges
            {
                target: panelCover

                y: parent.height
            }
        },
        State
        {
            name: "browse"; when: panelBrowse.isExposed

            PropertyChanges
            {
                target: panelCover

                width: panelBrowse.widthColum + st.border_size
            }
        }
    ]

    transitions: Transition
    {
        SequentialAnimation
        {
            NumberAnimation
            {
                properties: "y, width"

                duration: st.duration_normal

                easing.type: st.easing
            }

            ScriptAction
            {
                script:
                {
                    pAnimating = false;

                    if (isExposed) return;

                    if (pClearLater) pClearSource();

                    if (gui.isExpanded || player.source == "")
                    {
                        visible = false;
                    }
                    else itemCover.visible = false;
                }
            }
        }
    }

    //---------------------------------------------------------------------------------------------
    // Events
    //---------------------------------------------------------------------------------------------

    onStateChanged:
    {
        if (isExpanded || player.source)
        {
            visible = true;
        }

        if (width != panelLibrary.width)
        {
            pAnimating = true;
        }
    }

    onExited: clearItemLater()

    //---------------------------------------------------------------------------------------------
    // Connections
    //---------------------------------------------------------------------------------------------

    Connections
    {
        target: (hasItem) ? playlist : null

        onTrackUpdated:
        {
            if (list.indexPreview != index) return;

            if (playlist.trackIsLoading(index))
            {
                pAnimate = true;
            }
            else pUpdateItem();
        }
    }

    //---------------------------------------------------------------------------------------------
    // Functions
    //---------------------------------------------------------------------------------------------

    function expose()
    {
        if (isExposed) return;

        itemCover.visible = true;

        isExposed = true;
    }

    function collapse()
    {
        isExposed = false;
    }

    function toggleExpose()
    {
        if (isExposed) collapse();
        else           expose  ();
    }

    //---------------------------------------------------------------------------------------------

    function setItem(list)
    {
        timer.stop();

        pAnimate = false;

        panelCover.list     = list;
        panelCover.playlist = list.playlist;

        pUpdateItem();

        hasItem = true;

        isExpanded = true;

        pClearLater = false;

        expose();
    }

    //---------------------------------------------------------------------------------------------

    function clearItem()
    {
        if (hasItem == false) return;

        timer.stop();

        pClearItem();
    }

    function clearItemLater()
    {
        timer.start();
    }

    //---------------------------------------------------------------------------------------------

    function getHeight()
    {
        if (player.source == "")
        {
             return 0;
        }
        else return Math.min(parent.height - y, pHeight);
    }

    function getY()
    {
        return Math.max(parent.height - pHeight, y);
    }

    //---------------------------------------------------------------------------------------------
    // Private

    function pUpdateItem()
    {
        var index = list.indexPreview;

        var data = playlist.trackData(index);

        trackState = data.state;

        source = data.source;

        title = data.title;
        cover = data.cover;

        author = data.author;
        feed   = data.feed;

        duration = data.duration;

        core.dateCover = data.date;

        quality = data.quality;

        if (data.state < LocalObject.Loaded)
        {
             detail = false;
        }
        else detail = true;
    }

    //---------------------------------------------------------------------------------------------

    function pClearItem()
    {
        isExpanded = false;

        pClearLater = true;

        if (isExpanded == false) collapse();

        if (isExposed) pClearSource();
    }

    function pClearSource()
    {
        pClearLater = false;

        pAnimate = false;

        source = "";

        detail = true;

        hasItem = false;
    }

    //---------------------------------------------------------------------------------------------

    function pSelectTrack()
    {
        gui.selectTrack(playerTab);
    }

    //---------------------------------------------------------------------------------------------
    // Childs
    //---------------------------------------------------------------------------------------------

    Timer
    {
        id: timer

        interval: st.panelCover_intervalClear

        onTriggered: if (isHovered == false) pClearItem()
    }

    Rectangle
    {
        id: background

        width : st.dp50 + borderIcon.size
        height: st.dp28

        color: st.panel_color

        states: State
        {
            name: "exposed"; when: isExposed

            AnchorChanges
            {
                target: background

                anchors.right: parent.left
            }
        }

        transitions: Transition
        {
            AnchorAnimation
            {
                duration: st.duration_normal

                easing.type: st.easing
            }
        }

        Image
        {
            id: itemIcon

            anchors.left  : parent.left
            anchors.right : borderIcon.left
            anchors.top   : parent.top
            anchors.bottom: parent.bottom

            sourceSize: Qt.size(st.dp50, st.dp28)

            clip: true

            source: player.trackCover

            sourceDefault: st.icon50x28_track

            fillMode: Image.PreserveAspectCrop

            asynchronous: true

            filter: (isSourceDefault) ? st.button_filterIconA : null

            ButtonPiano
            {
                id: overlay

                anchors.fill: parent

                borderRight: 0

                highlighted: true

                background.visible: isHovered
                background.opacity: 0.8

                onEntered: panelPreview.activateTab(itemIcon, playerTab)

                onExited: panelPreview.clear()

                onClicked:
                {
                    panelPreview.clearInstant();

                    isExpanded = true;

                    expose();
                }
            }

            Icon
            {
                anchors.centerIn: parent

                visible: overlay.background.visible

                source    : st.icon32x32_search
                sourceSize: st.size32x32

                style: st.icon_raised

                filter: st.icon2_filter
            }
        }

        BorderVertical
        {
            id: borderIcon

            anchors.right: parent.right
        }
    }

    ButtonPiano
    {
        id: buttonTrack

        anchors.left  : background.right
        anchors.right : parent.right
        anchors.top   : background.top
        anchors.bottom: border.bottom

        borderRight : 0
        borderBottom: borderSize

        enabled: (playerTab.playlist != null && hasItem == false)

        highlighted: (player.isPlaying && hasItem == false)

        isPressed: (pressed || isReturnPressed
                    ||
                    (playerTab.playlist == null && hasItem == false))

        text: (hasItem) ? gui.getTrackTitle(title,             trackState,        source)
                        : gui.getTrackTitle(player.trackTitle, player.trackState, player.source)

        colorA:
        {
            if (hasItem)
            {
                return st.barTitle_colorA;
            }
            else if (highlighted)
            {
                return st.buttonPiano_colorHighlightA;
            }
            else return st.buttonPiano_colorA;
        }

        colorB:
        {
            if (hasItem)
            {
                return st.barTitle_colorB;
            }
            else if (highlighted)
            {
                return st.buttonPiano_colorHighlightB;
            }
            else return st.buttonPiano_colorB;
        }

        itemText.horizontalAlignment: Text.AlignLeft

        itemText.opacity: 1.0

        itemText.style: (enabled) ? st.text_sunken
                                  : st.text_raised

        onPressed:
        {
            //panelDiscover.collapse();

            pSelectTrack();
        }

        BorderHorizontal
        {
            visible: (hasItem && buttonTrack.colorA != buttonTrack.colorB)

            color: st.barTitle_colorBorderLine
        }
    }

    BorderHorizontal
    {
        id: border

        anchors.left : background.left
        anchors.right: background.right
        anchors.top  : background.bottom
    }

    Item
    {
        id: itemCover

        anchors.left  : parent.left
        anchors.right : parent.right
        anchors.top   : border.bottom
        anchors.bottom: details.top

        visible: false

        RectangleLogo
        {
            anchors.fill: parent

            visible: (itemImage.visible == false)
        }

        Image
        {
            id: itemImage

            anchors.fill: parent

            sourceSize.height: height

            visible: (isSourceDefault == false)

            source: (hasItem) ? cover
                              : player.trackCover

            fillMode: Image.PreserveAspectFit

            asynchronous: true
        }

        LabelLoading
        {
            anchors.centerIn: parent

            visible: (pAnimate && detail == false)
        }
    }

    BarTitle
    {
        id: details

        anchors.left  : parent.left
        anchors.right : parent.right
        anchors.bottom: parent.bottom

        borderBottom: 0

        visible: itemCover.visible

        TextBase
        {
            id: itemDuration

            anchors.left  : parent.left
            anchors.top   : parent.top
            anchors.bottom: parent.bottom

            leftMargin: st.dp6

            verticalAlignment: Text.AlignVCenter

            visible: detail

            text: (hasItem) ? gui.getTrackDuration(duration)
                            : gui.getTrackDuration(playerTab.duration)

            style: st.text_sunken

            font.pixelSize: st.dp14
        }

        ButtonPiano
        {
            anchors.right : parent.right
            anchors.top   : parent.top
            anchors.bottom: parent.bottom

            maximumWidth: parent.width - (itemDuration.x + itemDuration.width + st.dp50)

            borderLeft : borderSize
            borderRight: 0

            padding: st.buttonPiano_padding

            visible: (detail && text != "")

            enabled: (hasItem) ? (feed           != "")
                               : (playerTab.feed != "")

            text:
            {
                if (hasItem)
                {
                     return gui.getTrackAuthor(author, feed);
                }
                else return gui.getTrackAuthor(playerTab.author, playerTab.feed);
            }

            onClicked:
            {
                if (hasItem)
                {
                     gui.browseFeedTrack(source, feed);
                }
                else gui.browseFeed(playerTab);

                if (isExpanded) pClearItem();
            }
        }
    }
}
