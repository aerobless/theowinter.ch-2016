---
layout: article
title: Automate Jekyll publishing with a cgi-bin bash script
description: "Automate publishing your Jekyll blog posts with a simple cgi-bin bash script. This works also for other static site generators."
category: articles
tags: [Jekyll, Blogging, WebDev, Automation]
image:
  feature: rappi_steg.jpg
comments: true
share: true
---

I've wanted a way to update this site without having to "upload & override" for a while. But I never really got around to it
because I thought it was going to be a pain to setup. My first idea was to use Jenkins or some other CI software that
I could connect to my GitHub repository via a webhook. But Jenkins is pretty big and I didn't really want to put it on my
tiny [DigitalOcean droplet](https://www.digitalocean.com/?refcode=3c6fcdd7f9f2){:target="_blank"} just to update this site.
As a matter of fact, Jenkins recently filled up the storage of my development server in school with log files.
Granted it was only 15GB.. but still. Not something I want to deal with on a webserver.

So back to the drawing board. Wouldn't it be nice if you could just trigger a bash script via a webhook? You could put a 'git pull'
and a 'jekyll build' command in there and that'd be it. Luckily it turns out you can do exactly that.
To do so you use a technology called cgi. [CGI stands for Common Gateway Interface](http://en.wikipedia.org/wiki/Common_Gateway_Interface){:target="_blank"} and it's actually quite old.

##Requirements
If you're using traditional web hosting with HTML/PHP/MYSQL you're out of luck. You need root access to your server and be able to login via SSH.
I'm using a DigitalOcean droplet with Ubuntu 14.04 and a [LAMP stack](http://en.wikipedia.org/wiki/LAMP_%28software_bundle%29){:target="_blank"}, but any Linux server is fine. In this post I'm focusing
on Apache2 but you'll likely be able to do the same thing with ngix or other webservers. Oh yea, Jekyll isn't a requirement really
you can do the same with Octopress, Hugo or even your homemade static site generator.

##Enabling cgi-bin

1. Enable the Apache2 CGI module `sudo a2enmod cgi`
2. Restart Apache `sudo service apache2 restart`
3. Jump to the cgi folder `cd /usr/lib/cgi-bin/`

Now you can create a test script to see if it works. Name it 'test.sh'. Make sure that you put the bin/bash shebang exactly
like that, otherwise it won't be recognized by the cgi mod. Also make sure to have that empty echo.

{% highlight bash %}
#!/bin/bash
echo "Content-type: text/plain"
echo
echo "Hello World"
{% endhighlight %}

Now run `chmod 755 test.sh` to give it the correct permissions. Also make sure that the cgi-bin folder has chmod 755 set.
Assuming you have a correctly configured & enabled apache website, you should be able to access the script via "http://yourdomain.com/cgi-bin/test.sh".

##The script
I'm storing the git repo in "/usr/projects/" so I need to "git pull" it there, build the site with Jekyll and then move the output
to "/var/www/". This whole process doesn't take too long, but it does take bit of power to generate the thumbnails and so on.
So I don't want just anyone to be able to *repeatedly* run the entire "pull-build-copy" process.
There's two options to fix this. You could add a password of some sort. But I don't like remembering passwords. So I just
made the script so that it only rebuilds the site if there are changes to the git repo.

{% highlight bash %}
#!/bin/bash
#Script is executed by www-data user. It needs to have write-access to
#/usr/projects/theowinter.ch/ & /var/www/theowinter.ch/
echo "Content-type: text/plain"
echo
echo "Checking for updates to theowinter.ch.."
cd /usr/projects/theowinter.ch

#Check if there are changes
if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    #Changes found -> Rebuild the site
    jekyll build
    rsync -a /usr/projects/theowinter.ch/_site/ /var/www/theowinter.ch/
else
    #No changes
    echo 'Not updated.'
fi
echo "Have a nice day!"
{% endhighlight %}

But there's another thing to keep in mind. Cgi-bin scripts are run as "www-data" user of the "www-data" group. So you'll
need to give the "www-data" user/group access to the folders involved. You can do that with the command
`sudo chown -R www-data:www-data /usr/projects/theowinter.ch/_site/` and `sudo chown -R www-data:www-data /var/www/theowinter.ch/`.
This gives the www-data user ownership of those folders. (There may be better ways to give www-data access to those folders. This works, but I'm not a Linux guru.)

Now you can update your site from everywhere, even your iPhone by browsing to "http://yourdomain.com/cgi-bin/update.sh".
If you want to know how to commit via an iPhone you can [read my review of Working Copy here](/articles/iOS-git-client-working-copy-review/).

##GitHub webhook
Adding a webhook is quick and easy. Browse to [Github.com](http://github.com){:target="_blank"} and open the settings of your
repository. There you click on "webhooks & Services" and then on "Add webhook". Choose the following settings:

 + **Payload URL:** http://yourdomain.com/cgi-bin/update.sh
 + **Content type:** application/x-www-form-urlencoded
 + **Secret:** (leave blank)

Leave everything else as it is and submit the form. Now you can test your setup by committing a change!

Feel free to leave a comment if you need help!

{% include toc.html %}
