---
layout: article
title: Does the world need yet another todo list?
description: "ToxicTodo - Why I chose to program my own todo list instead of using one of the many productivity apps out there."
category: articles
tags: [Programming, Java, DevLog]
image:
  feature: todolist_hand.jpg
  credit: Lâm HUA (CC 2.0)
  creditlink: https://www.flickr.com/photos/monsieurlam/2645956083
comments: true
share: true
---

The answer is "no". No, the world doesn't need yet another todo list. But you do. Making your own todo list is fundamentally different from just using one whatever you can find on the net. So why is it so different? For one thing when making my own todo list I was able to create exactly the features I wanted. For another, I got committed to my todo list, after all I spent a lot of time making it.

**Now you might think, okay that's cool but why bother blogging about it?**  
Before I got started working on my todo list I searched the web and there were a lot of posts about how todo lists are a waste of time and you should rather be doing things instead of putting them on a list. Well I disagree. Of course doing things immediately is better then to postpone them indefinitely. But often you're working on something and you get an idea for a project, feature or task that you should or could do, just not right now because you're working. So without a really good memory you're going to forget. 

> I should really finish exercise 3 of my ParProg homework, it won't even take long.. but I can't do it right now because xyz..

That's where ToxicTodo was born. To hell with all those articles claiming that todo lists don't work.

##Todo List Essentials
While working on my todo list (ToxicTodo) I've noticed that there are 3 core principals that have to be met for a todo list to be useful (for me).

 + **Accessibility/Speed:** Opening the todolist or adding a task has to be fast. If I have to search the icon I'm unlikely to use it regularly.
 + **No distractions:** The interface has to be minimalistic and blend in with the operating system.
 + **Centralised:** The todolist has to be available on all my computers without syncing effort.

##A CLI beginning
At first I decided to go with a command-line (CLI) application. Basically you'd write `todo add school do more homework` and ToxicTodo would add a new task "do more homework" to the category "school". To see all the task you'd simply type `todo list` and to complete a task you'd look up its number in the todo list and then type `todo complete 1`. 
This was easy to understand and worked really well, but it was local-only.

![ToxicTodo CLI]({{ site.url }}/images/toxic-todo-cli.png)

##Setting up a server
Since I wanted to have the same todo list wherever I went I had to put it on a server. So I ended up coding a simple socket-server that would receive and answer requests from the client application. E.g. `GET_TODOLIST` or `REMOVE_CATEGORY_FROM_TODO_LIST`. I wrote the server to be multi-threaded so that receiving & answering requests from multiple clients wasn't a problem.   
But then I noticed.. having a server and all is cool.. but now everyone who pulls ToxicTodo from GitHub can read my todo list. So I ended up implementing some security measures. All communication between client and server is symmetrically encrypted using AES-128. I would have used AES-256 but I found out that for AES-256 you need a special .jar or a third-party library because of the export rules in the US. So I went with AES-128 which is still plenty secure.. I mean it's a todo list not Fort Knox.  
For those wondering what sort of hardware the server is running on. While I do have a dedicated VPS for running Jenkins, Sonar and stuff I decided I'd run this on my raspberry pi from my home-network. And yep it runs really well, haven't had an outage so far.

##A GUI is born
So I decided.. you know what, a GUI would be cool. So I took Swing and started to work on the GUI. Being a mac user I really wanted to make it look like a native application. Which was tricky at first, but then I found a really cool library called [macwidgets](https://code.google.com/p/macwidgets/). With that library it was easy to make a typical mac-unified-toolbar where the icons would be and a bottom bar for settings and status. I took measures like icon-size, toolbar height etc. from other native mac applications and stole the color values from iTunes :P. ToxicTodo started to look really good but there was one problem. Java being Java support for retina-displays was and is abysmal. Text and the GUI-elements looked crisp on my retina macbook but the icons were pretty shitty.. (pardon my french). So I decided to use text instead of icons and found a cool font called [Font Awesome](http://fortawesome.github.io/Font-Awesome/){:target="_blank"}. Font Awesome contains over 400 icons for any action imaginable. I created a custom button-class that uses a character and Font Awesome instead of an icon and it was good. ToxicTodo finally looked exactly the same on my retina macbook as it did on my non-retina iMac.

<video width="654" height="422" autoplay loop controls>
  <source src="{{ site.url }}/videos/toxic-todo.mp4" type="video/mp4">
  <object id="flowplayer" name="flowplayer" width="654" height="422" data="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" 
            type="application/x-shockwave-flash">
      <param name="movie" value="{{ site.url }}/assets/flash/flowplayer-3.2.5.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" 
    value='config={"clip":"{{ site.url }}/videos/toxic-todo.mp4"}' />
   </object>
</video>

##Feature set
Currently ToxicTodo has the following feature set:

 * **Create a task** containing a description and meta data such as task priority and your location (based on IP).
 * Create **daily/weekly/monthly tasks**, that can be completed multiple times.
 * Add a **hyperlink** to as task, so you can launch a website associated with it right from the app.
 * **Dynamic category** that features daily tasks that haven't been completed yet.
 * **Remove a task** without logging.
 * **Complete a task**, logging the completion data, location and other meta data.
 * **View Statistics** (currently only amount of completed tasks, work in progress).
 * **Add a category** with a description, keyword and one of many awesomeFont icons.
 * **Edit or delete** categories.
 * **Search** a task in a specific category or in all categories.
 * Change the **settings** (internal or external server, password, port etc.)
 * **Update** ToxicTodo to the latest build on Jenkins (BEWARE: builds on Jenkins may not be stable, use at your own risk)
 
##Source, download & more
I've released ToxicTodo under the MIT licence. So you can do with it as you please. If you have additions feel free to fork or submit pull requests on GitHub.  

**Source on GitHub:** [https://github.com/aerobless/ToxicTodo](https://github.com/aerobless/ToxicTodo){:target="_blank"}

{% include toc.html %}
