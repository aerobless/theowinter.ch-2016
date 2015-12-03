---
layout: article
title: Minimal Mailserver - From DigitalOcean to Gmail
description: "Setup a minimal Postfix server to redirect your emails from a domain hosted on a VPS to gmail or any other email provider."
category: articles
tags: [tutorial, Linux, HowTo, Postfix, Digital Ocean, Gmail, VPS, Linux, Server]
image:
  feature: flight.jpg
comments: true
share: true
---

For a long time I've hosted my site(s) at Hostpoint. But nowadays I feel like I've outgrown their offerings. Don't get me wrong, Hostpoint is still a very good choice if you want to host website using traditional web technologies such as html, php & mysql. But as soon as you want use something more modern, e.g. node.js, django etc. you're running up against a wall. 
 
Anyway the reason that I'm telling you all this is, because for a few years I've had a email-redirect of my address "theo@w1nter.com" to my gmail address. That redirect was configured in the Hostpoint control panel, and I've never really given it much thought until recently when I tried to get a SSL certificate for my domain. I had to prove that I own the domain and the only available option was to receive and email at "admin@theowinter.ch". Which made me wonder..

> How dafuq do I receive emails with a DigitalOcean VPS?

With no fancy Hostpoint control panel to save me, I started googling. And here's what I came up with.

#Configure DNS Records
The first step is pretty straight forward. Log into your DigitalOcean account and click on DNS. Then add the following records for your domain.

1. **A-Record:**  [ mail ] [ your.server.ip ]
2. **MX-Record:** [ mail.YourDomain.com ] [ 5 ]

![DigitalOcean DNS Configuration]({{ site.url }}/images/digitalocean_dns.png) 
Everything else should already exist like in the screenshot above.

#Install Postfix
Log into your server via SSH and run `sudo apt-get install postfix`. When asked, chose "Internet Site" and enter your domain name, e.g. "example.com". Next we're going to edit the config located at `/etc/postfix/main.cf`. Open it in [vim](http://vim.sexy/){:target="_blank"}, nano or whatever editor you prefer to use. Then scroll down to the end and add the following lines:

{% highlight bash %}
virtual_alias_domains = yourdomain.com
virtual_alias_maps = hash:/etc/postfix/virtual
{% endhighlight %}

If you want to receive emails from multiple domains you can add more then one domain on the first line and separate them by a space. The second line describes the path to our virtual email account mapping.

So open the file `/etc/postfix/virtual` and you can write your redirect instructions. E.g.

{% highlight bash %}
admin@yourDomain.com you@gmail.com
yourName@yourDomain.com you@gmail.com
{% endhighlight %}

It's also possible to redirect emails to multiple locations by adding more email addresses on the same line. And if you want to redirect all the messages you can simply omit the part before the @.

{% highlight bash %}
#Simple redirect
admin@yourDomain.com you@gmail.com
	
#Multiple recipients
admin@yourDomain.com you@gmail.com me@gmail.com
	
#Catch all emails
@yourDomain.com you@gmail.com
{% endhighlight %}	

When you're done, save (:wq in vim). Now it's time to update the Postfix lookup table. Run `postmap /etc/postfix/virtual`. Next Reload the Postfix configuration `sudo service postfix reload`. And we're done. 

#Test it
Be sure to test it by sending yourself an E-mail. **But make sure that you're not sending an email from your gmail address via this redirect to your gmail address.** Google notices duplicate emails and quietly ignores them, so you need to use some other provider or ask a friend to test it.

Want to test DigitalOcean? Use [this link](https://www.digitalocean.com/?refcode=3c6fcdd7f9f2){:target="_blank"} and you get $10 for free.

{% include toc.html %}
