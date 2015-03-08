---
layout: post
title: My top 10 favourite apps on OS X Yosemite
description: "A list of my 10 favourite applications on Mac OS X Yosemite. These are little-known apps that can improve your productivity."
category: articles
tags: [OS X, Apps, Software, Programs, top 10]
image:
  feature: yosemite.jpg
  credit: Apple Inc.
  creditlink: https://www.apple.com/osx/
comments: true
share: true
---

I've made the switch to the mac world in 2012. And over the years I've found a lot of cool apps. I thought about making this list only about free software, but some of my paid apps are so essential to me that this list wouldn't really reflect my top 10 without them.

##[1. Homebrew](http://brew.sh/){:target="_blank"}
Homebrew is the missing packet manager for OS X. If you've used Linux before, you'll probably know the `apt-get` command. Homebrew is exactly that but for OS X. For example if you want to install wget you'd type `brew install wget` and Homebrew does the rest.
![Homebrew running the upgrade command]({{ site.url }}/images/homebrew.png)  
If you're a developer you absolutely must try out Homebrew. It makes setting up development environments so much easier. Need a Node.JS installation? --> `brew install node` and you're done. No need to find a download, no need to read install instructions, no need to link it correctly so that you can use the command. Homebrew keeps track of your software and you can easily update everything at once by running `brew update` followed by `brew upgrade`. This is easily the greatest thing since sliced bread.
 
##[2. Pathfinder](http://www.cocoatech.com/pathfinder/){:target="_blank"}
OS X's default finder isn't bad. But it's very minimalistic. Coming from windows I just was never really happy with the default finder and I ended up looking for a replacement.  
Pathfinder was that replacement. It's not exactly cheap at 39.95$. But to me it was worth every penny. The "Dual Pane View" is great for working with two folders. E.g. having a remote directory open in one pane and the local one in the other. The preview area at the bottom can be fully customised to display all the information that's relevant to you. You can even display a hex editor down there. Overall it's just a lot more powerful then the default finder. 
![Cocoatech Pathfinder]({{ site.url }}/images/pathfinder.png) 

##[3. iTerm2](http://iterm2.com){:target="_blank"}
The default terminal isn't bad, certainly better then the windows CMD. But there is something even better out there. It's called iTerm2 and it's completely free. With iTerm2 you gain a bunch of cool features, such as Split Panes, a Hotkey Window, Autocomplete, and a whole lot of configurability. I won't bore you with a screenshot of an empty terminal window, so look at it's [website](http://iterm2.com){:target="_blank"} if you want to see some of the features in action.

