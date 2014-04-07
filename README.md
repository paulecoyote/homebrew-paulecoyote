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
| DartEditorDev | 1.3.0-dev.7.11 | 34756 | [Zip](http://storage.googleapis.com/dart-archive/channels/dev/release/34756/editor/darteditor-macos-x64.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/dev/release/34756/editor/darteditor-macos-x64.zip.md5sum) | [Changes](http://storage.googleapis.com/dart-archive/channels/dev/release/latest/changelog.html) |
| DartEditorEdge | 1.3.0-edge.34798 | 34798 | [Zip](http://storage.googleapis.com/dart-archive/channels/be/raw/34798/editor/darteditor-macos-x64.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/be/raw/34798/editor/darteditor-macos-x64.zip.md5sum) | - |
| DartEditorEdgeCs | 1.3.0-edge.34785 | 34785 | [Zip](http://storage.googleapis.com/dart-archive/channels/be/raw/34785/editor/darteditor-macos-x64.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/be/raw/34785/editor/darteditor-macos-x64.zip.md5sum) | - |
| DartEditorStable | 1.2.0 | 33014 | [Zip](http://storage.googleapis.com/dart-archive/channels/stable/release/33014/editor/darteditor-macos-x64.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/stable/release/33014/editor/darteditor-macos-x64.zip.md5sum) | [Changes](http://storage.googleapis.com/dart-archive/channels/stable/release/latest/changelog.html) |
| DartContentShellDev | 1.3.0-dev.7.11 | 34756 | [Zip](http://storage.googleapis.com/dart-archive/channels/dev/release/34756/dartium/content_shell-macos-ia32-release.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/dev/release/34756/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
| DartContentShellEdge | 1.3.0-edge.34785 | 34785 | [Zip](http://storage.googleapis.com/dart-archive/channels/be/raw/34785/dartium/content_shell-macos-ia32-release.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/be/raw/34785/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
| DartContentShellStable | 1.2.0 | 33014 | [Zip](http://storage.googleapis.com/dart-archive/channels/stable/release/33014/dartium/content_shell-macos-ia32-release.zip) | [md5](http://storage.googleapis.com/dart-archive/channels/stable/release/33014/dartium/content_shell-macos-ia32-release.zip.md5sum) | - |
