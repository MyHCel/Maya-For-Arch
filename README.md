# Maya For Arch

## About

Maya For Arch is a simple script that helps you install Autodesk Maya on Arch Linux (and perhaps on Arch based distros).

Currently, the only supported version is Maya 2020.

## Dpependencies

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

3. Put the "tgz" file inside its correspondig version folder (you can also use you file manager).

```bash
mv /path/to/Autodesk_Maya_2020_ML_Linux_64bit.tgz /path/to/Maya-For-Arch/2020/
```

4. Execute the installer script (don't do it as root). It will ask for your password a few times.

   Note: This will update your system and install all required dependecies. If you don't want that
   to happen, modify "scripts/install_dep.sh"

```bash
./install.sh
```

4.1. If the script does not execute, chmod all ".sh" files

```bash
chmod +x install.sh
chmod +x uninstall.sh
chmod +x -R scripts
```

5. Before finishing the installation process, Maya will launch. You will have to login to be able
   to use the software. Then you can close it.

6. Maya should now be up and running! If you want to repeat a certain part of the installation
   process, you can execute the corresponding script located in "scripts".

## Uninstalling Maya

1. Execute the uninstall script

```
./uninstall.sh
```

The uninstaller will remove the installed packages (except for dependencies) from pacman and will delete all the directories used by Maya (at least the ones I know).

## Known issues

* Maya will crash when trying to activate the sowftare with a serial key.

* Some features such as colour managment and viewport 2.0 won't be available on graphics cards that
   don't support OpenGL 4 (Intel graphics).

## Notes

* You can delete the "Maya-For-Arch" folder once the installation is done.

## I think that's all

If you find any issues, let me know. I'll try to fix them  c:
