
require 'formula'

VERSION = "0.1.26"
SHA = "02a665a53734b975b792101bc55ed0339def51f8826d1d4e013cde8618c500ec"

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
