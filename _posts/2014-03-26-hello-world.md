---
layout: post
title: Hello world
description: "Hi there! This is the first post on my new Jekyll-based blog! I hope you have fun reading it."
category: articles
tags: [sample post, helloworld, highlighting]
comments: true
share: true
---

Hello world! This is the first post on my new Jekyll-based blog.

{% highlight java %}
public class HelloWorld {
 public static void main(String[] args) {
 System.out.println("Hello, World!");
 }
}
{% endhighlight %}

{% highlight c++ %}
#include <iostream>
int main()
{
 std::cout << "Hello, World!\n";
}
{% endhighlight %}

{% highlight html %}
<html>
<body>
 Hello, World!
</body>
</html>
{% endhighlight %}