# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.1'
  url "https://github.com/dapr/cli/archive/v1.5.1.tar.gz"
  sha256 "4e5237bfb7192bdd798e15edece51adfaeb6734869d43e1f2459ebfea2cddd93"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.1"
    sha256 cellar: :any_skip_relocation, big_sur: "6d8591fe7225fdf9e4b36cca9df97f6ffdb44a28ddd549f7914421ca3f07a3d0"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

