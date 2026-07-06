cask "prosciutto" do
  version "0.3.0"
  sha256 "7bb28df79118662a2f27dccc69c7f6ab2d6b297bd8b543a8e54f721256d15094"

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
