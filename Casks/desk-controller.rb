cask "desk-controller" do
  version "1.0.0"
  sha256 "994db8ce819aae4a9124e6ad0fe7e2d1f196a0a537ae1dcf0acc8708f0af85de"

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
