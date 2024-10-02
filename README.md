# kcmd - AutoLISP Command Line Management Tool for AutoCAD

**kcmd** is an AutoLISP-based application that provides efficient tools for managing layers, files, and directories directly from the AutoCAD command line using keyboard shortcuts. Each command is designed to streamline typical AutoCAD management tasks without needing the mouse, making it ideal for users who prefer keyboard-based interactions.

## Features

- Quick layer management (filter, view, on/off, freeze/unfreeze, lock/unlock, plot/no plot)
- Fast switching between open files
- Efficient layer searching and switching
- Layout tab navigation
- File system navigation from within AutoCAD
- Quick access to the current drawing's directory

## Installation

1. **Download**: Get the latest version of `kcmd.lsp` from the [releases page](https://github.com/lugenx/kcmd/releases).
2. **Load**: Use the `APPLOAD` command in AutoCAD to load the `kcmd.vlx` file.
3. **Use**: All commands start with a colon (`:`). For example, use `:flayer` to activate the layer management tool.

## Usage

### Layer Management (`:flayer`)
1. Type `:flayer` in the command line.
2. Enter a partial layer name to filter.
3. Use the displayed keyboard shortcuts to select and manipulate layers.

Actions: Turn on/off, freeze/unfreeze, lock/unlock, and toggle layer plotting.

### Switch Between Open Files (`:sfile`)
1. Type `:sfile` in the command line.
2. Enter a partial file name (file must be open).
3. The tool will switch to the matching file if found.

### Search and Switch Layers (`:slayer`)
1. Type `:slayer` in the command line.
2. Enter a partial layer name.
3. The tool will switch to the specified layer if found.

### Navigate Layout Tabs (`:stab`)
1. Type `:stab` in the command line.
2. Enter a partial layout name (e.g., "mo" for model, "1" for "Layout1").
3. The tool will switch to the specified tab if found.

### File System Navigation (`:nav`)
1. Type `:nav` in the command line.
2. Use the following commands:
   - `cd [directory]`: Change to a specified directory.
   - `ls`: List files in the current directory.
   - `openfile [filename]`: Open a file within the directory.
   - `opendir`: Open the current directory in Windows Explorer.

### Open Current Drawing Directory (`:odirectory`)
Type `:odirectory` in the command line to open the folder containing the current drawing in Windows Explorer.

## Troubleshooting

If you encounter any issues:
1. Ensure AutoCAD is up to date.
2. Verify that the `kcmd.vlx` file is correctly loaded.
3. Check the AutoCAD command line for any error messages.

## Contributing

We welcome contributions to kcmd! Here's how you can contribute:

1. **Create an Issue**: Before making any changes, please open an issue describing the feature you want to add or the bug you want to fix. This allows for discussion and ensures your contribution aligns with the project's goals.

2. **Wait for Assignment**: Wait for a maintainer to respond to your issue. They may assign the issue to you or provide feedback on the proposed changes.

3. **Fork and Create a Branch**: Once assigned, fork the repo and create a branch for your changes.

4. **Make Your Changes**: Implement your feature or bug fix.

5. **Submit a Pull Request**: When you're done, submit a pull request referencing the original issue.

6. **Code Review**: Wait for the maintainers to review your pull request. Be open to making changes if requested.

By following this process, we can ensure that all contributions are valuable and align with the project's direction. Thank you for your interest in improving kcmd!

## Support and Feedback

For bug reports or feature requests, please open an issue on the [GitHub repository](https://github.com/lugenx/kcmd/issues).

## License

This project is licensed under the GPL 3.0 License - see the [LICENSE](LICENSE) file for details.
