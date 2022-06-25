# Maya For Arch

## About

Maya For Arch is a simple script that helps you install Autodesk Maya on Arch Linux (and perhaps on Arch based distros).

## Dependencies

These are the dependencies needed by the script.

* yay
* Multilib enabled
* Lots of time

## How to use it

Note: Depending on your processor, converting the rpm packages may take quite some or a painful amount of time to finish. Be patient!

1. Download Maya for Linux from https://www.autodesk.com/

2. Clone this project wherever you like on your PC.

   ```bash
   git clone https://github.com/MyHCel/Maya-For-Arch.git
   ```

3. Cd into Maya-For-Arch

   ```bash
   cd Maya-For-Arch
   ```

4. Put the "Autodesk_Maya.tgz" file in the "Maya-For-Arch" folder

5. Execute the installer script.

   Note: This will update your system and install all required dependecies. If you don't want
   to update your system, modify the "installDep 'version' () function" in "scripts/'version'.sh"

   ```bash
   sudo ./install.sh
   ```

6. Select the Maya version you want to install.

   ```bash
   Select the version you want to install
   [1] Maya 2020
   [2] Maya 2022
   version:
   ```

7. Enter you user name (same as your home folder)

   ```bash
   Enter your username:
   ```

   7.1. If the script does not execute, chmod all ".sh" files

   ```bash
   chmod +x install.sh
   ```
   ```bash
   chmod +x uninstall.sh
   ```
   ```bash
   chmod +x -R scripts
   ```

8. Maya should now be up and running!

   Note: You can delete the "Maya-For-Arch" folder once the installation is done.

## Uninstalling Maya

1. Execute the uninstall script

   ```
   sudo ./uninstall.sh
   ```

2. Select the Maya version you want to uninstall.

   ```bash
    Select the version you want to uninstall
    [1] Maya 2020
    [2] Maya 2022
    version:
   ```

2. Enter your username (same as your home folder)

   ```bash
   Enter your username:
   ```

## Updates

* Improved the script's structure.
* Added option to keep or remove Autodesk folders when uninstalling.
* Fixed libtiff error in 2022.
* Fixed libpng12 error in 2022 (only appears when crashing).

* If you installed Maya 2022 with the old scrpit, copy the
  contents of Maya-For-Arch/lib/2022 to /usr/autodesk/maya2022/lib/

  ```bash
  sudo cp -r /path/to/Maya-For-Arch/lib/2022/* /usr/autodesk/maya2022/lib/
  ```

## Known issues

* Some features such as colour managment and viewport 2.0 won't be available on
  graphics cards that don't support OpenGL.

* Maya will crash when trying to activate the sowftare with a serial key.

* Pymel for Maya 2022 fails to execute a Python script when installing.

* The home screen of Maya 2022 does not show up. To be able to use Maya, just press ESC.

* Maya 2022 crashes when running on Intel graphics.
  To temporarily fix it run:

  ```bash
  maya -noAutoloadPlugins
  ```

## I think that's all

If you find any issues, let me know. I'll try to fix them  c:
