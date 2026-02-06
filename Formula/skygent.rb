class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/bsky-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.7.0/skygent-darwin-arm64"
      sha256 "71c05f1ffec4d79d58d3acbb44a9d4c73b4a96be71e921567da77c4da5627121"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.7.0/skygent-darwin-x64"
      sha256 "ec66195d8fd2aa4e7d1a500ae316c3a84f44521b215b2ccce530414e123b14f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.7.0/skygent-linux-arm64"
      sha256 "d02fb31ac37ef95f9e19f1fc617305e810d132870e19bd8b75d9957568b1607c"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.7.0/skygent-linux-x64"
      sha256 "c3e0f32165ff3e191bea58c62aafc4cc6bd6d29355336cb76924dc6e3aab76d8"
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
