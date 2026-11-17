# SPDX-FileCopyrightText: 2026 amivuln contributors
# SPDX-License-Identifier: CC0-1.0
class Amivuln < Formula
  desc "Backport-aware CVE check for binaries, services and packages on this host"
  homepage "https://github.com/nubian-ibex/amivuln"
  url "https://github.com/nubian-ibex/amivuln/releases/download/v0.4.1/source.tar.gz"
  sha256 "5cc9d3cbb51b49ce13bd20cd798a4549195a6683d25f9eec6d633bc637ac7310"
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
