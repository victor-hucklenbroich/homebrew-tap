cask "desk-controller" do
  version "1.3.1"
  sha256 "691d98cf0b958bd677d6bd5abcc1c37d357fec80ca668848d1805adc6339b0b8"

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
