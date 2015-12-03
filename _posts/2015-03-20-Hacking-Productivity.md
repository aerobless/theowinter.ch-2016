---
layout: article
title: Hack your productivity by editing your hosts file
description: "Have you ever felt like your spending to much time on 9gag and the like? Learn how to edit your hosts file and stop wasting time."
category: articles
tags: [HowTo, Tutorial, Productivity, Know-Your-OS, OS X, Linux, Windows]
image:
  feature: mountainlake.jpg
comments: true
share: true
---

Have you ever felt like your spending to much time on 9gag, memecenter, facebook and the like? Looking at funny pictures or
reading news can be highly addicting. Those sites often implement "infinite scrolling" and you can literally waste 
hours. I myself felt this often enough. Just one more picture. And it gets worse every time. 

<video width="654" height="422" autoplay loop controls>
  <source src="{{ site.url }}/videos/9gag.mp4" type="video/mp4">
  <object id="flowplayer" name="flowplayer" width="654" height="422" data="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" type="video/mp4" 
            type="application/x-shockwave-flash">
      <param name="movie" value="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" 
    value='config={"clip":"{{ site.url }}/videos/9gag.mp4"}' />
   </object>
</video>

Now I'm not saying all those sites are bad, and the decision to stop wasting time is very personal. If you're happy 
spending hours on 9gag then who am I to judge? But think of the possibilities. The time you save could be used 
for personal projects. Start coding an app? Write a blog? Learn to draw? Whatever you like.

But enough of my motivational speech. This post offers you one easy, specific and drastic method to reduce your 
dependency on a "bad" site.

>    Just block it.
    
Now there are browser extensions and software you can install that help you block a site. But you can never be really certain 
what those free apps or extensions really do. Some may just show you ads.. others might track all the websites you visit.

But you don't really need an app. Every common operating system has a hosts file. The hosts file is a relict from the 
ARPANET time. Since the introduction of the Domain Name System (DNS) in 1984 there hasn't really been a need for it
anymore. Well except for a few niche tasks. Web developers sometimes use the hosts file to simulate DNS entries and 
software crackers use it to stop applications from talking with their authentication servers.  
But we can use it to easily and reliably block distracting websites.

#Typical hosts file on OS X
{% highlight bash %}
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
#
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost 
fe80::1%lo0	localhost
{% endhighlight %}

As you can see on the left side there are your local IPs and on the right side there's the localhost-domain. This means
that if you enter "localhost" in your browser your computer knows to go to your local IP 127.0.0.1. Same for IPv6.
Now to block a site you could simply add a line and type `127.0.0.1      9gag.com`. However I think it's more 
productive to redirect to Google `74.125.239.34    9gag.com` . That way if you enter "9gag.com" in your browser you don't get an angry 
"This website is not available" message but a nice clean Google page. And you'll be like "oh right, let's do something useful,
hi there Google! :)", I guarantee it!

#Hosts file locations & DNS flush commands
To edit your hosts file you need to open a new terminal window. Then enter the command below for your operating system. 
If you're not familiar with VIM, here are the basics: move the cursor with your arrow keys, press "i" to enter the
typing-mode, press "esc" to exit the typing mode, type ":wq" after you've exited the typing-mode to save and quit. 

{% highlight bash %}
#OS X
sudo vim /private/etc/hosts
sudo dscacheutil -flushcache

#Linux (DNS flush depends on distribution, sometimes not even necessary)
sudo vim /etc/hosts
sudo /etc/init.d/dns-clean restart

#Windows
notepad c:\windows\system32\drivers\etc\hosts
ipconfig /flushdns
{% endhighlight %}

Now just to be sure, you don't want to remove or replace the existing entries. All the localhost entries need to stay
just as they are. All you do is add a new line with an IP and one or more domains. E.g.
`74.125.239.34    9gag.com` or `74.125.239.34    9gag.com collegehumor.com`.

#Flushing your browser's DNS cache
For Chrome just copy the following link `chrome://net-internals/#dns` into the addressbar and press "Clear host cache". 
Safari users shouldn't have to do anything since OS X handles the DNS cache itself. And Firefox users switch to Chrome, or follow [these instructions](http://www.kahunaburger.com/2009/03/18/clear-dns-cache-in-firefox/){:target="_blank"}
. But seriously, switch to Chrome ;-).

#Enhancements (Unix)
If you want you can make editing the hosts file somewhat easier by adding easy to remember aliases to your 
.bashrc or .profile file. You can usually find those files in your home directory `vim .bashrc`.

For example in my .bashrc I have:
{% highlight bash %}
alias hosts='sudo vim /private/etc/hosts'           # Opens the hosts file, so you can add custom domain->IP redirects
alias dnsflush='sudo dscacheutil -flushcache && open http://chrome:://net-internals/#dns'   # Flush OS X DNS Cache
{% endhighlight %}

So I can edit the hosts file by simply typing `hosts` and flush the cache with `dnsflush`. Well, actually I've got a lot 
more enhancements in my there. If you're interested have a look at my [repo on GitHub](https://github.com/aerobless/UnixShell){:target="_blank"}.

So you see, you gain productivity while retaining full control over your computer. Of course it's up to you if you
want to block any sites. You could even decided to just block some sites on your study-notebook so you can concentrate
on the lecture and to keep them open on your home-computer. Or maybe write a bash-script to change the hosts file
depending on the time of day? It's up to you.

{% include toc.html %}
