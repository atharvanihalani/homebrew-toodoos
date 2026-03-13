class Toodoos < Formula
  desc "Minimal macOS menu-bar todo app with global hotkey"
  homepage "https://github.com/atharvanihalani/toodoos"
  url "https://github.com/atharvanihalani/toodoos/archive/refs/tags/v1.0.tar.gz"
  sha256 :no_check
  license :cannot_represent

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    app = prefix/"Toodoos.app/Contents"
    (app/"MacOS").mkpath
    (app/"Resources").mkpath
    cp ".build/release/Toodoos", app/"MacOS/Toodoos"

    (app/"Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>CFBundleName</key>
          <string>Toodoos</string>
          <key>CFBundleDisplayName</key>
          <string>Toodoos</string>
          <key>CFBundleIdentifier</key>
          <string>com.toodoos.app</string>
          <key>CFBundleVersion</key>
          <string>#{version}</string>
          <key>CFBundleShortVersionString</key>
          <string>#{version}</string>
          <key>CFBundleExecutable</key>
          <string>Toodoos</string>
          <key>CFBundlePackageType</key>
          <string>APPL</string>
          <key>LSMinimumSystemVersion</key>
          <string>14.0</string>
          <key>LSUIElement</key>
          <true/>
          <key>NSHighResolutionCapable</key>
          <true/>
      </dict>
      </plist>
    XML
  end

  def caveats
    <<~EOS
      Toodoos.app has been built at:
        #{opt_prefix}/Toodoos.app

      To use it, link it into your Applications folder:
        ln -sf #{opt_prefix}/Toodoos.app /Applications/Toodoos.app

      On first launch, macOS will ask for Accessibility permission (needed for the global hotkey).
      To start on login: System Settings > General > Login Items > add Toodoos.
    EOS
  end
end
