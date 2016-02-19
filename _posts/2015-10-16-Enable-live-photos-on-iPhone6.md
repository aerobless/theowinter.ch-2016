---
layout: article
icon: fa-apple
title: Jailbreak&#58; Enable Live Photos on iPhone6
description: "How to enable Live Photos and 3D Touch on a iPhone6 with Cydia and the Pangu Jailbreak for iOS9.0-9.0.2."
category: articles
share: true
comments: true
tags: [iPhone, Apple, iOS, Jailbreak, photography]
image:
  feature: grandcanyon.jpg
---

I've never really seen a reason to jailbreak my iPhone. The disadvantages, such as voided warranty and potential security holes 
always outweighed the cool things that could be done after a jailbreak. I've never wanted to install custom themes or change the
way iOS works. If I wanted those things I probably would have bought another Android phone. No, I'm quite happy with Apples design. 
But there comes the iPhone6S.. adding things like Live Photos and 3D touch. And the temptation to jailbreak grew. 

I guess could live without 3D touch.. but resisting Live Photos? Impossible.

<video class="videoCentre" width="281" height="500" autoplay loop controls>
  <source src="{{ site.url }}/videos/iOS9_LivePhoto_on_iPhone6.mp4" type="video/mp4">
  <object id="flowplayer" name="flowplayer" width="654" height="422" data="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" 
            type="application/x-shockwave-flash">
      <param name="movie" value="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" 
    value='config={"clip":"{{ site.url }}/videos/iOS9_LivePhoto_on_iPhone6.mp4"}' />
   </object>
</video>


##Jailbreak is the way forward
So I googled jailbreak. I found a lot of sites with tools and tutorials, most of them untrustworthy. Then I went to Reddit and found the
[/r/jailbreak](http://reddit.com/r/jailbreak){:target="_blank"} community. No jailbreak for iOS9 :(.
But yesterday this changed. The security research team "Pangu" released the first public [jailbreak tool for iOS 9.0-9.0.2](http://en.pangu.io/){:target="_blank"}.

I got the tool and installed the jailbreak on my iPhone6. It was really quite easy.

1. Download the tool & run it on a windows PC or VM. I had only my macbook with me, so I run it in a parallels Windows 8.1 VM.
2. To prepare for the jailbreak I was instructed to do the following things
    + Update iTunes to the newest version
    + Disable "encrypt backup" in iTunes
    + Make a full backup in iTunes
    + Disable "Find my iPhone"
    + Enable flight mode on the iPhone
3. Then I was ready to start the jailbreak from the application.

The first time it didn't work and automatically restored the backup. But after a few more tries, it worked and the jailbreak was installed.

##Enabling iPhone6S features
Now it's only been a day since the jailbreak has been released, but there's already slew of tweaks to enable iPhone6S features on the Cydia Store.

So here are the tweaks I'm using to enable some of the new features:

+ **Live Photos:**
  + [EnableLivePhotos](http://moreinfo.thebigboss.org/moreinfo/depiction.php?file=enablelivephotosDp){:target="_blank"} It's in one of the default repos so you can just search for it in the Cydia Store.
+ **3D Touch Emulation:**
  + ["RevealMenu" enables the 3D touch menus on homescreen icons.](https://www.reddit.com/r/jailbreak/comments/3orj8p/release_revealmenu_3dtouch_for_old_devices_in_my/){:target="_blank"} To download it you have to add the repo "apt.imokhles.com" to your sources in the Cydia store.
  + ["Hapticle" adds haptic responses when using 3D touch.](https://www.reddit.com/r/jailbreak/comments/3ost7u/release_hapticle_adds_haptic_response_to_various/){:target="_blank"} In order to download it you have to add the repo "repo.fortysixandtwo.com" to your sources in the Cydia store.
  
Instead of revealMenu, which uses a long press to emulate the 3D touch, there's also a tweak called "Forcy" that uses a swipe gesture or another one called "UniversalForce" that is 
trying to emulate 3D touch by measuring force through the amount of the finger that is detected on the display. I've tried to use UniversalForce and it did work quite well to 
"Pop & Peek" in the photos app, but it had a bug on the homescreen, so I went back to revealMenu. But I'm guessing that in the next days all of those tweaks will get gradually better 
and in the end we'll have a pretty good approximation of the 3D touch feature.

As for the EnableLivePhotos tweak. It simply does what the name says. No emulation or anything, it just enables the original implementation by Apple. And it works perfectly on my
iPhone6.

So if you have an iPhone6, don't waste your money, install the jailbreak and you get 99% of the new 6S-functions for free.

{% include toc.html %}
