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

{% include toc.html %}

##1. Cryptographical strength



| Algorithm    | Strength (bit) | Details                                |
|--------------|---------------:|----------------------------------------|
| 3DES         |            112 |                                        |
| AES-128      |            128 |                                        |
| AES-192      |            192 |                                        |
| AES-256      |            256 |                                        |
| AES-GCM-128  |            128 | AES Galois Counter Mode (GCM)          |
| AES-GCM-192  |            192 |                                        |
| AES-GCM-256  |            256 |                                        |
| DH 8192      |           4096 |                                        |
| DH ECP-256   |            128 | Elliptic Curve Diffie Hellman (ECP)    |
| DH ECP-384   |            192 | Elliptic Curve Diffie Hellman (ECP)    |
| DH ECP-512   |            256 | Elliptic Curve Diffie Hellman (ECP)    |
| DH MODP 4096 |            256 | DH More Modular Exponential            |
| ECDSA-160    |             80 |                                        |
| ECDSA-224    |            112 |                                        |
| ECDSA-256    |            128 | Elliptic Curve Digital Signature (DSA) |
| ECDSA-384    |            192 | Elliptic Curve Digital Signature (DSA) |
| ECDSA-512    |            256 | Elliptic Curve Digital Signature (DSA) |
| RSA 1024     |             80 |                                        |
| RSA 2048     |            112 |                                        |
| RSA 3072     |            128 |                                        |
| RSA 4096     |        128-192 |                                        |
| RSA 7680     |            192 |                                        |
| RSA 8192     |           >192 |                                        |
| RSA 15360    |            256 |                                        |
| SHA-1        |           <112 |                                        |
| SHA-224      |            112 |                                        |
| SHA-256      |            128 |                                        |
| SHA-384      |            192 |                                        |
| SHA-512      |            256 |                                        |

