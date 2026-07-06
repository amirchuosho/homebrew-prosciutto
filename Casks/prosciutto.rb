cask "prosciutto" do
  version "0.3.1"
  sha256 "95949093adc68978d749b65d6394ef6c05a1bd56732c580823442c67e935221b"

  url "https://github.com/amirchuosho/prosciutto/releases/download/v#{version}/Prosciutto-#{version}.dmg",
      verified: "github.com/amirchuosho/prosciutto/"
  name "Prosciutto"
  desc "Open-source visual clipboard manager for macOS"
  homepage "https://github.com/amirchuosho/prosciutto"

  depends_on macos: :sonoma

  app "Prosciutto.app"

  # Unsigned app (no paid Apple Developer account). Strip the Gatekeeper quarantine
  # flag so it opens without the "could not verify" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Prosciutto.app"]
  end

  zap trash: [
    "~/Library/Application Support/Prosciutto",
    "~/Library/Preferences/app.prosciutto.Prosciutto.plist",
    "~/Library/Caches/app.prosciutto.Prosciutto",
  ]
end
