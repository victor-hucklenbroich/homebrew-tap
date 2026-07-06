cask "desk-controller" do
  version "1.3.2"
  sha256 "e958cf19d82e9402a44acdfb2cb5377a24d30be21f328b48cf508e13504b48f7"

  url "https://github.com/victor-hucklenbroich/desk-controller/releases/download/v#{version}/DeskController-#{version}.zip"
  name "DeskController"
  desc "Menu bar app for Linak-based standing desks"
  homepage "https://github.com/victor-hucklenbroich/desk-controller"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DeskController.app"

  zap trash: [
    "~/Library/Application Support/DeskController",
    "~/Library/Logs/DeskController.log",
    "~/Library/Logs/DeskController_error.log",
  ]

  caveats <<~EOS
    DeskController controls a Linak based standing desk via Bluetooth. Before first use:

      * Make sure your desk is already paired to this Mac via Bluetooth.
      * Launch DeskController from /Applications and enter your desk's UUID.
      * Grant DeskController Bluetooth access when macOS asks for it.
  EOS
end
