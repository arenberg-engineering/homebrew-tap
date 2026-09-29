# Formula/engra.rb
class Engra < Formula
  desc "Engra CLI — Arenberg Engineering's owned AI coding assistant"
  homepage "https://app.engra.io"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/arenberg-engineering/engra-releases/releases/download/v0.1.0/engra-0.1.0-macos-arm64"
      sha256 "1076c726d68f4dc7b4ee9c274c4fc0ff474e28260f2d8867f3b6d31e8cd557bd"

      def install
        bin.install "engra-0.1.0-macos-arm64" => "engra"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/arenberg-engineering/engra-releases/releases/download/v0.1.0/engra-0.1.0-linux-x64"
      sha256 "<LINUX_X64_SHA256>"

      def install
        bin.install "engra-0.1.0-linux-x64" => "engra"
      end
    end
  end

  test do
    assert_match "engra 0.1.0", shell_output("#{bin}/engra --version")
  end
end
