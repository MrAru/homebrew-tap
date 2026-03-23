# Casks/revda.rb
cask "revda" do
  version "2026.03.23-718c5bc"
  sha256 "fa1a5184be6d9090776b9f808f648422f8b61bcb843ed7e97e71d108025dc214"

  url "https://github.com/MrAru/revda-macos-build/releases/download/#{version}/Revda-macOS-aarch64.dmg"
  name "Revda"
  desc "Revda media player"
  homepage "https://github.com/MrAru/revda-macos-build"

  depends_on formula: "ffmpeg"
  depends_on formula: "mpv"
  
  app "revda.app"
  binary "#{appdir}/revda.app/Contents/MacOS/dmlive"

  postflight do
    system_command "xattr", args: ["-rd", "com.apple.quarantine", "#{appdir}/revda.app"]
    system_command "codesign", args: ["--force", "--deep", "--sign", "-", "#{appdir}/revda.app"]
  end
end
