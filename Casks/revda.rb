# Casks/revda.rb
cask "revda" do
  version "2026.08.31-d3aac92"
  sha256 "ff9003468c871ac47ddaa5f24e0c209d47b7f00b84c98293ba25a2b0359d89f8"

  url "https://github.com/MrAru/revda-macos-build/releases/download/#{version}/Revda-macOS-aarch64.dmg"
  name "Revda"
  desc "Revda media player"
  homepage "https://github.com/MrAru/revda-macos-build"

  depends_on arch: :arm64

  app "revda.app"
  binary "#{appdir}/revda.app/Contents/MacOS/dmlive"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{appdir}/revda.app"]
    system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "#{appdir}/revda.app"]
  end

  caveats <<~EOS
    Playback requires the mpv and ffmpeg executables. They are intentionally
    not installed automatically by this cask. If they are not already
    available, install them separately with:

      brew install mpv ffmpeg
  EOS
end
