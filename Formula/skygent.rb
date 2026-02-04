class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/bsky-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.6.0/skygent-darwin-arm64"
      sha256 "669908bc55883c133cba228a54a2aed91b117527776e9060f68e90c2f1617c4d"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.6.0/skygent-darwin-x64"
      sha256 "ba9115a5a42fef4ccc08694226cac66f76b110b6ef654f32136cc0d105456553"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.6.0/skygent-linux-arm64"
      sha256 "36b37e811ec1e5d2b1bb25e9e6e7bdf0e30005838e2c19a08636069a726bcc79"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.6.0/skygent-linux-x64"
      sha256 "e6f70c7420b3c8b8112934497ed2699bf6462168e3a42bb1276f6ad140acb674"
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
