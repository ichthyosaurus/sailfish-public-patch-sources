# Source code for SailfishOS patches

This repository includes the sources for all my SailfishOS patches. You need
[sailfish-patch](https://github.com/ichthyosaurus/sailfish-patch) for development.

To build a patch, first prepare the working directory by running

    sailfish-patch -u

in the respective patch directory. All original source packages will be downloaded
and prepared for development.

You can then build the patch by running

    sailfish-patch -b

and publish it directly to your device (via SSH) by running

    sailfish-patch -p

These options can be combined:

    sailfish-patch -u -b -p

will prepare, update, build, and install the patch in one run.


Some patches require to restart certain services on the phone before the changes
will be visible. For example all keyboard patches need

    devel-su systemctl --user restart maliit-server

after installing. (You can alternatively restart the homescreen via the system
Settings or restart your phone.)


# License

All patches are published under the terms of the GNU General Public License v3 or later.

Each patch directory contains a copy of the license text in the file `COPYING`.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