##[4. Markdown Pro](https://itunes.apple.com/us/app/markdown-pro/id465965038?mt=12){:target="_blank"}
Markdown is a really useful language to quickly take notes/write short articles. Markdown files are human readable so you don't even need a markdown reader. In fact this (and all the other) blog posts on my site are written in Markdown and the compiled to HTML via [Jekyll]({{ site.url }}/articles/Setting-up-Jekyll-on-OS-X/).  
Anyway if you're just starting out in learning markdown the editor "Markdown Pro" is really good. It has an instant preview and it has an option to easily look up the Markdown syntax. [Markdown Pro](https://itunes.apple.com/us/app/markdown-pro/id465965038?mt=12){:target="_blank"} costs 5$ in the app store and in my opinion it's worth it. But if you're short on money there's a similar app available for free called [MacDown](http://macdown.uranusjr.com/){:target="_blank"}. I haven't used MacDown myself though so you'll have to see for yourself.
![Markdown Pro]({{ site.url }}/images/markdownpro.png) 

##[5. PrivateTunnel](https://www.privatetunnel.com/){:target="_blank"}
This one isn't just a mac app. It's available for windows, android and iOS as well. And it's more of a service, but still so very useful that I think it belongs on this list. PrivateTunnel is a VPN provider with server locations in various countries (US, CH, UK, FR ..). Now you're probably thinking "Ah, you're using this to pirate things..". Nope. I use PrivateTunnel to get through the firewall at my university (have all ports open) and to access sites that are only available in the US. For example when Google Music was first released it was only available to US customers.. with PrivateTunnel I was able to get myself a Google Music subscription like 2 years before it was released in Switzerland.
PrivateTunnel lives as a daemon in the menubar of your mac, so accessing the internet from a different country is always just one click away. The software itself is free and when you first sign up you get like 100mb traffic for free to try it out. Purchasing more traffic is cheap and easy. I bought 50gb for 9$ and that's been enough for four years now. 

##[6. Spectacle](http://spectacleapp.com/){:target="_blank"}
Spectacle is a cool little app that allows you to move and resize windows with customisable keyboard shortcuts. And if someone's looking over your shoulder it will look like magic. :D  
Spectacle is free and even [open source](https://github.com/eczarny/spectacle). So go ahead and try it out.  

<video width="654" height="422" autoplay loop controls>
  <source src="{{ site.url }}/videos/spectacle.mp4" type="video/mp4">
  <object id="flowplayer" name="flowplayer" width="654" height="422" data="http://releases.flowplayer.org/swf/flowplayer-3.2.5.swf" 
            type="application/x-shockwave-flash">
      <param name="movie" value="http://releases.flowplayer.org/swf/flowplayer-3.2.5.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" 
    value='config={"clip":"{{ site.url }}/videos/toxic-todo.mp4"}' />
   </object>
</video>

##[7. Alfred](http://www.alfredapp.com/){:target="_blank"}
Nowadays Alfred is a pretty well known mac app. It's something of a Spotlight replacements on steroids. You can use it to find files, open programs and run a little code-snippets called workflows. The one workflow I use constantly is for the Leo dictionary. It's just so convenient when you're coding or writing and you need to look up a word. For example I'd type `de Fahrrad`and it would list a bunch of translations for that specific word.  
But Alfred isn't free and in the last few months it got some serious competition from Flashlight (see below).
![Alfred]({{ site.url }}/images/alfred.png) 

##[8. Flashlight](http://flashlight.nateparrott.com/){:target="_blank"}
Flashlight is an open plugin-API for OS X's native Spotlight. At the moment there are over 120 different plugins available for Flashlight. Including translator plugins similar to the Alfred workflow I mentioned above. But also other cool stuff, like running bash commands, wolfram-alpha searches and more.
Personally I find myself still using Alfred more often then Flashlight, but that's probably just because I'm more used to it. If you don't own Alfred I'd say give Flashlight a try!
![Flashlight]({{ site.url }}/images/flashlight.png) 

##9. QuickTime
QuickTime comes preinstalled on every Mac. Most people hate it and use VLC to play videos instead. I use VLC too. But what few people know is that QuickTime can do a lot more then just play videos. QuickTime can actually record videos from your webcam, screen or iOS-Device.  
Windows guys need to buy software to do this, Linux guys needs to search for a tool, but every Mac can record videos right from the start. For me this was a *"mind blown"* moment. If you need to record a short video, for example to demo an app, just use QuickTime. Want to record a Minecraft video? Just do it. Use QuickTime. Seriously.
![QuickTime]({{ site.url }}/images/quicktime.png) 

##10. Grapher
Grapher is another little gem that comes preinstalled with every mac. Granted it's not for everyone, but as a student who occasionally has to find out how certain math functions look like it's very useful. I have no idea why Apple built this app, but I'm glad it's there.
![Grapher]({{ site.url }}/images/grapher.png) 


##Conclusion
And those are some of my favourite mac apps. I chose mostly small apps & little helpers. Of course I also couldn't live without Adobe Photoshop & Lightroom, iWorks, Eclipse, WebStorm, DropBox, Google Chrome and many other applications. But those are mostly big names and everyone knows what they do and that's why I didn't put them on the list. Plus, a top 50 or so would have taken too long to write.  
Please feel free to share your favourite app in the comments below or tell me if you've learnt something new! 
