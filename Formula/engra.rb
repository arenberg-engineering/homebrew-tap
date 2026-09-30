# typed: false
# frozen_string_literal: true

# Homebrew Formula for Engra Native Local CLI.
# Corporate distribution under arenberg-engineering/engra-releases.
# NOTE: Native Apple Silicon (macos-arm64) is supported. Intel macOS (x86_64) is
# unsupported/deprecated and requires Rosetta 2.

class Engra < Formula
  desc "Native Local AI coding agent and developer CLI for Engra"
  homepage "https://engra.io"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/arenberg-engineering/engra-releases/releases/download/v0.1.0/engra-0.1.0-macos-arm64"
      sha256 "556bfc091e79c1214b3ab2a322e17fbc4ac5dedc94a365da7901a172f63a1be0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/arenberg-engineering/engra-releases/releases/download/v0.1.0/engra-0.1.0-linux-x64"
      sha256 "65650fc8ad6b3d6eb5f537fc3e0676807d2632f2566a2ef5ff3fcb37b110662a"
    end
  end

  def install
    binary_name = OS.mac? ? "engra-0.1.0-macos-arm64" : "engra-0.1.0-linux-x64"
    bin.install binary_name => "engra"
  end

  test do
    assert_match "engra", shell_output("#{bin}/engra --version")
  end
end
