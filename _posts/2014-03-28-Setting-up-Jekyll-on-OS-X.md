---
layout: post
title: Setting up Jekyll on OS X
description: "Learn how to install Jekyll and create your own blog on OS X or Linux. It's easy, so give it a go."
category: articles
tags: [tutorial, Unix, Jekyll, web development, blogging]
image:
  feature: servers.jpg
  credit: The National Archives (UK)
  creditlink: http://commons.wikimedia.org/wiki/File:A_view_of_the_server_room_at_The_National_Archives.jpg
comments: true
share: true
---

You know how hipsters do everything before it becomes cool? That means you got to hurry and get a Jekyll site up asap, because Jekyll's getting cooler and cooler by the day. Not a hipster? Isn't that a mac you're sitting on right now? ;-) *Windows people go read something else, this tutorial is not for you guys.*

> **Fun fact:** Did you know that Obama's $250 million fundraising platform was built with Jekyll?   
<a href="http://kylerush.net/blog/meet-the-obama-campaigns-250-million-fundraising-platform/" target="_blank">Read more</a>

Not convinced? Have a list then, people love lists.. or so they say.

* **Security:** No need to update your site if you're not adding content. There's simply no way someone can attack a static site.
* **Speed:** Google promotes fast sites by putting them first in the search results. Well, there's nothing faster then static.
* **Awesomeness:** Everyone can run a WordPress blog. Jekyll however is ***NEW*** and ***SHINY***!

##Fine, fine let's be serious
Jekyll is not for everyone. To run it you should not be afraid of using a console/terminal. And you should also know how to get around in OS X. You may be also able to follow this tutorial on Linux, but I think there are probably better Jekyll-linux tutorials out there.

###Getting up to speed
Setting up Jekyll isn't all that hard. But there are some pitfalls. For example OS X is running and outdated version of ruby by default. So first you should get that updated.

Now you should never overwrite system-programs like OS X's version of ruby outright. Because the system expects to have certain tools available and if you change them you might get into serious trouble (such as OS X crashes, startup errors etc.). The better way to get a new version of system tools is to install them side-by-side. 

Now OS X doesn't have a packet-manager by default. But luckily some clever people have filled that need by inventing <a href="http://brew.sh/" target="_blank">Homebrew</a>. That's a dead-simple, super-stable packet manager that provides you with all the tools Apple didn't include in OS X.

Run this command in terminal to install Homebrew.
{% highlight bash %}
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
{% endhighlight %}

Once you have installed Homebew, be sure to run `brew doctor`. That command checks your installation and finds problems. If any come up you should fix them before you continue with this tutorial.  

If you aren't sure how to fix them then at least do this, since it's the most common problem:

