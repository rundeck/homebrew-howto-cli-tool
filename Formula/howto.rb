
require 'formula'

VERSION = "0.1.24"
SHA = "eed869ed7812ddd07dcd80ad348edae2bd622704615e2a9dc4e7ff5881191af5"

class Howto < Formula
  homepage "https://github.com/rundeck/howto-cli-tool"
  desc "How to CLI Tool"
  url "https://github.com/rundeck/howto-cli-tool/releases/download/v#{VERSION}/how-#{VERSION}-all.jar"

  version VERSION
  sha256 SHA
  #depends_on "java"

  def install
    file = Dir.glob("*-all.jar").first
    libexec.install file => "how-#{VERSION}-all.jar"
    bin.write_jar_script libexec/"how-#{VERSION}-all.jar", "how"  
  end

  test do
    assert_match "#{VERSION}\n", shell_output("#{bin}/how --version 2>&1")
  end
end
