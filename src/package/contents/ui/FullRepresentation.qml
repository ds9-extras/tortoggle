/***************************************************************************
 *   Copyright (C) 2017 by Dan Leinir Turthra Jensen <admin@leinir.dk>     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    Layout.minimumWidth: Layout.minimumHeight * 1.333
    Layout.minimumHeight: units.gridUnit * 10
    Layout.preferredWidth: Layout.minimumWidth * 1.5
    Layout.preferredHeight: Layout.minimumHeight * 1.5

    PlasmaComponents.Button {
        id: statusIcon;
        anchors {
            left: parent.left;
            verticalCenter: parent.verticalCenter;
        }
        iconName: plasmoid.nativeInterface.iconName;
        tooltip: plasmoid.nativeInterface.buttonLabel;
        onClicked: root.changeRunningStatus();
    }
    PlasmaComponents.Label {
        anchors {
            top: parent.top;
            left: statusIcon.right;
            leftMargin: units.smallSpacing;
            right: parent.right;
            bottom: parent.bottom;
        }
        text: plasmoid.nativeInterface.buttonLabel;
    }
}
