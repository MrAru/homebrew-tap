# Casks/revda.rb
cask "revda" do
  version "2026.09.09-5e64b15"
  sha256 "98e9f28e746dabb6c2a402897ed5757671a0c9f5cf134d54cfcba070b5b260d9"

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
