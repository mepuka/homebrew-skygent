class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/skygent-bsky"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.1/skygent-darwin-arm64"
      sha256 "3118b2a040c92ecf4304b68f3c728822724eab3ffb851dd0b1b63ad9ea7d1964"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.1/skygent-darwin-x64"
      sha256 "30a63a5b6d0b2199247c96c2e0fda1cccf3a4a35223daeeb1d8fe33e772d5284"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.1/skygent-linux-arm64"
      sha256 "1dcf79b77a2d01241ebeebedfbf8ebdd6906c5c55b4639c9b275483122b5ce95"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.1/skygent-linux-x64"
      sha256 "fc19ba388df6ce475afe166d6870262ea6a22669af08c6c7f5221e58730af054"
    end
  end

  def install
    binary = Dir["skygent-*"].first || "skygent"
    bin.install binary => "skygent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skygent --version")
  end
end
