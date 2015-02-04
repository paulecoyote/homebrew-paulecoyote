require "formula"

class DartContentShellEdge < Formula
  url "https://storage.googleapis.com/dart-archive/channels/be/raw/43459/dartium/content_shell-macos-ia32-release.zip"
  homepage "https://www.dartlang.org/tools/editor/"
  version "43459"
  md5 "3cdeb3b8ae3f68e4f612cde95e1c4045"
  
  # conflicts_with 'dart-content-shell-dev', :because => 'installation of dart-dsk tools in path'
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
