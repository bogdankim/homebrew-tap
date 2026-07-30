cask "clickraise" do
  version "0.1.0"
  sha256 "940e89ad74c198c48e9ea0abaa1b2f600981a746b39a9289f6155d40dfa162a1"

  url "https://github.com/bogdankim/clickraise/releases/download/v#{version}/ClickRaise.zip"
  name "ClickRaise"
  desc "Windows-style click-to-raise — the first click on a background window registers"
  homepage "https://github.com/bogdankim/clickraise"

  app "ClickRaise.app"

  # Releases are built by CI but not notarized; without this Gatekeeper
  # refuses to launch the quarantined app.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClickRaise.app"]
  end

  uninstall quit: "dev.bogdankim.ClickRaise"

  zap trash: [
    "~/Library/Preferences/dev.bogdankim.ClickRaise.plist",
  ]

  caveats <<~EOS
    ClickRaise needs Accessibility permission:
      System Settings → Privacy & Security → Accessibility → enable ClickRaise

    Because releases are ad-hoc signed, the permission must be re-granted
    after every update (toggle ClickRaise off and on in that list).
  EOS
end
