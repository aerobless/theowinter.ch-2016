---
layout: article
title: Information Security
description: "A handy compilation of various information security questions. Ideal to prepare for CompSci exams."
category: articles
share: true
comments: true
tags: [Information Security, Computer Science, HSR]
image:
  feature: dark_bunker.jpg
---

This post is a compilation of various information security questions and topics that are likely to be tested in the
InfSi2 exam at HSR. I'm expanding this post step by step while I'm reviewing the contents of this semester. I've done
something similar with the subject "[Automata and languages](/articles/44-questions-and-36-terms-about-automata-and-languages/)" last semester and it helped me a lot.

{{ "init" | hide }}

##1. Cryptographical strength 

Hover over the algorithm to see its solution, or press the button below to show all the solutions.
{{ "button" | hide }}

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


##3. Quantum Key Cryptography

Quantum Key Cryptography uses entangled Photons to distribute a secure key between two parties. It has ben successfully 
demonstrated by three independent research groups. What makes Quantum Key Cryptography special is that due to the laws of 
quantum physics it is possible to detect when a eavesdropper intercepts part of a quantum key. So the compromised parts of the 
data can be discarded.

####Fundamental Laws of Quantum Physics

+ One cannot take a measurement without perturbing the system.
+ One cannot determine simultaneously the position and the momentum of a particle with arbitrarily high accuracy.
+ One cannot simultaneously measure the polarization of a photon in the vertical-horizontal basis and simultaneously in the diagonal basis.
+ One cannot draw pictures of individual quantum processes.
+ One cannot duplicate an unkown quantum state.

####BB84 Quantum Key Distribution Protocol [^1]
1. Alice creates a random bit 0 or 1 and then randomly selects one of two bases (rectilinear or diagonal) to transmit it in. 
   Alice then sends a single photon in the state specified to Bob, using the quantum channel. This process is then repeated.
   Alice records the state, basis and time of each photon sent.

2. Since Bob doesn't know the basis the photons were encoded in, he selects a basis at random to measure in, either rectilinear 
   or diagonal. He does this for each photon, recording the time, measurement basis and result.
   
3. After Bob has measured all the photons, he communicates with Alice over the public channel. Alice tells Bob the basis each photon 
   was sent in, and Bob the basis each was measured in. Both discard the photon measurements where Bob used a different basis, which 
   is about half on average. The remaining bits are used as a shared key.
   
4. To check for a eavesdropper Alice and Bob now compare a certain subset of their remaining bit strings. If someone has gained any
   information about the photons polarization, this introduces errors in Bobs measurements. If more then a certain amount (p) bits 
   differ Bob and Alice abort the key and try again, possibly with a different quantum channel.

####Photon Yield vs Transmission Distance

Attenuation in a monomode fiber with &lambda; = 1550nm: 0.2db/km

| Distance | dB   | Survival rate of photons      |
|----------|------|-------------------------------|
| 50km     | 10dB | 1 out of 10 photons survive   |
| 100km    | 20dB | 1 out of 100 photons survive  |
| 150km    | 30dB | 1 out of 1000 photons survive |

####Q: Which of the following key bits are valid?
Hover over the Validity cells to see the solution, or press the button below to show all the solutions.
{{ "button" | hide }}

| Key Bit Alice | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 1 |
|---------------|---|---|---|---|---|---|---|---|
| Key Bit Bob   | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 1 |
| Filter Alice  | R | D | D | R | R | D | R | R |
| Filter Bob    | R | R | D | R | D | R | R | D |
| Validity      | {{ "✓" | hide }} | {{ "x" | hide }} | {{ "✓" | hide }} | {{ "✓" | hide }} | {{ "x" | hide }} | {{ "x" | hide }} | {{ "✓" | hide }} | {{ "x" | hide }} |

####Q: With the BB84 protocol Alice sends 10'000 key bits to Bob to produce a 256bit AES key. What happens if Bob moves and the distance between Alice and Bob increases from 50km to 100km?

+ Because of the absorption a lot less key bits reach their target. At 50km distance 1 of 10 reach their target. At 100km only
  1 of 100 reach their target. 
