class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/bsky-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v#{version}/skygent-darwin-arm64"
      sha256 "a06b2964abb71495584207ce8906df31790da50b2787a0954bd7303c06fdfa88"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v#{version}/skygent-darwin-x64"
      sha256 "61dbe8b42115d6f2a062736300d94b8621adc03bdc5816b004dc6ac4247355a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v#{version}/skygent-linux-arm64"
      sha256 "80e03b89571cd56606e7ac3d4ad5f941f1f2564e8cf8b1bbdd68b8a340232f58"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v#{version}/skygent-linux-x64"
      sha256 "088701e5c68a803c3f31e529aa85a74223db1406fddc5c5f9381249f4fb3123d"
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
