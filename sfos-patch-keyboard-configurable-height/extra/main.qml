// This file is part of sfos-patch-keyboard-configurable-height
// SPDX-FileCopyrightText: 2023 Mirian Margiani
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import Nemo.DBus 2.0
import Nemo.Notifications 1.0

Page {
    id: root

    ConfigurationGroup {
        id: config
        path: "/patch/ichthyosaurus/keyboard-configurable-height"

        property double rowHeightFactor: 0.87
        property int bottomOffset: Math.round(Screen.height * 0.12)
    }

    DBusInterface {
        id: service
        bus: DBus.SessionBus
        service: 'org.freedesktop.systemd1'
        path: '/org/freedesktop/systemd1/unit/maliit_2dserver_2eservice'
        iface: 'org.freedesktop.systemd1.Unit'
    }

    Notification {
        id: noteStart
        previewSummary: 'The keyboard is being restarted and should be back shortly.'
        isTransient: true
        icon: 'icon-lock-information'
        appIcon: icon
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flick }

        PullDownMenu {
            MenuItem {
                text: "Preset: taller keyboard"
                onDelayedClick: {
                    config.rowHeightFactor = 1.30
                    config.bottomOffset = 0
                    rows.value = config.rowHeightFactor
                    offset.value = config.bottomOffset
                }
            }

            MenuItem {
                text: "Preset: smaller keyboard"
                onDelayedClick: {
                    config.rowHeightFactor = 0.87
                    config.bottomOffset = 0
                    rows.value = config.rowHeightFactor
                    offset.value = config.bottomOffset
                }
            }

            MenuItem {
                text: "Preset: for “long” phones"
                onDelayedClick: {
                    config.rowHeightFactor = 1.00
                    config.bottomOffset = Math.round(Screen.height * 0.12)
                    rows.value = config.rowHeightFactor
                    offset.value = config.bottomOffset
                }
            }
        }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader {
                title: "Keyboard height"
            }

            SectionHeader { text: "Settings" }

            Slider {
                id: rows
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                minimumValue: 0.6  // smaller than that makes buttons unclickable
                maximumValue: 1.5
                value: config.rowHeightFactor
                stepSize: 0.01
                valueText: "%1 %".arg(value * 100)

                onReleased: {
                    if (!config) return

                    if (value !== config.rowHeightFactor) {
                        config.rowHeightFactor = value
                    }
                }
            }

            Label {
                text: "How much to scale each keyboard row to make the keyboard taller or shorter."
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeSmall
                wrapMode: Text.Wrap
            }

            Slider {
                id: offset
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                minimumValue: 0
                maximumValue: 500
                value: config.bottomOffset
                stepSize: 5.0
                valueText: "%1 pixels".arg(value)

                onReleased: {
                    if (!config) return

                    if (value !== config.bottomOffset) {
                        config.bottomOffset = value
                    }
                }
            }

            Label {
                text: "How far above the bottom edge of the screen the keyboard should begin. "
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeSmall
                wrapMode: Text.Wrap
            }

            SectionHeader { text: "Troubleshooting" }

            Label {
                text: "If the keyboard crashes or misbehaves, you can first try resetting " +
                      "to the defaults with the “Reset” button. If this doesn't help, try " +
                      "restarting the keyboard service by pressing “Restart”."
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeSmall
                wrapMode: Text.Wrap
            }

            ButtonLayout {
                Button {
                    text: "Reset"
                    onClicked: {
                        config.rowHeightFactor = 1.00
                        config.bottomOffset = 0
                        rows.value = config.rowHeightFactor
                        offset.value = config.bottomOffset
                    }
                }

                Button {
                    text: "Restart"
                    onClicked: {
                        noteStart.publish()
                        service.call("Restart", ["replace"])
                    }
                }
            }

            PatchDetails {}
        }
    }
}
