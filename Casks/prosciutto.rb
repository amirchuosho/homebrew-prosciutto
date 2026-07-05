cask "prosciutto" do
  version "0.1.0"
  sha256 "3b1e95cc9ec6be08fbd246a57c66e07f09d9b4f4eea28fd727d2f9e82fb3eadb"

  url "https://github.com/amirchuosho/prosciutto/releases/download/v#{version}/Prosciutto-#{version}.zip",
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
