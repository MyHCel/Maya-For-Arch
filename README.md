# Maya For Arch

## About

Maya For Arch is a simple script that helps you install Autodesk Maya on Arch Linux (and perhaps on Arch based distros).

## Dependencies

These are the dependencies needed by the script. All dependencies needed by Maya are installed by the script.

* yay

* Multilib enabled

## How to use it

Note: Depending on your processor, converting the rpm packages may take quite some or a painful amount of time to finish. Be patient!

1. Download Maya for Linux from https://www.autodesk.com/

2. Clone this project wherever you like on your PC.

```bash
git clone https://github.com/MyHCel/Maya-For-Arch.git
```

3. Put the "tgz" file inside the "Maya-For-Arch" folder (you can also use you file manager).

```bash
mv /path/to/Autodesk_Maya_for_Linux.tgz /path/to/Maya-For-Arch/
```

4. Execute the installer script (don't do it as root). It will ask for your password once.

   Note: This will update your system and install all required dependecies. If you don't want
   to update your system, modify "scripts/version/dependencies.sh"

```bash
./install.sh
```

5. Select the Maya version you want to install.

```bash
 Select the version you want to install

 [1] Maya 2020
 [2] Maya 2022
```

5. 1. If the script does not execute, chmod all ".sh" files

```bash
chmod +x install.sh
```
```bash
chmod +x uninstall.sh
```
```bash
chmod +x -R scripts
```

6. Before finishing the installation process, Maya will launch. You will have to login to be able
   to use the software. Then you can close it.

7. Maya should now be up and running! If you want to repeat a certain part of the installation
   process, you can execute the corresponding script located in "scripts".

Note: You can delete the "Maya-For-Arch" folder once the installation is done.

## Uninstalling Maya

1. Execute the uninstall script

```
./uninstall.sh
```

2. Select the Maya version you want to uninstall.

```bash
 Select the version you want to uninstall

 [1] Maya 2020
 [2] Maya 2022
```

The uninstaller will remove the installed packages (except for dependencies) from pacman and will delete all the directories used by Maya (at least the ones I know).

## Updates

* Maya 2022 is now supported.

## Important update

Most errors caused by OpenSSL are now gone! This means that Maya will now work properly, also, RenderMan for Maya is now working.  C:

If you installed Maya before by using this script or following [this guide](https://www.reddit.com/r/ManjaroLinux/comments/k3jz5a/how_to_install_maya_2020_renderman_23_on_manjaro/) or [this guide](https://medium.com/@llama_9851/installing-maya2020-on-arch-linux-e257ffadd52c), you may want to remove the following symlinks and execute the following script instead of reinstalling the whole thing.

```bash
rm /usr/lib/libssl.so.10
```
```bash
rm /usr/lib/libcrypto.so.10
```

"version" is your installed version of Maya (2020 or 2022)

```bash
sudo ./scripts/version/libs.sh
```

Huge thanks to [u/r_burgess](https://www.reddit.com/user/j_burgess/) for helping me diagnose the main problem
with OpenSSL.

## Known issues

* Some features such as colour managment and viewport 2.0 won't be available on graphics cards that
  don't support OpenGL 4 (Intel graphics and older graphics cards).

* Maya will crash when trying to activate the sowftare with a serial key.

* Pymel for Maya 2022 fails to execute a Python script when installing.

## I think that's all

If you find any issues, let me know. I'll try to fix them  c:
