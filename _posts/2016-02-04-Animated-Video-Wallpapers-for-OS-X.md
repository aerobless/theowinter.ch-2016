---
layout: article
icon: fa-apple
title: Live/Video Wallpapers for OS X
description: "With this simple bash command you can use any screensaver as a animated live wallpaper on OS X."
category: articles
share: true
comments: true
tags: [Apple, OS X]
image:
  feature: live_wallpaper.jpg
  video: liveWallpaperHeader.mp4
---

Did you know that you can use any screensaver as a animated live wallpaper on OS X? This is how you do it.

  1. Open a new terminal window
  2. Type the following command and press enter: `/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`
  
Once you type `crtl-c` or close the terminal window the screensaver stops playing. 

In order to have a bit more comfortable access to this command I've added the following aliases to my .bash_profile file. 
*(.bash_profile can be used to store terminal settings, aliases and custom functions. It is located in your user directory,
 e.g. `/Users/theowinter/.bash_profile` and loaded whenever you open a new terminal window.)*
 
<script src="https://gist.github.com/aerobless/9517d49e0e4be845212a.js"></script>

####Cool "Live Wallpaper" screensavers

+ My favourite live wallpaper is the "[Apple TV Aerial](https://github.com/JohnCoates/Aerial){:target="_blank"}" screensaver. It consists of beautiful 1080p video flyovers of 
cities like New York and London.
+ Another cool screensaver is "[SaveHollywood](http://s.sudre.free.fr/Software/SaveHollywood/about.html){:target="_blank"}". You can specify a folder and it will play the videos in there.

There's probably a ton of other screensavers that might be cool as animated desktop background. So let me know if you find some!
