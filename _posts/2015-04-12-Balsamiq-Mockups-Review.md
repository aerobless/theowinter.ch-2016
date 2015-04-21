---
layout: post
title: Review&#58; Balsamiq Mockups
description: "Rapidly create UI mockups & wireframes. Work smarter and collaborate smoothly. But can Balsamiq keep those promises? I've had the opportunity to use it for UI2 class at HSR and here's my opinion."
category: articles
tags: [Review, Balsamiq, UI, Web, Mockup, User Experience]
image:
  feature: rappi_golden_lake.jpg
  credit: Theo Winter
  creditlink: https://theowinter.ch
comments: true
share: true
---

[Balsamiq](https://balsamiq.com/){:target="_blank"} is a tool to rapidly create mockups & wireframes of user interfaces.
It promises a lot of things: work faster & smarter, get honest feedback, collaborate smoothly. But can it keep those promises?
I've had the chance to find out. At [HSR](http://www.hsr.ch/){:target="_blank"} I'm currently taking a class called 
"User Interfaces 2". The exercises for that class involve building a prototype UI for a bike-sharing service. We're free 
to chose our tools, but [HSR](http://www.hsr.ch/){:target="_blank"} offers free access to 
[Balsamiq](https://balsamiq.com/){:target="_blank"}. So why not try it?  


#First contact
Balsamiq exists as both web-app and executable for OS X & Windows. The executable version starts in a 30d trial mode 
and requires a key to unlock. I've got only a login & password from HSR and there was no option to login in the 
executable version. I was also unable to find any collaboration features.. perhaps they're only enabled once 
you enter a key or you need to use the web-app for collaboration.  

![Balsamiq mac app]({{ site.url }}/images/balsamiq_executable_app.png)

So never mind, let's try the web version. The good thing is it works. But overall I didn't find it very pleasant. 
It's a flash app.. with all the typical <s>advantages &</s> disadvantages that brings. But first things first.   

In our project group we divided up the screens for the bike-sharing UI, everyone would make 4 screens until our 
next meeting. I was able to create my screens and it was reasonably intuitive. When we next met the screens I designed
were missing. Turns out the app doesn't automatically save to the server. Luckily I was able to restore 3 of the 4 screens 
from my local storage. The 4th screen had disappeared for good because someone made a screen with the same name 
and it ended up downloading that from the server and overwriting the local one. I mean it's 2015.. I expect web-apps
to automatically save my progress. 
Of course I know why they made a save button instead of auto-saving. It was easier from them to program and requires less 
server performance.. but what a shitty excuse for a software that costs between 12$/month (3projects) and 999$/month (unlimited).  
There's no live-collaboration whatsoever. Two people can't work on the same screen at the same time. You have to design
a screen and then save.

![Balsamiq Save Screen]({{ site.url }}/images/balsamiq_save.png)

When you save a popup asks you to describe the changes and select the screens to upload. It's 
probably intended to be similar to committing to Git/SVN but it's missing two important parts. There are no merge-conflicts. 
A newer version completely overwrites an older version. And the change history is minimalistic at best. It shows
huge previews of the changed screens so there's a lot of scrolling to be done. And I at least lost the overview quickly.

![Balsamiq Change History]({{ site.url }}/images/balsamiq_history.png)

#Making a detailed prototype
To conduct a proper usability test we had to flesh out our prototype some more. And we ended up having a lot of similar screens.
E.g. the confirmation screen for "pay-by-creditcard" would have almost been the same as the one for "pay-by-phone". 
But there is no way to use variables or something in those screens. Neither is there a template system, I mean 
even powerpoint has a slide-master that you can edit to change the background of all slides. If we wanted to move the 
back-button by 10px to the right, we'd have to manually make that change on every single screen.  

Below you can see a tree-view of a few of the screens we had to create. It's really only a small part, in total we had to create over 
50 screens for all the options.

    1. Splashscreen
    2. Start
        2.1 Rent a bike
            2.1.1 Prepaid
                2.1.1. Select number of hours
                    2.1.1.1 Pay by Credit Card
                        2.1.1.1.1 Insert Credit Card
                            2.1.1.1.1.1 Confirm purchase
                                 2.1.1.1.1.1.1 Thank you.
                    2.1.1.2 Pay by Mobilephone
                        2.1.1.2.1 Type Phone Number
                            2.1.1.2.1.1 Confirm SMS
                                2.1.1.2.1.1.1 Confirm purchase
                                     2.1.1.2.1.1.1.1 Thank you.
            2.1.2 Subscription
                ...
            2.1.3 Existing customer
                ...
        2.2 Return a bike
            ...
        2.3 Help
            ...
        2.4 Account
            ...
        2.5 Report damage
            ...
        
As you can see a tree view is kinda useful to display the possible paths a user can take. But don't think Balsamiq 
offers that. All Balsamiq has is a list of screens. And that list can't even be sorted alphabetically.   
To duplicate the screens for the different user paths turned out to be a huge mess. The "Insert Credit Card" screens 
for the prepaid and the subscription options look exactly the same.. so how do we link them properly?
We ended up writing the entire user-path in the name of each screen. For example:

    Ausleihen.Abo.Monatsabo.Bezahlung.Kreditkarte.Bestätigung.Kasse
    
Now we could at least duplicate and link the screens properly.. but don't think it was easy or pleasant. There's no
auto-completing in the link form and the list of screens isn't automatically sorted. So finding the right screen was 
still a huge pain.

#User experience
So you can see I haven't been impressed with the user experience of a software designed to help you design good user
experiences.. After all Balsamiq's website says:

 > "We believe that life’s too short for bad software!"
 
Yup, I believe so too. But clearly their software needs some work before it can be considered good software. Notice 
anything special about the screenshot below? The screen-name text overlaps. Sure we have extremely long names for those 
screens.. but you know why.

![Balsamiq Bad UI]({{ site.url }}/images/balsamiq_badui.png)

Another bad experience was updating the back-buttons. Since we've had to duplicate a lot of screens the back-buttons obviously 
pointed to the wrong screens. So we had to go through the screens in presentation-mode, test out the back-buttons and then try 
remember the correct name of the last screen. Then we'd have to switch into edit-mode. Edit-mode takes a moment to load because it's 
a flash-app.. and there we'd have to enter the correct screen for the back-button link. Of course half of the time I'd forget the 
correct last screen and I'd have to do it multiple times until I got it right.
This all could have been resolved easily if they'd allowed us to stack screens or make some sort of tree.

#Designing a screen
Ok so I've written a lot about how annoying it is once you have a lot of screens. But you'd probably also like to know 
how designing a single screen feels.
Designing a single screen isn't bad. There's a library with pre-fabricated UI-elements such as buttons, toggles, forms etc. 
But that library is relatively limited, there are about 9 special UI-elements for iOS and that's it. Nothing special
for Android or WP. 
![Balsamiq designing a screen]({{ site.url }}/images/balsamiq_design_screen.png)

You can upload your own assets, but the process is clunky. For example if you want to added a custom icon, you have to save, exit the edit-mode 
then navigate to "assets" in the project overview-page and upload an image there. Then you can navigate back to the screen you were working on and re-enter edit-mode to finally 
add that custom icon. That's if you've managed to remember what screen you were working on. Why they don't allow you to upload custom assets while in edit mode 
I do not know.

#Conclusion
I'm a programmer, I don't want to have to duplicate screens just because there's no way to dynamically link them. I want to make templates 
for stuff that I'm going to re-use. I want to organize my screens in a tree-structure and not a list.
Switching in and out of edit-mode is distracting and remembering the correct screen is annoying. Call me lazy, but I see so much work that isn't necessary.
The library of UI-elements is functional but not huge. Balsamiq isn't _bad_. But it doesn't feel good either.  
The next time I have to design a user interface I'll probably do it the traditional way.. sketch on paper and the move to 
the code and real UI editor (JavaFx/XCode/Visual Studio etc.) directly.