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

#ifndef DATALOCAL_H
#define DATALOCAL_H

// Sk includes
#include <MotionBoxExports.h>
#include <WLocalObject>
#include <WAbstractBackend>
#include <WDeclarativePlayer>

class MOTIONBOX_EXPORT DataLocal : public WLocalObject
{
    Q_OBJECT

    Q_PROPERTY(QString version READ version CONSTANT)

    Q_PROPERTY(int screen READ screen CONSTANT)

    Q_PROPERTY(int width  READ width  CONSTANT)
    Q_PROPERTY(int height READ height CONSTANT)

    Q_PROPERTY(int splashWidth  READ splashWidth  CONSTANT)
    Q_PROPERTY(int splashHeight READ splashHeight CONSTANT)

    Q_PROPERTY(int style READ style WRITE setStyle NOTIFY styleChanged)

    Q_PROPERTY(qreal scale READ scale WRITE setScale NOTIFY scaleChanged)

    Q_PROPERTY(bool maximized READ maximized WRITE setMaximized NOTIFY maximizedChanged)

    Q_PROPERTY(bool expanded READ expanded WRITE setExpanded NOTIFY expandedChanged)
    Q_PROPERTY(bool macro    READ macro    WRITE setMacro    NOTIFY macroChanged)

    Q_PROPERTY(bool related READ related WRITE setRelated NOTIFY relatedChanged)

    Q_PROPERTY(bool relatedExpanded READ relatedExpanded WRITE setRelatedExpanded
               NOTIFY relatedExpandedChanged)

    Q_PROPERTY(bool tracksExpanded READ tracksExpanded WRITE setTracksExpanded
               NOTIFY tracksExpandedChanged)

    Q_PROPERTY(bool browserVisible READ browserVisible WRITE setBrowserVisible
               NOTIFY browserVisibleChanged)

    Q_PROPERTY(int libraryIndex READ libraryIndex WRITE setLibraryIndex NOTIFY libraryIndexChanged)

    Q_PROPERTY(QString query READ query WRITE setQuery NOTIFY queryChanged)

    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)

    Q_PROPERTY(qreal volume READ volume WRITE setVolume NOTIFY volumeChanged)

    Q_PROPERTY(bool autoPlay READ autoPlay WRITE setAutoPlay NOTIFY autoPlayChanged)

    Q_PROPERTY(bool shuffle READ shuffle WRITE setShuffle NOTIFY shuffleChanged)

    Q_PROPERTY(WDeclarativePlayer::Repeat repeat READ repeat WRITE setRepeat
               NOTIFY repeatChanged)

    Q_PROPERTY(WAbstractBackend::Output output READ output WRITE setOutput
               NOTIFY outputChanged)

    Q_PROPERTY(WAbstractBackend::Quality quality READ quality WRITE setQuality
               NOTIFY qualityChanged)

    Q_PROPERTY(WAbstractBackend::FillMode fillMode READ fillMode WRITE setFillMode
               NOTIFY fillModeChanged)

    Q_PROPERTY(bool vsync READ vsync WRITE setVsync NOTIFY vsyncChanged)

    Q_PROPERTY(int subtitleIndex READ subtitleIndex WRITE setSubtitleIndex
               NOTIFY subtitleIndexChanged)

    Q_PROPERTY(bool cache READ cache WRITE setCache NOTIFY cacheChanged)

    Q_PROPERTY(QString proxyHost READ proxyHost WRITE setProxyHost NOTIFY proxyHostChanged)
    Q_PROPERTY(int     proxyPort READ proxyPort WRITE setProxyPort NOTIFY proxyPortChanged)

    Q_PROPERTY(QString proxyPassword READ proxyPassword WRITE setProxyPassword
               NOTIFY proxyPasswordChanged)

    Q_PROPERTY(bool proxyStream READ proxyStream WRITE setProxyStream NOTIFY proxyStreamChanged)
    Q_PROPERTY(bool proxyActive READ proxyActive WRITE setProxyActive NOTIFY proxyActiveChanged)

    Q_PROPERTY(int torrentPort READ torrentPort WRITE setTorrentPort NOTIFY torrentPortChanged)

    Q_PROPERTY(int torrentConnections READ torrentConnections WRITE setTorrentConnections
               NOTIFY torrentConnectionsChanged)

    Q_PROPERTY(int torrentUpload READ torrentUpload WRITE setTorrentUpload
               NOTIFY torrentUploadChanged)

    Q_PROPERTY(int torrentDownload READ torrentDownload WRITE setTorrentDownload
               NOTIFY torrentDownloadChanged)

    Q_PROPERTY(bool torrentUploadActive READ torrentUploadActive WRITE setTorrentUploadActive
               NOTIFY torrentUploadActiveChanged)

    Q_PROPERTY(bool torrentDownloadActive READ torrentDownloadActive WRITE setTorrentDownloadActive
               NOTIFY torrentDownloadActiveChanged)

    Q_PROPERTY(int torrentCache READ torrentCache WRITE setTorrentCache NOTIFY torrentCacheChanged)

public:
    explicit DataLocal(QObject * parent = NULL);

public: // Interface
    Q_INVOKABLE void setSize(int screen, int width, int height);

    Q_INVOKABLE void setSplashSize(int width, int height);

