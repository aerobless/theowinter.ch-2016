---
layout: article
title: Information Security
description: "todo"
category: articles
share: true
comments: true
tags: [Information Security, Computer Science, HSR]
image:
  feature: flight.jpg
---

This post is a compilation of various information security questions and topics that are likely to be tested in the
InfSi2 exam at HSR. I'm expanding this post step by step while I'm reviewing the contents of this semester. I've done
something similar with the subject "[Automata and languages](/articles/44-questions-and-36-terms-about-automata-and-languages/)" last semester and it helped me a lot.

<script>
var solutionVisibility = false;
var setVisible = function () {
  if(solutionVisibility){
    solutionVisibility = false;
    $( ".solution" ).css( "color", "white" );
    $(".solutionsButton").text("Show all solutions");
  } else {
    solutionVisibility = true;
    $( ".solution" ).css( "color", "black" );
    $(".solutionsButton").text("Hide all solutions");
  }
};
</script>

##1. Cryptographical strength 

<a class="btn-info solutionsButton" onclick="setVisible()">Show all solutions</a>

| Algorithm    | Strength (bit)                | Details                                |
|--------------|------------------------------:|----------------------------------------|
| 3DES         |            {{ "112" | hide }} |                                        |
| AES-128      |            {{ "128" | hide }} |                                        |
| AES-192      |            {{ "192" | hide }} |                                        |
| AES-256      |            {{ "256" | hide }} |                                        |
| AES-GCM-128  |            {{ "128" | hide }} | AES Galois Counter Mode (GCM)          |
| AES-GCM-192  |            {{ "192" | hide }} |                                        |
| AES-GCM-256  |            {{ "256" | hide }} |                                        |
| DH 8192      |           {{ "4096" | hide }} |                                        |
| DH ECP-256   |            {{ "128" | hide }} | Elliptic Curve Diffie Hellman (ECP)    |
| DH ECP-384   |            {{ "192" | hide }} | Elliptic Curve Diffie Hellman (ECP)    |
| DH ECP-512   |            {{ "256" | hide }} | Elliptic Curve Diffie Hellman (ECP)    |
| DH MODP 4096 |            {{ "256" | hide }} | DH More Modular Exponential            |
| ECDSA-160    |             {{ "80" | hide }} |                                        |
| ECDSA-224    |            {{ "112" | hide }} |                                        |
| ECDSA-256    |            {{ "128" | hide }} | Elliptic Curve Digital Signature (DSA) |
| ECDSA-384    |            {{ "192" | hide }} | Elliptic Curve Digital Signature (DSA) |
| ECDSA-512    |            {{ "256" | hide }} | Elliptic Curve Digital Signature (DSA) |
| RSA 1024     |             {{ "80" | hide }} |                                        |
| RSA 2048     |            {{ "112" | hide }} |                                        |
| RSA 3072     |            {{ "128" | hide }} |                                        |
| RSA 4096     |            {{ "128-192" | hide }} |                                    |
| RSA 7680     |            {{ "192" | hide }} |                                        |
| RSA 8192     |            {{ ">192" | hide }} |                                       |
| RSA 15360    |            {{ "256" | hide }} |                                        |
| SHA-1        |            {{ "<112" | hide }} |                                       |
| SHA-224      |            {{ "112" | hide }} |                                        |
| SHA-256      |            {{ "128" | hide }} |                                        |
| SHA-384      |            {{ "192" | hide }} |                                        |
| SHA-512      |            {{ "256" | hide }} |                                        |


##2. True Random numbers
Here are two sources that provide random numbers:
![Two random sequences]({{ site.url }}/images/true_randoms.png){:width="70%"}

####Q: What can be said about source a?
Source a is reliable, but it returns 1 more often then 0. So it has a bias towards 1. Sources of randomness that have a bias
aren't ideal.

####Q: What can be said about source b?
Source b had a good distribution between 1 and 0. However there are many gaps in the data stream which is also not ideal.

####Q: How can source a & b be used to build a good random number generator?
The random values can be incorporated in a entropy pool via a hash function (e.g. SHA1, SHA256). The pool can then be used
as a random seed for a good pseudo random number generator.


{% include toc.html %}
