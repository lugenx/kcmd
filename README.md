# kcmd - AutoLISP Command Line Management Tool

**kcmd** is an AutoLISP-based application that provides efficient tools for managing layers, files, and directories directly from the command line using the keyboard. Each command is designed to streamline typical AutoCAD management tasks without needing the mouse, making it ideal for users who prefer keyboard-based interactions.

## Installation

1. **Download the Latest Version**: Download the latest version of `kcmd.lsp` from the [releases page](#) (https://github.com/lugenx/kcmd/releases).
2. **Load the Application**: Use the `Appload` command in AutoCAD to load the `kcmd.vlx` file.
3. **Start Using**: All commands start with a colon (`:`). For example, use `:flayer` to activate the layer management tool.

## Command List

### 1. `:flayer`
- **Description**: Filter, view, and manage layers in the current drawing.
- **Usage**:
  1. Type `:flayer` in the command line.
  2. Enter a partial layer name to filter.
  3. Use the displayed keyboard shortcuts to select and manipulate layers.
- **Actions**: Turn on/off, freeze/unfreeze, lock/unlock, and make layers plottable/not plottable.

### 2. `:sfile`
- **Description**: Quickly switch between open files based on a user-provided substring.
- **Usage**:
  1. Type `:sfile` in the command line.
  2. Enter a file substring.
  3. The tool will switch to the matching file if found.

### 3. `:slayer`
- **Description**: Search and switch between layers based on a partial name match.
- **Usage**:
  1. Type `:slayer` in the command line.
  2. Enter a layer substring.
  3. The tool will switch to the specified layer if found.

### 4. `:stab`
- **Description**: Search and switch between layout tabs.
- **Usage**:
  1. Type `:stab` in the command line.
  2. Enter a layout tab substring.
  3. The tool will switch to the specified tab if found.

### 5. `:nav`
- **Description**: Navigate the file system directly from AutoCAD's command line.
- **Usage**:
  1. Type `:nav` in the command line.
  2. Enter commands like `cd` to change directories, `ls` to list files, `openfile` to open a file, or `opendir` to open the directory in Windows Explorer.
- **Commands**:
  - `cd [directory]`: Change to a specified directory.
  - `ls`: List files in the current directory.
  - `openfile [filename]`: Open a file within the directory.
  - `opendir`: Open the current directory in Windows Explorer.

### 6. `:odirectory`
- **Description**: Opens the folder containing the current drawing in Windows Explorer.
- **Usage**: Type `:odirectory` in the command line.

## Support and Feedback
For bug reports or feature requests, please open an issue on the [GitHub repository](#) (https://github.com/lugenx/kcmd).


