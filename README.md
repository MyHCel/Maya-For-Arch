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

2. Download Autodesk Licensing Service [here] (https://knowledge.autodesk.com/search-result/caas/downloads/content/autodesk-licensing-service-download.html) (only if you don't have it installed or want to update it).

3. Clone this project wherever you like on your PC.

   ```bash
   git clone https://github.com/MyHCel/Maya-For-Arch.git
   ```

4. Cd into Maya-For-Arch

   ```bash
   cd Maya-For-Arch
   ```

5. Put the "Autodesk_Maya.tgz" and the "AdskLicensingInstaller.tar.gz" (optional based on step 2) 
   files in the "Maya-For-Arch" folder.

6. Execute the installer script.

   Note: This will update your system and install all required dependecies. If you don't want
   to update your system, modify the "installDep 'version' () function" in "scripts/'version'.sh"

   ```bash
   sudo ./install.sh
   ```

7. Select the Maya version you want to install.

   ```bash
   Select the version you want to install
   [1] Maya 2020
   [2] Maya 2022
   version:
   ```

8. Choose based in your decision in step 2.

   ```bash
   Install Autodesk Licensing Service? [Y/N]:
   ```

9. Enter you user name (same as your home folder)

   ```bash
   Enter your username:
   ```

   9.1. If the script does not execute, chmod all ".sh" files

   ```bash
   chmod +x install.sh
   ```
   ```bash
   chmod +x uninstall.sh
   ```
   ```bash
   chmod +x -R scripts
   ```

10. Maya should now be up and running!

11. Note: The converted packages are saved 
    in case you need to reinstall the software.

    If you want to install an update 
    (eg. Maya 2022 is installed and you want to install 2022.3 
    or you want to update Autodesk Licensing Service) first delete 
    the corresponding cached files.

    ```bash
    Maya-For-Arch/cache/<Maya version> -> Delete this folder to update that version of Maya.
    Maya-For-Arch/cache/adsk -> Delete this folder to update Autodesk Licensing Service.
    ```

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

3. If you are going to install another version of Maya (or if other Autodesk software needs it), 
   you should not uninstall Autodesk Licensing Service. Otherwise, you can uninstall it.

   ```bash
   Uninstall Autodesk Licensing Service? [Y/N]:
   ```

4. Enter your username (same as your home folder)

   ```bash
   Enter your username:
   ```

## Updates

* Improved the script's structure.
* Improved installation of Autodesk Licensing Service.
* Added package cache.
* Fixed libtiff error.
* Fixed libpng12 error in 2022 (only appears when crashing).
* Fixed home screen not working (not really, it just gets disabled :p).
* Fixed crash when using Mesa drivers.

## Known issues

* Maya will crash when trying to activate the software with a serial key.

* Pymel for Maya 2022 throws warnings when executing a Python script when installing.

* The home screen of Maya 2022 does not work.

* The mtoh.so plug-in will give and error saying that "hdArnold.so" could not
  find "libai.so"

## I think that's all

If you find any issues, let me know. I'll try to fix them  c:
