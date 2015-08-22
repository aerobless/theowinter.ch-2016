---
layout: post
title: Is this language regular?
description: "How to find out if a language is regular with the pumping lemma algorithm."
category: articles
share: true
comments: true
tags: [Automaton, Machine, HSR, Languages, CompSci, Pumping Lemma]
image:
  feature: headers/macrograss.jpg
  credit: Theo Winter
  creditlink: https://theowinter.ch
--- 

 > Is the language **L={a<sup>s</sup>b<sup>t</sup>a<sup>t-s</sup> ∣ 0 ≤ s ≤ t}** using the alphabet **∑ = {a,b}** regular?
 > Let's find out.
 

One way to test if a language is regular is to use the _pumping lemma_ approach. The concept of the _pumping lemma_ is that 
a sufficiently long word can be pumped, meaning a middle section of the word is repeated a number of times to generate a new 
word, that lies also within the same language.  
 
So if the _pumping lemma_ can be used to create a new word that is part of L, then L is regular and otherwise it isn't.

But first I want to get a feel for the language L. I want to see what sort of words it contains. The alphabet ∑ tells me that all
words of L are made up of the characters a and b. And the language definition tells me that the first a appears s-times, 
the b t-times and the second a (t-s)-times. It also tells me that s ≧ 0 and t ≧ s.

    abbbaa | s=1 t=3 t-s=2
    aabbba | s=2 t=3 t-s=1
    aaabbb | s=3 t=3 t-s=0

So every word has an equal amount of a and b characters.

#Pumping Lemma

1. The first step is to chose a word to run the _pumping lemma_ algorithm on. The word has to be long enough, so it should be ∣w∣ ≧ N. 
The word a<sup>N</sup>b<sup>N</sup> seems ideal. And it is part of the language *(see aaabbb example above)*

2. Next the word is split into xyz parts. ∣xy∣ ≤ N and ∣y∣ ≧ 1. The y part of the word has to consists entirely of the a character.
![Pumping Lemma]({{ site.url }}/images/pumpinglemma.png) 

3. After pumping the word k-times w<sub>k</sub> = a<sup>N+(k-1)</sup>b<sup>N</sup> is the result. The generated word can't be
part of L because |a| != |b|. So the language is _not regular_.