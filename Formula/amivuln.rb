# SPDX-FileCopyrightText: 2026 amivuln contributors
# SPDX-License-Identifier: CC0-1.0
class Amivuln < Formula
  desc "Backport-aware CVE check for binaries, services and packages on this host"
  homepage "https://github.com/nubian-ibex/amivuln"
  url "https://github.com/nubian-ibex/amivuln/releases/download/v0.4.0/source.tar.gz"
  sha256 "461c0bcee1bd1255f3256a86f9277d95f1111c2cf50d8ed99ca7a1c0cbb60456"
  license "MIT OR Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "amivuln"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amivuln --version")
  end
end
