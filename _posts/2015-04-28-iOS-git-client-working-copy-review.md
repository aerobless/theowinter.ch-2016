---
layout: article
icon: icon-apple
title: Review&#58; Working Copy, a Git-Client for iOS
description: "A fully-featured git client for iOS that can: clone, commit, push, pull, merge etc. "
category: articles
tags: [Review, Working Copy, iOS, iPhone, App, Git, Tools]
image:
  feature: macrograss.jpg
  credit: Franziska Winter
  creditlink: http://canvasart.ch
comments: true
share: true
---

[Working Copy](http://workingcopyapp.com/){:target="_blank"} is a fully-featured git-
client for iOS. And with fully-featured I mean yes it support pushing commits! To the best of my knowledge there's no
other git-client in the App Store that supports pushing commits. There are a bunch of iOS "git"-clients that support
pulling and there is a slew of "GitHub"-Clients that do things like managing issues & browsing repos. But something like
Working Copy hasn't been seen on iOS
before.

<img alt="Working Copy Repository" style="float:left; width:200px; padding:10px" src="{{ site.url }}/images/workingcopy_repo.PNG" />

But before we go into the details of the app. Why would you even want a git-client on iOS?
 > Programming on a iPhone, are you mad?

Personally I don't "plan" to do a lot of programming on my iOS devices. For me the big reason why I wanted a git-client
on iOS was this blog. It's static and made with [Jekyll](http://jekyllrb.com/){:target="_blank"}. I write my posts in
Markdown and when I'm done I commit my changes and run a script to compile the static HTML. This process has a bunch of
advantages such as fast loading times for my readers, the blog can't be exploited/hacked and I have a clean commit-history.
But there's also the drawback of not being able to easily write posts on a mobile device, for example while traveling.
I've thought about using SSH to connect to my server and using VIM to write posts.. but as you can probably guess
VIM on an iPhone doesn't feel very comfortable and there's also the downside that you can only write as long as you
have a stable internet connection. So having a working git-client is huge.
Now I can work on [my Jekyll blog]({{ site.url }}/articles/Setting-up-Jekyll-on-OS-X/) wherever, whenever. *Or at least
until the battery is drained :P.*

##Working copy
When you start it the first time you see a "welcome to working copy" example repository. It shows some of the features,
e.g. a modified file, changes, a merge conflict etc. I didn't spend a lot of time there but went straight ahead and cloned my
my blog's repo from GitHub. If you're using GitHub or BitBucket you can sign via a web-authentication and grant
access to all your repositories to Working Copy. If you're not using those services, or don't trust Working Copy with all
your repos, you can simply enter the http-, https- or ssh-url to your repository.

<img alt="Working Copy Clone Repository" style="float:right; width:200px; padding:10px" src="{{ site.url }}/images/workingcopy_clone_repo.PNG" />

Once you have cloned a repository, you can browse it in a pretty intuitive file-explorer. It is capable of creating new
text files (yes you can chose the file-ending) and folders. And it also supports importing files from iOS8 document providers
such as iCloud Drive, Dropbox etc.
To delete a file you can swipe left on its element in the list to display a delete-button. If tried to do the same with
a folder, but I haven't managed to make the delete-button appear. Either I'm to clumsy or it doesn't work for folders.
Luckily you can delete folders by opening them and then going to `Status --> Edit --> Delete Directory`.. that's a bit a
cumbersome, but then I usually don't have to delete folders in my repo so it doesn't bother me too much.

When you click on a file you can see a preview, for HTML & markdown it's rendered. For other files, such as XML it simply
displays the text source with syntax highlighting. That's not entirely consistent, imho it should let you chose whether
to display the source or a rendered version for HTML & markdown.

##Editing files
<img alt="Working Copy Open in" style="float:left; width:180px; padding:10px" src="{{ site.url }}/images/workingcopy_open_in.PNG" />
To edit a file you press the iOS-Share-file button in the top and you have the option "Open In..". Now you can chose from
all your iOS applications that support that file-type and use the iOS8 document-provider API. I've managed to open this
blogs markdown file in the free App "Evermark". I've made some changes there and then saved it back to Working Copy.
Evermark isn't great btw., for some reason it appears blurry on my iPhone6. I chose it mainly because it was free and
supports the document-provider API. Once I find a suitable markdown editor, perhaps Editorial, I'll post a review of that too.

##Pushing commits
<img alt="Working Copy Commit" style="float:right; width:200px; padding:10px" src="{{ site.url }}/images/workingcopy_commit.PNG" />
Once you've made some changes, you can commit them to the local repository and later push them to the server. This is great
when you're outside cell or wifi coverage for a bit. Of course you can also commit & push directly.

##Conclusion & cost
[Working Copy](http://workingcopyapp.com/){:target="_blank"} is great. It feels and behaves for the most part like a native app designed by Apple itself. I've found all
the git-features I was looking for and at the moment at least there is really no alternative to this app.
The only downside of Working Copy is its cost. The basic app (without pushing commits) is free, so you can try it, but
to get the push functionality you have to pay $9.99. Not exactly cheap, but for me it's worth it.

{% include toc.html %}
