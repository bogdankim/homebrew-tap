class Encore < Formula
  desc "Fast terminal client for Apple Music on macOS"
  homepage "https://github.com/bogdankim/encore"
  url "https://github.com/bogdankim/encore/releases/download/v0.4.0/encore-0.4.0-darwin-arm64.tar.gz"
  sha256 "7dafc119a6edc80abb644ebcfae73e016b25d90d6082790e9605abd22b634311"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "encore"
  end

  def caveats
    <<~EOS
      On first launch macOS asks whether encore may control Music and
      access your media library. Allow both.

      encore uses private macOS APIs, so a macOS or Music update can
      break parts of it.
    EOS
  end

  test do
    assert_match "encore #{version}", shell_output("#{bin}/encore --version")
  end
end
