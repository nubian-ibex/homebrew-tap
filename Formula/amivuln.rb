# SPDX-FileCopyrightText: 2026 amivuln contributors
# SPDX-License-Identifier: CC0-1.0
class Amivuln < Formula
  desc "Backport-aware CVE check for binaries, services and packages on this host"
  homepage "https://github.com/nubian-ibex/amivuln"
  url "https://github.com/nubian-ibex/amivuln/releases/download/v0.0.13/source.tar.gz"
  sha256 "f5efc1aa10152094ada195ea232280b37608cfc6be9575187835b4ab30ad6216"
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
