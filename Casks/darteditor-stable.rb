class DarteditorStable < Cask
  url "http://gsdview.appspot.com/dart-archive/channels/stable/release/33014/editor/darteditor-macos-x64.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "33014"
  md5 "4c84ee68ecd1bc0c8fb1ac80888927cd"
  
  resource 'content_shell' do
        url "http://gsdview.appspot.com/dart-archive/channels/stable/release/33014/dartium/content_shell-macos-ia32-release.zip.md5sum"
        homepage "http://www.dartlang.org/tools/editor/"
        version "33014"
        md5 "4ec3aca03b87490143e6554ab875aef2"
      end
  
  depends_on :arch => :x86_64
  conflicts_with 'dart', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'dart-editor', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'darteditor', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'darteditor-dev', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'darteditor-edge', :because => 'installation of dart-dsk tools in path'


  def shim_script target
    <<-EOS.undent
      #!/bin/bash
      export DART_SDK=#{prefix}/dart-sdk
      exec "#{target}" "$@"
    EOS
  end

  def install
    prefix.install Dir['*']

    items = Dir[prefix+'dart-sdk/bin/*'].select { |f| File.file? f }

    items.each do |item|
      name = File.basename item

      if name == 'dart'
        bin.install_symlink item
      else
        (bin+name).write shim_script(item)
      end
    end
          if build.with? 'content-shell'
            content_shell_path = prefix+'chromium/content_shell'
            (content_shell_path).install resource('content_shell')

            item = Dir["#{content_shell_path}/Content Shell.app/Contents/MacOS/Content Shell"]

            bin.install_symlink Hash[item, 'content_shell']

          end

  end

  def test
    mktemp do
      (Pathname.pwd+'sample.dart').write <<-EOS.undent
      import 'dart:io';
      void main(List<String> args) {
        if(args.length == 1 && args[0] == 'test message') {
          exit(0);
        } else {
          exit(1);
        }
      }
      EOS

      system "#{bin}/dart sample.dart 'test message'"
    end
  end
end
