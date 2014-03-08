require "formula"

class Darteditor < Formula
  homepage "http://www.dartlang.org/tools/editor/"
  root_url = "http://gsdview.appspot.com/dart-archive/channels"

  # Versions numbers downloaded from VERSION file of latest
  dev_release_version_file = open("#{root_url}/dev/release/latest/VERSION").read
  dev_release_version = /\"version\"\s*:\s*\"([\w\.-]+)\"/.match(dev_release_version_file)[1]
  dev_release_revision = /\"revision\"\s*:\s*\"(\d+)\"/.match(dev_release_version_file)[1]
  dev_base_url = "#{root_url}/dev/release/#{dev_release_revision}"
  dev_url = "#{dev_base_url}/editor/darteditor-macos-x64.zip"

  #puts "TEST: " + "#{dev_release_version_file}"
  #puts "TEST: " + "#{dev_release_revision}"
  #puts "TEST: " + "#{dev_url}.md5sum"
  dev_md5_file = open("#{dev_url}.md5sum").read
  dev_md5 = /([\w]+)/.match(dev_md5_file)[1]

  url dev_url
  md5 dev_md5
  version dev_release_version

  devel do
    raw_version_file = open("#{root_url}/be/raw/latest/VERSION").read
    raw_release_version = /\"version\"\s*:\s*\"([\w\.-]+)\"/.match(raw_version_file)[1]
    raw_release_revision = /\"revision\"\s*:\s*\"(\d+)\"/.match(raw_version_file)[1]

    raw_base_url = "#{root_url}/be/raw/#{raw_release_revision}"
    raw_url = "#{raw_base_url}/editor/darteditor-macos-x64.zip"
    raw_md5_file = open("#{raw_url}.md5sum").read
    raw_md5 = /([\w]+)/.match(raw_md5_file)[1]

    url raw_url
    md5 raw_md5
    version raw_release_revision

    resource 'content_shell' do
      cs_raw_md5_file = open("#{raw_base_url}/dartium/content_shell-macos-ia32-release.zip.md5sum").read
      cs_raw_md5 = /([\w]+)/.match(cs_raw_md5_file)[1]
      url "#{raw_base_url}/dartium/content_shell-macos-ia32-release.zip"
      md5 cs_raw_md5
      version raw_release_revision
    end
  end

  # Content shell defined here otherwise devel inherits this one.
  resource 'content_shell' do
    cs_dev_md5_file = open("#{dev_base_url}/dartium/content_shell-macos-ia32-release.zip.md5sum").read
    cs_dev_md5 = /([\w]+)/.match(cs_dev_md5_file)[1]
    url "#{dev_base_url}/dartium/content_shell-macos-ia32-release.zip"
    md5 cs_dev_md5
    version dev_release_version
  end

  depends_on :arch => :x86_64
  conflicts_with 'dart', :because => 'installation of dart-dsk tools in path'
  conflicts_with 'dart-editor', :because => 'installation of dart-dsk tools in path'

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