+ With 100bits (10'000/100) it's no longer possible to produce a 256bit AES key.

####Q: With what method can Alice and Bob check whether a eavesdropper steals or inserts photons?
They can insert random decoy states. These decoy states are sent with a much lower output rate so that there is a different 
statistical distribution of the received photons. An eavesdropper can't differentiate between the two different types of photons. 

##4. Generating keys with Pseudo Random Functions
A HMAC-based pseudo random function expands a secret and a _public_ initial seed into a key stream of arbitrary length. 
This can be achieved iterating a SHA-1 or SHA-256 based HMAC function controlled by a secret key using the following algorithm: 

{% highlight bash %}
v(0) = seed  
v(i) = HMAC(Key, V(i-1))  
key stream = V(1)|V(2)|V(3)|...  
{% endhighlight %}

The key stream is formed by concatenating the MAC values V(i) up to the desired output length.

####Question Introduction
A HMAC-SHA256 based pseudo random function is loaded with a 256bit key that is generated by a quantum source. 
The PRF is initialized with a 512bit seed and generates now 1536bit key material for two 256bit AES session keys and two 512bit 
HMAC-SHA512 session keys.

####Q: How can the four keys be cracked through a brute-force attack most easily?
The brute force attack should be aimed at the pseudo random function with 256bit key because all the other keys are derived from that.
So the 1536bit key material doesn't have more then 256bit entropy. It's best to use the first 256bit AES session key for brute force attempts.
And then to check whether there's a plain text result through decryption and histogram generation.

####Q: How many tries are needed for a brute force attack in the worst case?
In the worst case 2<sup>256</sup> tries are needed.

##5. MACsec

![MACsec]({{ site.url }}/images/macsec.jpg){:width="40%"}
MACsec stands for Media Access Layer Security, it's a technology used on the Data Link Layer.

| Code  | Name                             | Description                              |
|-------|----------------------------------|------------------------------------------|
| PAE   | Port Access Entity               |                                          |
| CA    | Connectivity Associtation        |                                          |
| CAK   | Connectivity Association Key     | Pre-shared secret, strong long-term key. |
| SC    | Secure Channel                   | Each PAE sets up a secure channel.       |
| SA    | Secure Association               | On every SC there's an SA.               |
| SAK   | Secure Association Key           | Short-term key.                          |
| MKA   | MACsec Key Agreement Protocol    |                                          |
| MKPDU | MACsec Key Agreement Protocol Data Unit | carried via EAPOL                 |
| EAP   | Extended Authentication Protocol |                                          |
| EAPOL | EAP over LAN                     |                                          |

####Q: What's the requirement that a PAE (e.g. ethernet port) can join a CA?
The PAE needs the CAK (shared secret) of the CA group. 

####Q: How many session keys (SAK) are needed by a CA with N PAEs so that everybody can communicate with everybody?
Each PAE has its own SAK that can be used to communicate with its N-1 peers. So N SAKs are required.

####Q: How are the required keys (SAK) generated in a CA with N PAEs using the MACsec Key Agreement Protocol (MKA)?
The N PAEs chose a key server which generates random SAK keys. Every SAK is encrypted with the CAK and distributed to the
N PAEs.

####Q: How are the MKPDUs transported over ethernet or wifi?
They are carried via the EAPOL protocol (EAP over LAN).

####Q: What's the default crypto suite of MACsec and what's its cryptographic strength?
The MKA Key Derivation Function (KDF) is a pseudo random function (PRF) based on AES-CMAC with a 128 or 256bit key.

##6. IPsec
IPsec (Internet Protocol Security) is a protocol suite for secure IP communications by authenticating and encrypting each
IP packet of a communication session. IPsec is an end-to-end security scheme operating in the Network Layer of the OSI model.

| Code  | Name                                          | Description                                                                                                                                                                                       |
|-------|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AH    | Authentication Header                         | Isn't used much in the real world.                                                                                                                                                                |
| ESP   | Encapsulating Security Payload                | Contains the actual IP packet.                                                                                                                                                                    |
| AEAD  | Authenticated Encryption with Associated Data | AEAD is based on special block cipher modes. Recommended AEAD Modes are AES-Galois and AES-GMAC (auth. only).                                                                                     |
| IKE   | Internet Key Exchange                         | IKE is run on UDP port 500. There's IKEv1 (1998) and IKEv2 (2005).                                                                                                                                |
| SA    | Security Association                          | A SA is a contract established between two IPsec endpoints. A separate IPsec SA is required for each subnet or single host. Separate IPsec SAs are required for inbound and outbound connections. |
| PFS   | Perfect Forward Secrecy                       |                                                                                                                                                                                                   |
| XAUTH | eXtended AUTHentication                       | Proprietary extension used by many vendors. Based on expired draft. Should not be used. EAP is better alternative. (IKEv1)                                                                        |
| EAP   | Extensible Authentication Protocol            | Used by IKEv2.                                                                                                                                                                                    |

####Reading the ipsec.conf file [^2]

{% highlight bash %}
conn net #conn <name> defines a connection, inherits from conn %default
     also=host #includes the parameters of connection "host", which be overwritten
     rightsubnet=10.0.0.0/14 #private subnet behind the participant, expressed as netmask
conn host
     left=55.1.2.2 #the IP address of the participant's public-network interface
     leftsourceip=%config #The internal source IP to use in a tunnel, also known as virtual IP.
     leftcert=redCert.pem
     leftid=red@colors.net #identity of the left endpoint
     right=55.1.2.1 #the IP address of the participant's public-network interface
     rightid=@baran.colors.net #identity of the right endpoint (participant)
     auto=start #operation be done automatically at IPsec startup
                   #start:  connect immediately
                   #add:    load connection without starting it
                   #route:  load connection and install kernel traps
                   #ignore: ignores the conenction, equals deleting it from the config file
{% endhighlight %}

####Q: What IKE messages are exchanged to establish two IPsec tunnels with IKEv2? How many IKEv2 packets are exchanged in total?

 + IKE_SA_INIT Request & Reply
 + IKE_AUTH Request & Reply
 + CREATE_CHILD_SA Request & Reply

So 6 packets in total.

##6. DNSSEC
DNSSEC (Domain Name System Security Extensions) is a suite of IETF specifications for information provided by the Domain 
Name System (DNS). It is a set of extensions to DNS which provide to DNS clients origin of authentication of the DNS data, 
authenticated deinal of existence and data integrity, but not availability or confidentiality.[^3]

| Code  | Name                                       | Description                                                                                                                                                                                                                                                              |
|-------|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DS    | Delegation Signer                          | Holds the name of a delegated zone.                                                                                                                                                                                                                                      |
| RRSIG | Resource Record Signature                  | Contains the DNSSEC signature for a record set. DNS resolvers verify the signature with a public key, stored in a DNSKEY-record.                                                                                                                                         |
| RRSET | Resource Record Set                        |                                                                                                                                                                                                                                                                          |
| ZSK   | Zone Signing Key                           | A ZSK is a public/private key pair. The ZSK private key is used to generate a digital signature, known as a Resource Record Signature (RRSIG), for each of the resource record sets (RRSET) in a zone. The ZSK public key is stored in the DNS to authenticate an RRSIG. |
| KSK   | Key Signing Key                            | A KSK is a public/private key pair. The KSK private key is used to generate a digital signature for the ZSK.  The KSK public key is stored in the DNS to be used to authenticate the ZSK.                                                                                |
| NSEC  | Next Owner Name                            | Authenticated denial of existence of an owner name. Proof that there is no name between x.org and y.org. Allows enumeration of complete zone data.                                                                                                                       |
| NSEC3 | Next Owner Name in Hashed Order            | Hashed authenticated denial of existence. Proof that there is no name between hashx.org and hashy.org Does not allow straight enumeration of zone data. Dictionary attacks are possible but expensive.                                                                   |
| DANE  | DNS-Based Authentication of Named Entities |                                                                                                                                                                                                                                                                          |
| TLD   | Top Level Domain                           |                                                                                                                                                                                                                                                                          |
| DoC   | Department of Commerce                     |                                                                                                                                                                                                                                                                          |
| DSR   | Delegation Sign Record                     |      

####Chain of trust

Root --> Zone --> Domain


####Q: What are the components of a DS Resource Record and how does it establish trust in the signature (RRSIG Resource Record)?

{% highlight bash %}
ch. 44153 IN DS 63261 7 2 006fad0dbe3d543e862ceb367b03ed26
                          a3d2c5cdbeb19a5a51fcd1f6eb8241ac ;
ch. 44153 IN RRSIG DS 8 1 86400 20101228000000
                                20101220230000 40288 .
                      JmPUQhViG9jg+wBVnPqOSs/NjS8747WOUDKN5amYsCc3Lclsh7l2fCpDwKf
                      mp2uRC69byKm0HNy8DNdXG36OQID7xrLCccuWd1Lbl36TjS1Tc5c/l/RDra
                      y15qW3jB7++53Q3fOqY+P5+M7P6y05pe4mELZl4IUtMnPbCtCbjKw= ;
{% endhighlight %}

+ The DS record consists of a SHA-256 hash of the KSK.
+ the DS record of zone .ch is signed through the ZSK of the root zone.
+ The trust in the ZSK of the root zone is established through the KSK of the root zone.
+ The KSK is the root of the hierarchy and has to be imported explicitly into the DNS server.




[^1]: [Wikipedia: Quantum key distribution](https://en.wikipedia.org/wiki/Quantum_key_distribution)
[^2]: [StrongSwan ipsec.conf](https://wiki.strongswan.org/projects/strongswan/wiki/IpsecConf#Reusing-Existing-Parameters)
[^3]: [Wikipedia: DNSSEC](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions)

{% include toc.html %}
