homebrew-paulecoyote
====================

See http://brew.sh

dart-editor
===========

Generated using: https://github.com/PaulECoyote/rubydartbrewery

Currently updated frequently (on the hour for a few hours a day)

**Install**
brew tap PaulECoyote/homebrew-paulecoyote

Choose version:
* dart-editor-edge - latest edge
* dart-editor-edge-cs - latest edge that has a content shell built for it
* dart-editor-dev - latest dev
* dart-editor-stable - latest stable build

For just the editor and SDK:
brew install dart-edtitor-dev

You may also choose a content shell:
brew install dart-content-shell-dev

Afterwards use 
brew linkapps

This formula will conflict with dart, dart-editor and between versions of the dart-editors here.  Follow instructions given by brew to unlink / uninstall conflicting versions.

darteditor
==========

//Will be removed soon - does not work well//

Based on http://work.j832.com/2013/11/if-you-do-any-open-source-development.html
...and dart-editor.rb found here:
https://github.com/kevmoo/homebrew-kevmoo

With any luck follows latest version of dev and raw.
Also uses the md5 files made available by google.

brew tap PaulECoyote/homebrew-paulecoyote

To install latest dev with headless testing browser:
brew install darteditor --with-content-shell

To install latest *raw* with headless testing browser:
brew install darteditor --devel --with-content-shell

To install a shortcut to your apps folder and the dart command on your command line, execute this:
brew linkapps

In your path now will be:
dart
dart2js
dartanalyzer
dartdoc
pub
content_shell (if you added the option)
