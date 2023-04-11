# Source code for SailfishOS patches

This repository includes the sources for all my SailfishOS patches. They can be
installed either from the [Patchmanager Web Catalog](https://coderus.openrepos.net/pm2/projects/ichthyosaurus)
or from [Openrepos](https://openrepos.net/user/14094/programs).

Discussions and feedback are invited in the [dedicated thread](https://forum.sailfishos.org/t/patches-by-ichthyosaurus/15387)
on the SailfishOS forum. If you like my work, you can buy me a coffee through
[Liberapay](https://liberapay.com/ichthyosaurus) or Paypal.

## Using patches

The easiest way to use the patches is through Storeman ([Openrepos](https://openrepos.net/user/14094/programs))
or the [Patchmanager](https://coderus.openrepos.net/pm2/projects/ichthyosaurus).
You can also download RPM packages manually and install them using [File Browser](https://openrepos.net/content/ichthyosaurus/file-browser)
or the terminal. The [File Browser](https://openrepos.net/content/ichthyosaurus/file-browser)
app can be installed from Jolla's official store.

## Developing patches

You need [sailfish-patch](https://github.com/ichthyosaurus/sailfish-patch) for development.

To build a patch, first prepare the working directory by running

    sailfish-patch -u

in the respective patch directory. All original source packages will be downloaded
and prepared for development.

*Note:* if a patch relies on proprietary packages from
Jolla, you must first configure a working SSH connection so the sources can be
downloaded via your SailfishOS device.

You can then build the patch by running

    sailfish-patch -b

and publish it directly to your device (via SSH) by running

    sailfish-patch -p

These options can be combined:

    sailfish-patch -u -b -p

will prepare, update, build, and install the patch in one run.

Some patches require you to restart certain services on the phone before the
changes will be visible. Most patches provide the necessary commands and the
[sailfish-patch](https://github.com/ichthyosaurus/sailfish-patch) tool will offer to
run them for you. Alternatively, you can also restart services through
Patchmanager (see the pulley menu on the settings page) or the settings app
(system settings → utilities → restart homescreen).

*Note:* the [sailfish-patch](https://github.com/ichthyosaurus/sailfish-patch) tool
will automatically restart the `maliit` server for keyboard patches. The manual
command is: `systemctl --user restart maliit-server`


# License

Each patch defines its content license in the `CONFIG` file, and each directory
contains a copy of the license text in the `COPYING` file. Most, if not all,
patches are released under the terms of [GPL-3.0-or-later](https://spdx.org/licenses/GPL-3.0-or-later.html).
