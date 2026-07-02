cask "desk-controller" do
  version "1.2.0"
  sha256 "2137877cbae7e439bbcfb3f0836d93a264f08d9588190fd5e8faa99843c2b05e"

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
