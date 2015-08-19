---
layout: travel
title: Blogging from New York to San Francisco
description: "I added a custom travel layout with additional front matter to my Jekyll site, so that I can continue to blog while I'm travelling."
location: Rapperswil, Switzerland
satellite: false
startLocation: Zürich
endLocation: New York
temperature: 32
weather: sunny
mobileWarning: false
category: articles
share: true
comments: true
tags: [Travel, USA, Jekyll]
image:
  feature: headers/usa_map.jpg
  credit: Google Inc.
  creditlink: https://maps.google.com
photo-list:
    - title: Camera Gear
      img: IMG_1079
    - title: Sunglasses
      img: IMG_1083
    - title: Photo Backup
      img: mobilelite_floor
---

Hi there. This is not one of my usual little tech posts, where I review some app or explain how to 
setup some server gimmick. In a few days I'll be flying to New York and from there I'll travel across the good old
USA to San Francisco. It'll take me about a month and I plan on posting a few... or a lot.. but certainly short posts. 
Why "certainly short", you may be wondering. Well.. I'm not gonna lug around my macbook all day, so I'm down to 
an iPhone/iPad combo. And those things weren't made to write long blog posts.

Anyhow, I think I've managed to simplify my Jekyll workflow just enough to be able to post while I'm in transit.

1. [I'm using Working Copy, a iOS git client, to commit new posts.]({{ site.url }}/articles/iOS-git-client-working-copy-review/)
2. I've added a travel layout (this post).
3. [And I've added a webhook, so that every commit is automatically compiled & published.]({{ site.url }}/articles/Use-cgi-bin-to-automate-Jekyll/)

##Travel Layout
Did I say this post was going to be different and not techy? That was a joke, haha. In order to build the travel layout 
I've taken my usual layout (`post.html`) and added a couple cool features. For one thing, the sidebar on the left now 
shows not only the location where the post was written but also the temperature in °C and °F and the type of weather I'm
experiencing.  
And I've also integrated a Google Maps View and a photo gallery below the content.
Now all of this is controlled via the front matter of a Jekyll post. So for example the Google Maps View is only displayed 
if I've defined a start- and endLocation in the front matter of the post. And I can for example also choose whether or
not to display the map in satellite-mode.

If this all sounds a bit abstract and you're not sure what the front matter even is, here's an example:

{% highlight cpp %}
layout: travel
title: Blogging from New York to San Francisco
location: Rapperswil, Switzerland
satellite: false
startLocation: Zuerich
endLocation: New York
temperature: 29
weather: sunny
mobileWarning: false
category: articles
share: true
comments: true
tags: [Travel, Cool, Awesome, Post]
image:
  feature: headerImage.jpg
  credit: Theo Winter
  creditlink: https://theowinter.ch
photolist:
    - title: Some Image, Somwhere
      img: DSCN1526
    - title: Some other Image, Somewhere
      img: DSCN1023
{% endhighlight %}

The front matter is basically a list of variables that is added above a Jekyll post. I can then use those variables in my 
layout to do various things. For example like this:

{% highlight liquid %}
{%raw%} 
{% if page.temperature %}
    {% case page.weather %}
    {% when "sun" or "sunny" %}
        <i class="icon-sun"></i>
    {% when "cloud" or "cloudy" %}
        <i class="icon-cloud"></i>
    {% when "rain" or "rainy" %}
        <i class="icon-umbrella"></i>
    {% when "storm" or "stormy" %}
        <i class="icon-bolt"></i>
    {% else %}
    <i class="icon-sun"></i>
    {% endcase %}
    <span class="fn">
        {{ page.temperature }}°C / {{ page.temperature | times:1.8 | plus:32 }} °F 
    </span>
{% endif %}
{%endraw%}
{% endhighlight %}

That's the code for the little weather icon and the temperature info in the sidebar.
But enough of that. If you want to see more, have a look at the code on my
[GitHub Repository](https://github.com/aerobless/theowinter.ch/blob/master/_layouts/travel.html){:target="_blank"}.

##<del>Packing the bags</del> .. Photography
In order to travel in style I'll be taking clothes and stuff. No joke XD. Anyway, that's boring, so let's talk about 
photography instead. I usually take photos in RAW format. For those that don't know, the RAW format is uncompressed, lossless 
image data straight from the camera sensor. That makes it awesome for post processing pictures later. But the problem with 
RAW is that iDevices, I'm not sure about Android but it's probably similar, don't really have good tools to handle those files.
So yea.. I'm making the compromise to shot booth in RAW and in JPEG. But that brings me to the real problem and that's storage.
I've been known to fill a 32gb card in about a day when shooting RAW only.

<img alt="Working Copy Repository" style="float:right; width:300px; padding:10px" src="{{ site.url }}/images/mobilelite.jpg" />

So what I did, was to get a MobileLite SD-Reader/WLAN/USB-Hub thingy. With that I'm able to backup my photos on a 
normal USB disk and also access them from the iPhone or iPad via WLAN. From what I've tested so far, it seems to 
work well. The only things I don't like is that the battery drains really quickly when a HDD is connected, and 
there doesn't seem to be a progressbar when copying files from a SD card to the HDD. But still, it's better then being 
limited to a few sd cards or lugging around a laptop.

*Alright, that's it for today. I'll probably write my next post somewhere over the Atlantic Ocean.*