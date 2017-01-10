/*
 *   Copyright (C) %{CURRENT_YEAR} by %{AUTHOR} <%{EMAIL}>                      *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#ifndef TORCONTROL_H
#define TORCONTROL_H


#include <Plasma/Applet>

class torcontrol : public Plasma::Applet
{
    Q_OBJECT
    Q_ENUMS(RunningStatus)
    Q_PROPERTY(RunningStatus status READ status WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(QString iconName READ iconName NOTIFY statusChanged)
public:
    torcontrol( QObject *parent, const QVariantList &args );
    ~torcontrol();

    enum RunningStatus {
        Unknown = 0,
        Running = 1,
        NotRunning = 2
    };
    RunningStatus status() const;
    // NOTE This will attempt to set the status, but given the nature of
    // these things, there is no guarantee that the application will, in fact,
    // successfully start up (or shut down), or the timing of this operation.
    void setStatus(RunningStatus newStatus);
    Q_SIGNAL void statusChanged();

    QString iconName() const;

private:
    class Private;
    Private* d;
};

#endif