class Encore < Formula
  desc "Fast terminal client for Apple Music on macOS"
  homepage "https://github.com/bogdankim/encore"
  url "https://github.com/bogdankim/encore/releases/download/v0.5.4/encore-0.5.4-darwin-universal.tar.gz"
  sha256 "166d0089a9875d4fea837c538c2aac19c3e6afe79cdafc423592b5b764ee7da7"
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
