# Casks/revda.rb
cask "revda" do
  version "2026.03.20-8aa4319"
  sha256 "6f4c4e0fa244d92d109547c3d40c4d982ceed2880488866f99434fd0d3b6d46c"

  url "https://github.com/MrAru/revda-macos-build/releases/download/#{version}/revda_5.2.0_aarch64.dmg"
  name "Revda"
  desc "Revda media player"
  homepage "https://github.com/MrAru/revda-macos-build"

  app "revda.app"
  binary "#{appdir}/revda.app/Contents/MacOS/dmlive"
end
