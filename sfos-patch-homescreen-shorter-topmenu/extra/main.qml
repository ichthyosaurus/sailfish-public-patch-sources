// This file is part of sfos-patch-homescreen-shorter-topmenu
// SPDX-FileCopyrightText: 2023 Mirian Margiani
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: root

    ConfigurationGroup {
        id: config
        path: "/patch/ichthyosaurus/homescreen-shorter-topmenu"
        property int reduction: 43
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flick }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader {
                title: "Shorter top menu"
            }

            SectionHeader { text: "Settings" }

            Slider {
                id: rows
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                minimumValue: 0
                maximumValue: 200
                value: config.reduction
                stepSize: 1.0
                valueText: "-%1 pixels".arg(value)
                label: "How many pixels to shave off"

                onReleased: {
                    if (!config) return

                    if (value !== config.reduction) {
                        config.reduction = value  // update as seldom as possible
                    }
                }
            }

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
