homebrew-paulecoyote
====================

Homebrew formula that track the three different channels of release for the Google Dart Editor + SDK and Content Shell.  #dartlang #dart

dart-editor
===========

Generated using: https://github.com/PaulECoyote/rubydartbrewery
Automatically generated and updated frequently (on the hour most hours of the day)
Unlike other taps, this one also uses Google's provided md5 key as part of the formula in addition to never being more than an hour behind.

Install
-------
brew tap PaulECoyote/homebrew-paulecoyote

Choose version:
* dart-editor-edge - latest edge
* dart-editor-edge-cs - latest edge that has a content shell built for it
* dart-editor-dev - latest dev
* dart-editor-stable - latest stable build

For just the editor and SDK:
brew install dart-edtitor-dev
... though using a more qualified name may be necessary ...
brew install paulecoyote/paulecoyote/dart-editor-dev

You may also choose a content shell:
brew install dart-content-shell-dev

Afterwards use 
brew linkapps

This formula will conflict with dart, dart-editor and between versions of the dart-editors here.  Follow instructions given by brew to unlink / uninstall conflicting versions.

Links
=====
* For Homebrew info see http://brew.sh
* For the Google Dart language see https://www.dartlang.org/
* For the scripts that generate these homebrew formula see https://github.com/PaulECoyote/rubydartbrewery
* Based on work originally done by Kevin Moore. This alternative wraps up the content shell and is manually maintained.  See: 
    * http://work.j832.com/2013/11/if-you-do-any-open-source-development.html
    * https://github.com/kevmoo/homebrew-kevmoo

Versions
========
| Edition | Version | Revision | Archive | MD5 | Notes |
| ------- | ------- | -------- | ------- | --- | ----- |
| DartEditorDev | 1.9.0-dev.10.13 | 44630 | [Zip](https://storage.googleapis.com/dart-archive/channels/dev/release/44630/editor/darteditor-macos-x64.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/dev/release/44630/editor/darteditor-macos-x64.zip.md5sum) | [Changes](https://storage.googleapis.com/dart-archive/channels/dev/release/latest/changelog.html) |
| DartEditorEdge | 1.10.0-edge.44685 | 44685 | [Zip](https://storage.googleapis.com/dart-archive/channels/be/raw/44685/editor/darteditor-macos-x64.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/be/raw/44685/editor/darteditor-macos-x64.zip.md5sum) | - |
| DartEditorEdgeCs | 1.10.0-edge.44684 | 44684 | [Zip](https://storage.googleapis.com/dart-archive/channels/be/raw/44684/editor/darteditor-macos-x64.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/be/raw/44684/editor/darteditor-macos-x64.zip.md5sum) | - |
| DartEditorStable | 1.9.1 | 44672 | [Zip](https://storage.googleapis.com/dart-archive/channels/stable/release/44672/editor/darteditor-macos-x64.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/stable/release/44672/editor/darteditor-macos-x64.zip.md5sum) | [Changes](https://storage.googleapis.com/dart-archive/channels/stable/release/latest/changelog.html) |
| DartContentShellDev | 1.9.0-dev.10.13 | 44630 | [Zip](https://storage.googleapis.com/dart-archive/channels/dev/release/44630/dartium/content_shell-macos-ia32-release.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/dev/release/44630/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
| DartContentShellEdge | 1.10.0-edge.44684 | 44684 | [Zip](https://storage.googleapis.com/dart-archive/channels/be/raw/44684/dartium/content_shell-macos-ia32-release.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/be/raw/44684/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
| DartContentShellStable | 1.9.1 | 44672 | [Zip](https://storage.googleapis.com/dart-archive/channels/stable/release/44672/dartium/content_shell-macos-ia32-release.zip) | [md5](https://storage.googleapis.com/dart-archive/channels/stable/release/44672/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
