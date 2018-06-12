# Always boot in verbose mode
sudo nvram boot-args="-v"

## Finder

# Show Library Folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set $HOME as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't default to saving documents to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Disable Bonjour multicast advertisements
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable Slow Keys.
defaults write com.apple.universalaccess slowKey -int 0

# Disable Press-And-Hold for keys.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE

  # Set key repeat triggering delay
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set a reasonably fast keyrepeat
defaults write NSGlobalDomain KeyRepeat -int 2

# Dark UI
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Reduce transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Zoom using scroll gesture with the Ctrl (^) modifier key
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

## Dock

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

## SoftwareUpdate

# System Preferences >> App Store

# This is the 1st of the 5 settings in the GUI within 10.11, 10.12
sudo /usr/sbin/softwareupdate --schedule on

# GUI System Preferences >> App Store >> enable Download newly available updates in the background
# This is the 2nd of the 5 settings in the GUI within 10.11, 10.12
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# System Preferences >> App Store >> enable Install app updates
# This is the 3rd of the 5 settings in the GUI within 10.11, 10.12
sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool false

# System Preferences >> App Store >> 4 of 5 enable Install OS X updates
# This is the 4th of the 5 settings in the GUI within 10.11, 10.12
sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

# This is the 5th of the 5 settings in the GUI within 10.11, 10.12
# enable XProtect and Gatekeeper updates to be installed automatically
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
# enable automatic security updates to be installed automatically
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# This is a one time action to trigger a background check with normal scan (critical and config-data updates only)
sudo /usr/sbin/softwareupdate --background-critical

## Apps

# Use plain text by default in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Show the full URL in the Safari address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

## Other

# Require password 5 minutes after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 3600

# Disable remote Apple Events
sudo systemsetup -setremoteappleevents off

# Create locate db
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist 2>/dev/null