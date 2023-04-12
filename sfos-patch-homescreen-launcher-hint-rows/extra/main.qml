// This file is part of sfos-patch-homescreen-launcher-hint-rows
// SPDX-FileCopyrightText: 2023 Mirian Margiani
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: root

    ConfigurationGroup {
        id: config
        path: "/patch/ichthyosaurus/homescreen-launcher-hint-rows"

        property bool alwaysShow: false
        property int rows: 1
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flick }

        Column {
            id: column
            width: parent.width

            PageHeader {
                title: "Launcher hints"
            }

            SectionHeader { text: "Settings" }

            Slider {
                id: rows
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                minimumValue: 1
                maximumValue: 4
                value: config.rows
                stepSize: 1.0
                valueText: "%1 rows".arg(value)
                label: "Number of launcher hint rows"

                onReleased: {
                    if (!config) return

                    if (value !== config.rows) {
                        config.rows = value  // update as seldom as possible
                    }
                }
            }

            // TextSwitch {
            //     id: alwaysShow
            //
            //     automaticCheck: false
            //     checked: config.alwaysShow
            //     onClicked: config.alwaysShow = !config.alwaysShow
            //
            //     text: "Always show the launcher hint"
            //     description: "If enabled, the launcher hint will always be visible. " +
            //                  "This is not recommended for more than one row."
            // }

            SectionHeader { text: "Patch details" }

            Label {
                text: "Go back to the list of patches, then press and hold the patch " +
                      "entry to open the context menu. There you can access patch details " +
                      "and enable/disable the patch.\n\n" +
                      "Please use the discussion link on the details page to report bugs " +
                      "or give feedback. Source code and a link for donations " +
                      "are also available."
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                wrapMode: Text.Wrap
            }
        }
    }
}
