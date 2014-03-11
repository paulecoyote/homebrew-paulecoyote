class DartContentShellStable < Formula
  url "http://gsdview.appspot.com/dart-archive/channels/stable/release/33014/dartium/content_shell-macos-ia32-release.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "33014"
  md5 "4ec3aca03b87490143e6554ab875aef2"
  
    def install
    prefix.install Dir['*']

      content_shell_path = prefix+'chromium/content_shell'
      (content_shell_path).install resource('content_shell')

      item = Dir["#{content_shell_path}/Content Shell.app/Contents/MacOS/Content Shell"]

      bin.install_symlink Hash[item, 'content_shell']
  end
end
