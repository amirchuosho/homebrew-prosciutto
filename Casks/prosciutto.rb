cask "prosciutto" do
  version "0.5.2"
  sha256 "4db3ba74895dfa25be0afdb7cae429bcc51b61b95be567786ec7903889bccdd2"

  url "https://github.com/amirchuosho/prosciutto/releases/download/v#{version}/Prosciutto-#{version}.dmg",
      verified: "github.com/amirchuosho/prosciutto/"
  name "Prosciutto"
  desc "Open-source visual clipboard manager for macOS"
  homepage "https://github.com/amirchuosho/prosciutto"

  depends_on macos: :sonoma

  app "Prosciutto.app"

  # Self-signed (not Apple-notarized — no paid Developer account). Strip the Gatekeeper
  # quarantine flag so it opens without the "could not verify" prompt.
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
