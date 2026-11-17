# SPDX-FileCopyrightText: 2026 amivuln contributors
# SPDX-License-Identifier: CC0-1.0
class Amivuln < Formula
  desc "Backport-aware CVE check for binaries, services and packages on this host"
  homepage "https://github.com/nubian-ibex/amivuln"
  url "https://github.com/nubian-ibex/amivuln/releases/download/v0.5.0/source.tar.gz"
  sha256 "5b549da2ee357936e7a66a10b89fb9df5f1f9f87db5bf7b5540538b9fd5b8c2c"
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
