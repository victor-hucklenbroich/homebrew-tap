cask "desk-controller" do
  version "1.4.0"
  sha256 "ecbf2a63e302405572fe608d36751b7605016d555e2de2fa7b56060db4f3148a"

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
