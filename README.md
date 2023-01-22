# keyboard

This repository contains my keyboard setup for Linux and Windows. The idea is to make Capslock act as an additional modifier in order to map frequently used keys to the home row.

![alt text](keyboard.png "CapsLock functionality overview")

## Usage

Downloaded the [latest release](https://github.com/schmittl/keyboard/releases/latest) for Linux or Windows

### Linux

You only need to use one of the following methods

#### xkb (X keyboard extension)

See `xkb/us`

#### keyd

See `keyd/default.conf`

#### Xmodmap (deprecated)

See `xmodmap/.Xmodmap`

### Windows

* Run `setup.exe` to install the custom keyboard layout.
* Run `create_startup_shortcut.bat` to install a shortcut in the startup folder that runs the AutoHotKey script automatically when Windows is started.
    * Alternatively press `Win + R`, run `shell:common startup` and copy the `caps.exe` to this folder.

## How it works

### Linux

Under Linux using `xkb` seems to work best across different DEs, although it does not work in virtual consoles. `xkb` configuration is achieved by adding entries to a symbol and a rules file.

Alternatively `keyd` can be used to recreate the same keyboard layout and also works in virtual consoles. 

Configuration via `xmodmap` is also possible, but it is a deprecated mechanism.

### Windows

Under Windows two different components are used:

[ahk/](windows/ahk/) Script for AutoHotKey to let Capslock act as an additional modifier.

[us-ger/](windows/us-ger/) Customized US keyboard layout. Requires MSKLC to build the layout.

The us-ger keyboard layout is used to provide a reliable remapping of the z and y keys in some applications and to add a few additional keys via the AltGr modifier to the default US layout.

## Known issues

keyd is unable to remap 'less / greater'-key on international keyboards :(

## Packaging instructions

Create keyboard layout installation files via [MSKLC](https://www.microsoft.com/en-us/download/details.aspx?id=102134) `Project -> Build DLL and Setup Package`.

Compile caps.ahk into `.exe`. The resulting `.exe` does not require AHK to be installed on the system.

Create release archive
```bash
# first move everything release folder
# then create release archive
tar -czvf release.tar.gz release
```

## License

Files are released under the unlicense. See [LICENSE](LICENSE) or http://unlicense.org/
