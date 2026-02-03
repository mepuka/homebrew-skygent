class Skygent < Formula
  desc "Effect-based CLI for Bluesky monitoring, querying, and analytics"
  homepage "https://github.com/mepuka/bsky-cli"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.4.3/skygent-darwin-arm64"
      sha256 "ecdfaac8e653f2c7ffc1d9c803b447f32adc54e00c36ca867999a89be5dc44e9"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.4.3/skygent-darwin-x64"
      sha256 "83e3640719a7b145d21f7e29dacfcf190114533b7e75a14f7035212c0b4c3992"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.4.3/skygent-linux-arm64"
      sha256 "cd30895f7894826bd0ed583209c031d27ca5945fce911c978a060e121c552c8b"
    else
      url "https://github.com/mepuka/bsky-cli/releases/download/v0.4.3/skygent-linux-x64"
      sha256 "48015b91950c83625cf3ae9da74b62c13bb2fb1c291c0cbe2f7bd5e632e8dd8c"
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
