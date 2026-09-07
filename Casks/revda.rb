# Casks/revda.rb
cask "revda" do
  version "2026.09.04-dc88520"
  sha256 "197e67ad3f51af83e32feed645489db654ec40bdbdafffce55a4e98caab6f1d9"

  url "https://github.com/MrAru/revda-macos-build/releases/download/#{version}/Revda-macOS-aarch64.dmg"
  name "Revda"
  desc "Revda media player"
  homepage "https://github.com/MrAru/revda-macos-build"

  depends_on arch: :arm64

  app "revda.app"
  binary "#{appdir}/revda.app/Contents/MacOS/dmlive"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/revda.app"]
    run "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "{{appdir}}/revda.app"]
  end

  caveats <<~EOS
    Playback requires the mpv and ffmpeg executables. They are intentionally
    not installed automatically by this cask. If they are not already
    available, install them separately with:

      brew install mpv ffmpeg
  EOS
end
