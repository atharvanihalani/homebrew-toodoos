cask "toodoos" do
  version "1.0"
  sha256 "4fa693b7c60e7b3b8e667e7b22414c57a77e2065606406c8883e6f2ded39395e"

  url "https://github.com/atharvanihalani/toodoos/releases/download/v#{version}/Toodoos.zip"
  name "Toodoos"
  desc "Minimal macOS menu-bar todo app with global hotkey"
  homepage "https://github.com/atharvanihalani/toodoos"

  app "Toodoos.app"
end
