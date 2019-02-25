#!/bin/bash
UNAME_RESULT=`uname`

if [ "$UNAME_RESULT" != "Darwin" ]
then
  # take the training wheels off
  defaults write com.apple.Finder AppleShowAllFiles TRUE
  defaults write com.apple.Finder ShowPathbar -bool true
  defaults write com.apple.Finder_FXShowPosixPathInTitle -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  chflags nohidden ~/Library/
  killall Finder
  open /System/Library/CoreServices/Finder.app
fi