1. Open a new terminal (you should be in your home directory)
2. Enter `vim .bash_profile`
3. Press the **i** key and copy-paste the text from below into the top row of the file (unless it's already there).
 {% highlight bash %}
 #Load brew-tools first  
 export PATH=/usr/local/bin:$PATH
 {% endhighlight %}
4. Then press **escape** and type **:wq**

Most likely you're now ready to install ruby. Open a new terminal window and type `brew install ruby`. Once it has finished installing, open yet another, new terminal window and type `ruby --version`. It should say "**ruby 2.1.1p76** .." or higher. If the version number is 2.0.0 or lower you didn't do a good job at adding the local/bin path to your .bash_profile. You should try to fix that first. If the version number is 2.1.1 or higher you did a good job and can now continue to installing Jekyll.

###Finally getting Jekyll
No worries, the trick part is done. We're ready to install Jekyll. Open a new terminal window and type: `gem install jekyll`. Open yet another new terminal window and type `jekyll`. If you get a bunch of text that says "NAME: jekyll DESCRIPTION: Jekyll is a blog-aware, static site generator in Ruby .." then all is well and you can jump right ahead to the next part. If you get a message saying "command not found" we'll have to add an alias for Jekyll.

###Adding an alias for Jekyll
If typing `jekyll` worked for you, you don't need to do this part.

1. Open a new terminal (you should be in your home directory)
2. Enter `vim .bash_profile`
3. Press the **i key** and copy-paste the text below. *Note: if you're running a different version of ruby, you need to edit the version number*

{% highlight bash %}
#Jekyll alias
alias jekyll="/usr/local/Cellar/ruby/2.1.1/bin/jekyll"
{% endhighlight %}

4. Then press **escape** and type **:wq**
5. Open a new terminal and try using the command `jekyll`.

##Creating a new site
Itching to finally build the actual site? Sure thing. Open a new terminal and type `jekyll new your-awesome-site-name`. Then jump there with `cd your-awesome-site-name`. If you can't find it it's likely located at `cd /usr/local/Cellar/ruby/2.1.1/bin/your-awesome-site-name`.

Now type `jekyll serve` and you can view your site in the browser of your choice at
<a href="http://localhost:4000" target="_blank">http://localhost:4000</a>.

###Writing posts & more
To get familiar with writing you can open the existing *.md files either in your favourite markdown editor or with [vim](http://vim.sexy). A free markdown editor for OS X is [Mou](http://mouapp.com/). Another good markdown editor is [Markdown Pro](http://www.markdownpro.com/), it's available in the appstore for $9.99. But of course you can write markdown just fine with vim or just about every other editor.

Writing a new post is really simple too. Just create new file and name it something like "**year-month-day-your-post-title-here.md**". Then you open that file and write a jekyll-header like this:

{% highlight xml %}
---
layout: post
title:  "Your title here!"
date:   2014-03-29 09:59:09
categories: jekyll update feel free to add more categories
---
{% endhighlight %}

If you're using a special theme you may have to write a longer header with more attributes. But more about themes later.

###To the web and beyond
Once you're happy with your changes you'll want to re-build your site. To do this you open a terminal and cd into your site's directory. There you issue the command `jekyll build`. This will create a new directory called "_site". It contains all the static pages that you'll need to upload to your web server. I trust you know how to upload something with ftp. Be sure to upload them to your main directory of your domain or subdomain. E.g. "yourdomain.com/index.html" and not "yourdomain.com/jekyll/index.html". The second will not work with the vanilla Jekyll setup (but it is possible with custom themes & plugins). If you just want to test Jekyll it's best to make a new subdomain e.g. jekyll.yourdomain.com, that will work fine.

###Getting a theme
If you're not a web designer or you just don't have a whole lot of time on your hands you may want to get a theme. There's a whole bunch of cool looking themes over at <a href="http://jekyllthemes.org/" target="_blank">jekyllthemes.org</a>. I can especially recommend the themes from Michael Rose. They're great. 

Once you've downloaded a theme, all you need to do is overwrite all files in your websites local directory with the ones from the theme. E.g. copy everything into your-awesome-site-name.

Next open the _config.yml and fill in the details. The _config.yml is different for each theme depending on its features.

Once you try to `jekyll build` you may notice that you need additional ruby gems. To get them just type `gem install gem-name` and you're all set.

###Minimize the workflow
So you're happy with everything but it does take some time to always issue `jekyll build` and then open an ftp program to upload the site to your web server. This is where a tool called <a href="https://github.com/dmathieu/glynn" target="_blank">Glynn</a> comes in handy. Glynn can build your site with jekyll and upload it to a preconfigured ftp-server in just one step.
To get glynn type `gem install glynn --source http://gemcutter.org`. Then add this to your "_config.yml":

{% highlight xml %}
ftp_host: 'ftp.yourdomain.com'
ftp_dir: '/'
ftp_passive: false

# optional
ftp_port: 21                  # default 21
ftp_username: 'your_user'     # default read from stdin
ftp_password: 'your_ftp_pass' # default read from stdin
{% endhighlight %}

For security's sake be sure to not store the password in the config. Especially if you're going to upload the website to a public github repo this would be bad.

And that's pretty much it. You should now know how to successfully setup a Jekyll-based blog or website. Have fun and feel free to write me a comment if you have any questions or feedback!