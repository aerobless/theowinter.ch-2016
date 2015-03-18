---
layout: post
title: Getting started with Golang
description: "My first steps with Golang. Setting up a development environment, writing the obligatory 'Hello World' and learning the basics."
category: articles
tags: [Learning, Go, Golang, Programming, Google, DevLog]
image:
  feature: golang_header.jpg
  credit: Theo Winter
  creditlink: https://theowinter.ch
comments: true
share: true
---

I've thought quite a bit about what to write for an introduction, but there's really no better way to say this:

>   I'm new to Go and this post is my logbook of things I learn. I'll update it as I find answers to some of my questions about Go.

Keep in mind that I'm coming from an object-oriented Java/C# world while you're reading this. I may do things
that are stupid and not in line with common Golang idioms. If you find such a passage then please kindly tell me
in the comment section below.

Also if you're wondering why I keep writing Golang instead of Go. That's simply a SEO choice. While googling things I've
quickly started using Golang instead of Go to filter out all the non-programming things.

#Environment & Setup
I've installed Go via [Homebrew](http://brew.sh/){:target="_blank"} on OS X. And I've got another Go-Installation on 
Ubuntu that I've instealled via [GVM](https://github.com/moovweb/gvm){:target="_blank"}. I'd recommend using GVM on
Linux because the Go you get via apt-get is actually an old version.

After you've installed Go itself, it's best to set the GOPATH environment variable. That variable should point to your
Go-workspace and not your Go-installation. That workspace can be anywhere on your system.  
If you're looking at older tutorials you'll also notice that some of them mention a GOROOT variable. You don't need to 
set that when using recent versions of Go. In fact it's recommended not to set the GOROOT variable.

#IDE
I'm using IntelliJ 14 with the [Golang-Plugin](https://github.com/go-lang-plugin-org/go-lang-idea-plugin){:target="_blank"} 
but there's also a [plugin for eclipse](https://github.com/GoClipse/goclipse){:target="_blank"}.
And then there's also a standalone IDE called [LiteIDE](https://code.google.com/p/golangide/){:target="_blank"}. I've tried it for a bit 
and it works. But I can't yet say which of those 3 choices has the most features. So far I'm happy with IntelliJ, but I've already 
noticed that some things aren't finished yet. For example trying to refactor function names returns a "not impled yet" 
message-box.  
Of course you can also go ahead and not use an IDE at all and [VIM](vim.sexy){:target="_blank"} your way through this. 
But I feel like refactoring etc. are required for efficient programming.

![IntelliJ IDEA 14 with Golang Plugin]({{ site.url }}/images/golang_intellij.png) 

#Hello world
So here comes the obligatory "Hello World". Nothing special really.

{% highlight go %}
package main
import "fmt"

func main() {
	fmt.Printf("Hello world!")
}
{% endhighlight %}

#Organizing code - no classes?
So.. Golang has no classes. How do I organize my code? From what I've seen there seems to be a notion of packages
in Golang. I can for example create a subfolder called "hellonator" that stores my very important **p**rivateHello() and
my somewhat less important **P**ublicHello() functions. Yes, you're seeing correctly, functions that begin with a small letter
are apparently private and functions that start with a BIG letter get exported. So our PublicHello() function can be used
from our original HelloWorld program. In my opinion that's easy to understand and a pretty cool way to do private/public. 
And of course this also works with variables.

{% highlight go %}
//HelloWorld.go
    package main
    import "ch/theowinter/helloWorld/hellonator"

    func main() {
        hellonator.PublicHello()
    }
    
//hellonator/Hellonator.go
    package hellonator
    import "fmt"
    
    func privateHello() string {
        return ("Hi there, from the Hellonator!")
    }
    
    func PublicHello() {
        fmt.Println(privateHello())
    }
{% endhighlight %}
It's also important to note that the filename.go really doesn't matter. What matters is the package the file is in. As
you can see in the code above I'm running **h**ellonator with a small h, because that's the package name.

#Variables - wait how do I make an int?
There's no need to define beforehand what datatype a variable contains. I can just use var for everything. What's a 
bit special is the fact that the Golang compiler throws a build error if I define a variable but don't actually use it. 
I also can't concatenate a string and an int directly. E.g. `fmt.Println("hello every"+1)` returns a "Missmatched type" compile 
error.

{% highlight go %}
package basics
import "fmt"
import "strconv"

//Works, even though unused, because it's public
var PublicIntVariable = 5

func LearningVariables() {
	//Compile-Error: test declared and not used
	var notAnInt = "Heya! I'm not an int."

	//Compile-Error: mismatched types string and int
	fmt.Println("hello every" + 1)

	//Compile-Error: cannot use "hi" (type string) as type int in assignment
	var imAnInt = 5
	imAnInt = "hi"
	fmt.Println(imAnInt)

	//Works
	fmt.Println("hello every" + strconv.Itoa(1))
}
{% endhighlight %}
It's also not allowed to change the type of a variable after it has been already used. So we can't turn a int into a string 
all of the sudden.

#Unit tests? Yes I want develop my HelloWorld application with TDD!
Testing is surprisingly painless. All I need to do to test my "Hellonator.go"-file (class?) 
is to create a new file called Hellonator**_test**.go and import the "testing" package.

{% highlight go %}
package hellonator
import "testing"

func TestHello(t *testing.T) {
	var hello = privateHello()
	if hello != "Hi there, from the Hellonator!" {
		t.Error("Got", hello)
	}
}
{% endhighlight %}


#Documenting code! It's got to be done.
*Things no one ever said: "I like documenting code".* But Golang makes documenting simple & actually really pretty. 
All I have to do is write a comment above a function, starting with it's name. Like so:

{% highlight go %}
//PublicHello is a public function. It outputs a message to
//the console.
func PublicHello() {
	fmt.Println(privateHello())
}
{% endhighlight %}

And I can run the `godoc -http:=6060`command. Godoc automatically starts a tiny webserver and generates the necessary
documentation pages for all my functions. The result looks just like the [official Golang documentation](http://golang.org/pkg/){:target="_blank"}. 
Pretty cool, wouldn't you say?

![Godoc running on localhost]({{ site.url }}/images/godoc.png) 

#Conclusion
Ok I'm done for today. But I got to say, Golang is pretty cool. I'll either add more content to this post or write new posts 
about Go in the future. Feel free to add a comment about your own experience with Golang, or whether or not I made
you curious enough to give it a try.