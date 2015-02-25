---
layout: post
title: Protect your secrets on OS X
description: "OS X comes with all the tools you need to setup your personal data safe."
category: articles
tags: [security, HowTo, encryption, OS X, Disk Utility]
image:
  feature: protect-data-on-os-x-header.jpg
  credit: IceSabre
  creditlink: https://www.flickr.com/photos/icesabre/2221406000
comments: true
share: true
---

There's a ton of fancy security apps on the App Store. And people are buying into the hype because of the whole NSA affair. But in reality you don't need extra tools. Because OS X ships with everything you need to make your own personal data lockbox.

##The hidden features of Disk Utility
With Disk Utility you can create & resize partitions. Oh right.., you probably knew that. But what you may not know, is that you can also create ".dmg" images. In fact you can create ".dmg" images with a pretty strong encryption.

**So let's get started!**

Type `disk utility` in your spotlight to open it. Next press the `New Image` button in the toolbar. Now you can select where you want to store the image.

Next you can chose an initial size. If you plan on storing only text documents you'll probably want to select something between 100-500mb. For multimedia stuff you'd obviously want something bigger. If you're unsure just chose a large size because the disk-image will only take as much space as it needs for the data that you put in it. E.g If you chose 10GB and only put 1 text file in it, it won't actually reserve 10GB but only a few megabytes.

![Disk Utility - Image Settings]({{ site.url }}/images/disk-image-settings.png)

Select `Mac OS Extended (Journaled)` as format. Next you can chose between "128-bit AES" or "256-bit AES" encryption. In theory 128bit is somewhat less secure but faster. In reality they're both overkill for personal matters because even the NSA breaks a sweat when dealing with AES encrypted files.

> In fact the NSA has cleared AES-128 to encrypt "classified/SECRET" government data and AES-256 to encrypt "TOP SECRET" government data.  
<a href="http://www.nsa.gov/ia/programs/suiteb_cryptography/" target="_blank">Read more</a>

Chose `Single partition - Apple Partition Map` in the Partition field and `sparse bundle disk image` in the Image Format field. The advantage of a sparse bundle is that instead of a single big file, a sparse bundle is a directory containing many small files. When content changes, one or more of those small files are changed, instead of the entire image. This allows backup & syncing software to operate more efficiently. For example if you keep your data-safe on say Dropbox and you change only one small text document it won't have to re-upload the entire image but only that small sparse-file inside the bundle.

All right, click `Create`. Now a password windows pops up. Be sure to invent a good password. Its best to avoid birthdays, pet names and other personal information. Better think of some book or TV series and chose a random quote that's easy to remember for you. For example a suitable password could be "Stick them with the pointy end". That's easy to remember but really hard for a computer to crack.

If you want to be 100% secure you may want uncheck the "save password in keychain" checkbox. Because if you save the password in the keychain your strongbox is really only as secure as your computer account.

![the entire process]({{ site.url }}/images/protect-data-on-os-x-anim.gif)

##Keeping your data safe
Once your disk-image is formatted you can see it on your desktop and in finder just like a normal usb-stick. You can now copy your secret files onto the drive and then eject it to make them disappear.

To mount the image again just go to the place where you saved it and double click it. You'll be prompted to enter your password. Now it's back on the desktop and in the finder-sidebar. Easy right?

##A piece of advice
Be sure to make regular backups and do not forget your password. If you forget it there is no way to restore your data. If you're prone to be forgetful better write it down on paper. And store that paper in a real safe ;-).