---
layout: page
title: Articles
excerpt: "An archive of articles sorted by date."
description: "An archive of articles sorted by date."
search_omit: true
image:
  feature: mountain_road.jpg
---

{% assign getPosts = site.posts %}
{% assign getLinkPosts = site.posts | where:"linkpost","true" %}
{% assign getPages = site.pages | where:"layout","page" %}

{% assign postsCount = getPosts.size %}
{% assign linkPostsCount = getLinkPosts.size %}
{% assign articlesCount = postsCount | minus: linkPostsCount %}
{% assign pagesCount = getPages.size %}

{% assign postsWordCount = 0 %}
{% assign longestWordCount = 0 %}
{% assign longestPost = none %}
{% for posts in getPosts %}
{% assign postWordCount = posts.content | number_of_words %}
{% assign postsWordCount = postsWordCount | plus:postWordCount %}
{% if postWordCount > longestWordCount %}
{% assign longestWordCount = postWordCount %}
{% assign longestPost = posts.title %}
{% endif %}
{% endfor %}

{% assign averageWordCount = postsWordCount | divided_by:postsCount %}

This blog contains <b>{{ postsCount }}</b> posts and <b>{{ pagesCount }}</b> pages. Those <b>{{ postsCount }}</b>
posts contain a total of <b>{{ postsWordCount }}</b> words. That's an average of <b>{{ averageWordCount }}</b>
words per post. The longest post is <b>"{{longestPost}}"</b>, it has a length of <b>{{ longestWordCount }}</b> words.


<div>
{% for post in site.posts %}
  {% assign currentdate = post.date | date: "%Y" %}
  {% if currentdate != date %}
    {% unless forloop.first %}</ul>{% endunless %}
    <h1 id="y{{post.date | date: "%Y"}}">{{ currentdate }}</h1>
    <ul class="post-list-archive">
    {% assign date = currentdate %}
  {% endif %}
    <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></article></li>
  {% if forloop.last %}</ul>{% endif %}
{% endfor %}

<div itemprop="author" itemscope itemtype="http://schema.org/Person">
    <div itemprop="sameAs" href="http://theowinter.ch/about">
        <meta itemprop="name" content="Theo Winter"/>
    </div>
</div>
<meta itemprop="inLanguage" content="en-US"/>
<meta itemprop="isFamilyFriendly" content="true"/>
<meta itemprop="image" content="{{ site.url }}/images/apple-touch-icon-144x144-precomposed.png"/>
</div>
