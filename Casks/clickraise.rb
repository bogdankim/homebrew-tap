cask "clickraise" do
  version "0.1.0"
  sha256 "940e89ad74c198c48e9ea0abaa1b2f600981a746b39a9289f6155d40dfa162a1"

  url "https://github.com/bogdankim/clickraise/releases/download/v#{version}/ClickRaise.zip"
  name "ClickRaise"
  desc "Windows-style click-to-raise — the first click on a background window registers"
  homepage "https://github.com/bogdankim/clickraise"

  app "ClickRaise.app"

  uninstall quit: "dev.bogdankim.ClickRaise"

  zap trash: [
    "~/Library/Preferences/dev.bogdankim.ClickRaise.plist",
  ]

  caveats <<~EOS
    ClickRaise releases are not notarized. If macOS refuses to open the app,
    reinstall with the quarantine flag disabled:

      brew reinstall --cask clickraise --no-quarantine

    ClickRaise needs Accessibility permission:
      System Settings → Privacy & Security → Accessibility → enable ClickRaise
  EOS
end
