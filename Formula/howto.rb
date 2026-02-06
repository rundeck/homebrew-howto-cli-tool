
require 'formula'

VERSION = "0.1.25"
SHA = "b1cb103f41c0ed6fc205663b66a236ad09e1a2c99e173bd8c7a6c9d5f38bf5c5"

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
