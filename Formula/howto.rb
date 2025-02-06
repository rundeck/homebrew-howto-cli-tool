
require 'formula'

VERSION = "0.1.23"
SHA = "0911a1a47a5869c7b33c18dc8b8badb4d7e14d9394928a0e37003ad99249b42c"

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
