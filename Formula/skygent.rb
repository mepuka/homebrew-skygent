class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/skygent-bsky"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.0/skygent-darwin-arm64"
      sha256 "52d4849d00f83cd1f9d163396b71a27ac5dd4a0dd192940a83e06e69a21add58"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.0/skygent-darwin-x64"
      sha256 "5676ebd16d44f0c87c974c47ac3f2d0267d2159eaa7b8c7c8ce30059085ef400"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.0/skygent-linux-arm64"
      sha256 "91f5c96e453c0eec6ae3cd59fe255d319868b4166306f21a3cac1d060a239127"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.8.0/skygent-linux-x64"
      sha256 "5c746e0dc44de74bd069c15d2e0e7f66364f3a31e3a058bd858605d22c072e06"
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
