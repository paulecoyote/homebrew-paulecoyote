require "formula"

class DartContentShellDev < Formula
  url "http://storage.googleapis.com/dart-archive/channels/dev/release/35068/dartium/content_shell-macos-ia32-release.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "35068"
  md5 "88255c75d09c00ba6c67b8d56a3ede66"
  
  # conflicts_with 'dart-content-shell-edge', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-content-shell-stable', :because => 'installation of dart-dsk tools in path'
          conflicts_with 'dart', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'dart-editor', :because => 'installation of dart-dsk tools in path'
  depends_on :arch => :x86_64

  def install
    prefix.install Dir['*']

      content_shell_path = prefix+'chromium/content_shell'
      (content_shell_path).install resource('content_shell')

      item = Dir["#{content_shell_path}/Content Shell.app/Contents/MacOS/Content Shell"]

      bin.install_symlink Hash[item, 'content_shell']
  end
end
