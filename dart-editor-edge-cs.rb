require "formula"

class DartEditorEdgeCs < Formula
  url "http://storage.googleapis.com/dart-archive/channels/be/raw/37890/editor/darteditor-macos-x64.zip"
  homepage "http://www.dartlang.org/tools/editor/"
  version "37890"
  md5 "ed095174e79a3b3fa469b38f0309b425"
  
  # conflicts_with 'dart-editor-dev', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor-edge', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor-stable', :because => 'installation of dart-dsk tools in path'
          conflicts_with 'dart', :because => 'installation of dart-dsk tools in path'
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
