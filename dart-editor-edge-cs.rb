require "formula"

class DartEditorEdgeCs < Formula
  url "https://storage.googleapis.com/dart-archive/channels/be/raw/42024/editor/darteditor-macos-x64.zip"
  homepage "https://www.dartlang.org/tools/editor/"
  version "42024"
  md5 "70bda7beeba469f229814c0c3c14a51b"
  
  # conflicts_with 'dart-editor-dev', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor-edge', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor-stable', :because => 'installation of dart-dsk tools in path'
        # conflicts_with 'dart', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor', :because => 'installation of dart-dsk tools in path'
  depends_on :arch => :x86_64

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