public: // WLocalObject reimplementation
    /* Q_INVOKABLE virtual */ bool load(bool instant = false);

    /* Q_INVOKABLE virtual */ QString getFilePath() const;

protected: // WLocalObject reimplementation
    /* virtual */ WAbstractThreadAction * onSave(const QString & path);

private: // Functions
    bool extract(const QByteArray & array);

signals:
    void styleChanged();

    void scaleChanged();

    void maximizedChanged();

    void expandedChanged();
    void macroChanged   ();

    void relatedChanged        ();
    void relatedExpandedChanged();

    void tracksExpandedChanged();

    void browserVisibleChanged();

    void libraryIndexChanged();

    void queryChanged();

    void speedChanged();

    void volumeChanged();

    void autoPlayChanged();

    void shuffleChanged();
    void repeatChanged ();

    void outputChanged  ();
    void qualityChanged ();
    void fillModeChanged();

    void vsyncChanged();

    void subtitleIndexChanged();

    void cacheChanged();

    void proxyHostChanged    ();
    void proxyPortChanged    ();
    void proxyPasswordChanged();

    void proxyStreamChanged();
    void proxyActiveChanged();

    void torrentPortChanged();

    void torrentConnectionsChanged();

    void torrentUploadChanged  ();
    void torrentDownloadChanged();

    void torrentUploadActiveChanged  ();
    void torrentDownloadActiveChanged();

    void torrentCacheChanged();

public: // Properties
    QString version() const;

    int screen() const;

    int width () const;
    int height() const;

    int splashWidth () const;
    int splashHeight() const;

    int  style() const;
    void setStyle(int style);

    qreal scale() const;
    void  setScale(qreal scale);

    bool maximized() const;
    void setMaximized(bool maximized);

    bool expanded() const;
    void setExpanded(bool expanded);

    bool macro() const;
    void setMacro(bool macro);

    bool related() const;
    void setRelated(bool related);

    bool relatedExpanded() const;
    void setRelatedExpanded(bool expanded);

    bool tracksExpanded() const;
    void setTracksExpanded(bool expanded);

    bool browserVisible() const;
    void setBrowserVisible(bool visible);

    int  libraryIndex() const;
    void setLibraryIndex(int index);

    QString query() const;
    void    setQuery(const QString & query);

    qreal speed() const;
    void  setSpeed(qreal speed);

    qreal volume() const;
    void  setVolume(qreal volume);

    bool autoPlay() const;
    void setAutoPlay(bool autoPlay);

    bool shuffle() const;
    void setShuffle(bool shuffle);

    WDeclarativePlayer::Repeat repeat() const;
    void                       setRepeat(WDeclarativePlayer::Repeat repeat);

    WAbstractBackend::Output output() const;
    void                     setOutput(WAbstractBackend::Output output);

    WAbstractBackend::Quality quality() const;
    void                      setQuality(WAbstractBackend::Quality quality);

    WAbstractBackend::FillMode fillMode() const;
    void                       setFillMode(WAbstractBackend::FillMode fillMode);

    int  subtitleIndex() const;
    void setSubtitleIndex(int index);

    bool vsync() const;
    void setVsync(bool enabled);

    bool cache() const;
    void setCache(bool cache);

    QString proxyHost() const;
    void    setProxyHost(const QString & host);

    int  proxyPort() const;
    void setProxyPort(int port);

    QString proxyPassword() const;
    void    setProxyPassword(const QString & password);

    bool proxyStream() const;
    void setProxyStream(bool stream);

    bool proxyActive() const;
    void setProxyActive(bool active);

    int  torrentPort() const;
    void setTorrentPort(int port);

    int  torrentConnections() const;
    void setTorrentConnections(int connections);

    int  torrentUpload() const;
    void setTorrentUpload(int upload);

    int  torrentDownload() const;
    void setTorrentDownload(int download);

    bool torrentUploadActive() const;
    void setTorrentUploadActive(bool active);

    bool torrentDownloadActive() const;
    void setTorrentDownloadActive(bool active);

    int  torrentCache() const;
    void setTorrentCache(int cache);

private: // Variables
    QString _version;

    int _screen;

    int _width;
    int _height;

    int _splashWidth;
    int _splashHeight;

    int _style;

    qreal _scale;

    bool _maximized;

    bool _expanded;
    bool _macro;

    bool _related;
    bool _relatedExpanded;

    bool _tracksExpanded;

    bool _browserVisible;

    int _libraryIndex;

    QString _query;

    qreal _speed;

    qreal _volume;

    bool _autoPlay;

    bool                       _shuffle;
    WDeclarativePlayer::Repeat _repeat;

    WAbstractBackend::Output   _output;
    WAbstractBackend::Quality  _quality;
    WAbstractBackend::FillMode _fillMode;

    bool _vsync;

    int _subtitleIndex;

    bool _cache;

    QString _proxyHost;
    int     _proxyPort;
    QString _proxyPassword;

    bool _proxyStream;
    bool _proxyActive;

    int _torrentPort;

    int _torrentConnections;

    int  _torrentUpload;
    int  _torrentDownload;

    bool _torrentUploadActive;
    bool _torrentDownloadActive;

    int _torrentCache;

private:
    Q_DISABLE_COPY(DataLocal)

    friend class DataLocalReadReply;
    friend class ControllerCore;
};

#endif // DATALOCAL_H
