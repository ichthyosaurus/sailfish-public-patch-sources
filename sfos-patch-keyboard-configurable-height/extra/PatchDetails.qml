// This file was rendered by sailfish-patch for sfos-patch-keyboard-configurable-height
// SPDX-FileCopyrightText: 2023 Mirian Margiani
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.2
import Sailfish.Silica 1.0

Column {
    id: root

    width: parent.width
    spacing: Theme.paddingMedium

    SectionHeader { text: "Patch details" }

    Column {
        width: parent.width
        spacing: Theme.paddingSmall

        DetailItem {
            label: "Author"
            value: "@MAINTAINER@"
        }
        DetailItem {
            label: "License"
            value: "@LICENSE@"
        }
        DetailItem {
            label: "Version"
            value: "@VERSION@-@RELEASE@"
        }
    }

    Item { width: parent.width; height: 1 }

    ButtonLayout {
        columnSpacing: 0
        preferredWidth: Theme.buttonWidthLarge

        Button {
            text: "Discussion"
            onClicked: Qt.openUrlExternally("@DISCUSSIONLINK@")
            enabled: visible
            visible: "@DISCUSSIONLINK@" !== ""
        }
        Button {
            text: "Sources"
            onClicked: Qt.openUrlExternally("@SOURCESLINK@")
            enabled: visible
            visible: "@SOURCESLINK@" !== ""
        }
        Button {
            text: "Donations"
            onClicked: Qt.openUrlExternally("@DONATIONSLINK@")
            enabled: visible
            visible: "@DONATIONSLINK@" !== ""
        }
    }

    Item { width: parent.width; height: 1 }

    Label {
        text: "Full details are available on Patchmanager's patch details page. " +
              "Go back to the list of patches, then press and hold the patch " +
              "entry to open the context menu. There you can access patch details " +
              "and enable/disable the patch."
        x: Theme.horizontalPageMargin
        width: parent.width - 2*x
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeExtraSmall
        wrapMode: Text.Wrap
    }

    Item { width: parent.width; height: Theme.horizontalPageMargin }
}
