class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/skygent-bsky"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.7.1/skygent-darwin-arm64"
      sha256 "ff6cbf14e19950ffd02269c1567d3f583031ea5c98326b0196a091784e4e94de"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.7.1/skygent-darwin-x64"
      sha256 "ff2ff375bafc905295de14219929ad6eee7c6de5ef67fe634d1ffae9dff5b27a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.7.1/skygent-linux-arm64"
      sha256 "f2d2d5f461bf8fae65d8de0840f8a6f9a3fd6a390c88ad7e2cd7f1dfe3e2e9d4"
    else
      url "https://github.com/mepuka/skygent-bsky/releases/download/v0.7.1/skygent-linux-x64"
      sha256 "359cdf6cf5afddb7c648ecca287968b4e2a14d1cb4a14bbde90606a48677c300"
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
