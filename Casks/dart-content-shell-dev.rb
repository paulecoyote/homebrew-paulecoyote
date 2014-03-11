class DartContentShellDev < Cask
  url "http://gsdview.appspot.com/dart-archive/channels/dev/release/33495/dartium/content_shell-macos-ia32-release.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "33495"
  md5 "c75cbdae417e402f91582085aad6f124"
  
    def install
    prefix.install Dir['*']

      content_shell_path = prefix+'chromium/content_shell'
      (content_shell_path).install resource('content_shell')

      item = Dir["#{content_shell_path}/Content Shell.app/Contents/MacOS/Content Shell"]

      bin.install_symlink Hash[item, 'content_shell']
  end
end
