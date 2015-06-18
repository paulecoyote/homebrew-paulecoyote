require "formula"

class DartEditorEdge < Formula
  url "https://storage.googleapis.com/dart-archive/channels/be/raw/4155dd73d9ddcc586446fc3be77b8ce787924e4e/editor/darteditor-macos-x64.zip"
  homepage "https://www.dartlang.org/tools/editor/"
  version "4155dd73d9ddcc586446fc3be77b8ce787924e4e"
  md5 "xml"
  
  # conflicts_with 'dart-editor-dev', :because => 'installation of dart-dsk tools in path'
# conflicts_with 'dart-editor-edge-cs', :because => 'installation of dart-dsk tools in path'
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
