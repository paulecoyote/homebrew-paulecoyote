homebrew-paulecoyote
====================

See brew.sh

darteditor
==========

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
