require "formula"

class DartContentShellDev < Formula
  url "http://gsdview.appspot.com/dart-archive/channels/dev/release/34463/dartium/content_shell-macos-ia32-release.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "34463"
  md5 "7a45b73ff3b1edef43f8b9f4e7c54246"
  
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
