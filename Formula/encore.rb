class Encore < Formula
  desc "Fast terminal client for Apple Music on macOS"
  homepage "https://github.com/bogdankim/encore"
  url "https://github.com/bogdankim/encore/releases/download/v0.5.3/encore-0.5.3-darwin-universal.tar.gz"
  sha256 "ad37299cb438aec0b764b6a5cf14e996a632fdff9460ac8a7708e7809896189d"
  license "MIT"

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
