cask "desk-controller" do
  version "1.1.1"
  sha256 "10e70be1e636551151493e6e27a8b135fbbe5ba2005af7a07f1957448b4046f0"

  url "https://github.com/victor-hucklenbroich/desk-controller/releases/download/v#{version}/DeskController-#{version}.zip"
  name "DeskController"
  desc "Menu bar app for Linak-based standing desks"
  homepage "https://github.com/victor-hucklenbroich/desk-controller"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  # The app shells out to linak-controller at runtime
  depends_on formula: "victor-hucklenbroich/tap/linak-controller"

  app "DeskController.app"

  zap trash: [
    "~/Library/Application Support/linak-controller",
    "~/Library/Logs/DeskController.log",
    "~/Library/Logs/DeskController_error.log",
  ]

  caveats <<~EOS
    DeskController controls a Linak based standing desk via Bluetooth. Before first use:

      * Make sure your desk is already paired to this Mac via Bluetooth.
      * Launch DeskController from /Applications and enter your desk's UUID.

    The required 'linak-controller' CLI is installed automatically as a
    dependency of this cask.
  EOS
end
