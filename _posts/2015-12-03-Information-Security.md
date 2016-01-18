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
| RSA 4096     |            {{ "<192" | hide }} |                                    |
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
     leftsubnet=10.1.0.0/16 #private subnet behind the participant, can be restricted for protocol/port by adding [tcp/http], [6/80] etc.
     leftsourceip=%config #internal source IP to use in a tunnel, also known as virtual IP.
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

####Q: What IKEv1 messages are exchanged to establish two IPsec tunnels with IKEv1? How many IKEv2 packets are exchanged in total?

 + ISAKMP_SA_Proposal Request & Reply +2
 + DH Key Exchange Request & Reply +2
 + Identity Exchange (encrypted) Request & Reply +2
 + Quick Mode Traffic Selectors Request, Response, Agreement +3
 + Quick Mode Additional Tunnel Request, Response, Agreement +3
 
 So 15 packets in total.

####Q: What IKEv2 messages are exchanged to establish two IPsec tunnels with IKEv2? How many IKEv2 packets are exchanged in total?

 + IKE_SA_INIT Request & Reply +2
 + IKE_AUTH Request & Reply +2
 + CREATE_CHILD_SA Request & Reply +2

So 6 packets in total.

####Q: Two subnets are connected by a successfully established IPsec tunnel. A ping works perfectly but a large FTP download stagnates. Where is the problem?

ICMP (ping) packets are small, where as the FTP downloaded fills packets with to the MTU (Maximum Transmission Unit). Since the packets are
tunneled there's the addtional IPsec header added which apperently makes the packet larger then the MTU supported by the connection. The packets are then 
fragmented which causes the dected problem when large files are transfered.  
In this case the dynamic MTU discovery doesn't work properly so it (the MTU discovery) should be fixed or set manually.

##6. DNSSEC
DNSSEC (Domain Name System Security Extensions) is a suite of IETF specifications for information provided by the Domain 
Name System (DNS). It is a set of extensions to DNS which provide to DNS clients origin of authentication of the DNS data, 
authenticated deinal of existence and data integrity, but not availability or confidentiality.[^3]

| Code  | Name                                       | Description                                                                                                                                                                                                                                                              |
|-------|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DS    | Delegation Signer                          | Holds the name of a delegated zone. Is a signed hash computed over KSK of child zone.                                                                                                                                                                                                                                      |
| RRSIG | Resource Record Signature                  | Contains the DNSSEC signature for a record set. DNS resolvers verify the signature with a public key, stored in a DNSKEY-record.                                                                                                                                         |
| RRSET | Resource Record Set                        |                                                                                                                                                                                                                                                                          |
| ZSK   | Zone Signing Key                           | Has flag 256. A ZSK is a public/private key pair. The ZSK private key is used to generate a digital signature, known as a Resource Record Signature (RRSIG), for each of the resource record sets (RRSET) in a zone. The ZSK public key is stored in the DNS to authenticate an RRSIG. |
| KSK   | Key Signing Key                            | Has flag 257. A KSK is a public/private key pair. The KSK private key is used to generate a digital signature for the ZSK.  The KSK public key is stored in the DNS to be used to authenticate the ZSK.                                                                                |
| NSEC  | Next Owner Name                            | Authenticated denial of existence of an owner name. Proof that there is no name between x.org and y.org. Allows enumeration of complete zone data.                                                                                                                       |
| NSEC3 | Next Owner Name in Hashed Order            | Hashed authenticated denial of existence. Proof that there is no name between hashx.org and hashy.org Does not allow straight enumeration of zone data. Dictionary attacks are possible but expensive.                                                                   |
| DANE  | DNS-Based Authentication of Named Entities |                                                                                                                                                                                                                                                                          |
| TLD   | Top Level Domain                           |                                                                                                                                                                                                                                                                          |
| DoC   | Department of Commerce                     |                                                                                                                                                                                                                                                                          |
| DSR   | Delegation Sign Record                     |      |
| DNSKEY | DNS Public Key                            | Contains a public key used to sign RRsets of a zone |

####Reading a DNSSEC Resource Record

{% highlight bash %}

switch.ch. 81154 IN DNSKEY 256 3 5 AwEAAeCDWwjJO4mXBzayiKf4p7waJ7Ew
                              eUnsTsAWkxpfELci4iaVdBugzYPfsZIg
                              9R6TIPky3LoPAPmIjCc2fbFkKnrGI7hJ
                              jXAGMRwRJIBprFx4BXZSsjsvGb6MGC+e
                              xHSlXw==
                              ;{id = 64608 (zsk), size = 768b}
{% endhighlight %}

| Flag  | Description                       |
|-------|-----------------------------------|
| 256   | Zone Signing Key (ZSK)            |
| 257   | Key Signing Key (KSK)             |
| 5     | SHA-1 with RSA                    |
| 7     | SHA-1 with RSA & NSEC3 with SHA-1 |
| 8     | SHA-256 with RSA                  |
| 10    | SHA-512                           |

####Chain of Trust

With the chain of trust model, a Delegation Signer (DS) resource record in a parent domain can be used to verify a DNSKEY 
record in a subdomain, which can then contain ohter DS records to verify further subdomains.[^3]

![DNSSEC Chain of Trust]({{ site.url }}/images/dnssec_chainOfTrust.png){:width="100%"}


####DNS resolution

1. the client asks its configured dns server (ISP, Google Public DNS etc.) to resolve a address.
2. The dns server recursively asks
	 1. Root server which tells it the TLD server (.com)
	 2. TLD server (.com) which tells it the name server (ns.someserver.com)
	 3. The nameserver (ns.someserver.com) is responsible and kept in the cache.
6. The dns server responds to the client

####DNS Cache Poisoning
The idea behind DNS Cache poisoning is to respond to a DNS requests faster than the real server. The difficulty to do this is
that the fake responder needs to guess the QID (Query ID) of the request in order to respond with the same ID. If a fake responder is
successful then there's a wrong entry in the cache of the originator and so its cache is poisoned. 

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

##7. VoIP Security
Without security measures anyone with network access can eavesdrop on a Voice over IP (VoIP) session.

| Code  | Name                         | Description                                                                                                                                                                                                                                                                                                                                            |
|-------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SIP   | Session Initiation Protocol  | Used to initiated a VoIP session.                                                                                                                                                                                                                                                                                                                      |
| SDP   | Session Description Protocol | A SDP payload is transmitted during the SIP connection setup. The SDP payload can be protected on a "hop-to-hop" basis via TLS (Transport Layer Security).                                                                                                                                                                                             |
| RTP   | Real-time Transport Protocol | A protocol used to transmit audio & video over IP. RTP is used in conjunction with the RTP Control Protocol(RTCP).                                                                                                                                                                                                                                     |
| SRTP  | Secure RTP                   | SRTP offers efficient encryption and authentication of multimedia packets. The main problem is the secure distribution of the session keys.The key exchange can be effected via the SDP payload that is transmitted during the connection setup. An alternative to SRTP is IPsec which can also be used to secure media streams.                       |
| VLAN  | Virtual LAN                  |                                                                                                                                                                                                                                                                                                                                                        |
| MIKEY | Multimedia Internet KEYing   | MIKEY allows the secure key exchange between two or more peers. Two public key methods are defined: RSA public key encryption (PKE) or Diffie Hellman (DH). Both methods required the trusted distribution of the peers public keys. The main problem is the lack of a global Public Key Infrastructure (PKI). MIKEY payloads are transmitted via SDP. |
| SPIT  | SPam over Iternet Telephony  | Short advertising messages automatically spread in large numbers by bots.                                                                                                                                                                                                                                                                              |
| PKI   | Public Key Infrastructure    |                                                                                                                                                                                                                                                                                                                                                        |
| PSK   | Pre-Shared Keys              |                                                                                                                                                                                                                                                                                                                                                        |
| DK    | Domain Keys                  | The DNS-based DomainKeys scheme was postulated by Yahoo for trusted email. It can be used for the public key operations required by the MIKEY exchange. DNS requests are not very secure but currently DNSSEC is being deployed on a global scale.                                                                                                     |

A and B are clients of provider P. A calls B over the proxy server of provider P. Inside the SDP payload that is sent with the SIP INVITE the following data 
is visible as plaintext.

{% highlight bash %}
  m=audio 49170 RTP/SAVP 0
  a=crypto:1 AES_CM_128_HMAC_SHA1_32
    inline:NzB4d1BINUAvLEw6UzF3WSJ+PSdFcGdUJShpX1Zj|2^20|1:32
{% endhighlight %}

####How can the SRTP master key be protected from third parties?
Using a Hop-to-Hop encryption of the SIP protocol via TLS (SIPS).  
A *<-- TLS -->* Proxy P *<-- TLS -->* B 

####What technical precautions are necessary so that provider P can pass on the communication between A and B to government agencies (lawful inspection)?
+ The SRTP master keys of all sessions are available as plaintext on the proxy because of the Hop-to-Hop TLS security.
+ Since provider P is also the ISP of A and B it can even decrypt the SRTP multimedia channel in realtime with the SRTP master keys.

####A and B want to prevent eavesdropping by government agencies. What options do they have?
A secure End-to-End key exchange can be established by using the MIKEY protocol (DH or RSA encryption) during the SIP connection setup. 

####How can A and B be sure that no "Man in the Middle (MitM)" attack is launched against them?
+ Through strong authentication based on a digital signature.
+ And by using a RSA signature key that has a established trust relation based on a X.509 certificate, DNSSEC or other third party method.

##8. Network Access Control (NAC)
NAC controls the access to a computer network with policies, including pre-admission security checks of the device that's 
attempting to join a network. It also contains post-admission controls over where users and devices can go on a network.

So when a computer attempts to connect to a network it is now permitted to access anything unless it complies with the policies that are in place.
Such policies could be an up-to-date anti-virus protection, operating system and configuration.

| Code   | Name                                          | Description                                                                                                                                                                    |
|--------|-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NAC    | Network Access Control                        |                                                                                                                                                                                |
| NAP    | Network Access Protection                     | Microsoft's NAC, introduced with Windows Vista and Server 2008.                                                                                                                |
| TPM    | Trusted Platform Module                       |                                                                                                                                                                                |
| TNC    | Trusted Network Connect                       | Emerging standard for NAC by TCG.                                                                                                                                              |
| NEA    | Network Endpoint Assessment                   | Emerging standard for NAC by IETF.                                                                                                                                             |
| SoH    | Statement of Health                           | Used by NAP (Microsoft).                                                                                                                                                       |
| IF     | Interface                                     |                                                                                                                                                                                |
| IMC    | Integrity Measurement Collector               | Collects measurements which are then sent to a IMV which verifies if the integrity of a device has been compromised.                                                           |
| IMV    | Integrity Measurement Verifier                | Receives measurements collected by a IMC and verifies them.                                                                                                                    |
| MAP    | Metadata Access Point                         |                                                                                                                                                                                |
| PDP    | Policy Decision Point                         |                                                                                                                                                                                |
| PEP    | Policy Enforcement Point                      |                                                                                                                                                                                |
| PTS    | Platform Trust Service                        |                                                                                                                                                                                |
| TCG    | Trusted Computing Group                       |                                                                                                                                                                                |
| TNCCS  | TNC Client-Server                             |                                                                                                                                                                                |
| TSS    | TCG Software Stack                            |                                                                                                                                                                                |
| PA-TNC | Posture Attribute for Trusted Network Connect | PA-TNC attributes are transported via PA-TNC messages. There is a set of default PA-TNC attributes but every manufacturer of TNC equipment can also define his own attributes. |
| PA     | Posture Attribute                             |                                                                                                                                                                                |

##9. Buffer Overflow Protection
A buffer overflow is an anomaly where a program overruns a buffer's boundary and overwrites adjacent memory locations. Buffer 
overflows can be exploited to take over a computer system.

The three most effective ways to prevent buffer overflow exploits are:

1. **Address Space Layout Randomization (ASLR)**  
The start address of libraries, heap and stack are randomly distributed in a large area of the address space. So that 
determining absolute addresses is a lot more difficult.

2. **Canaries**  
Canaries are known values that are placed between a buffer and control data on the stack, such as the return address, to monitor 
buffer overflows. When the buffer overflows, the first data to be corrupted will usually be the canary. When a canary cannot be 
verified the systems knows that there has been a buffer overflow, which can then be handled (e.g. invalidating the corrupted data).

3. **Executable Space Protection (NX Bit) / Tagging**  
Certain area of the memory are marked as non-executable. The processor will then refuse to execute any code residing in 
these areas of memory.

##10. Contactless Proximity Cards

| Code   | Name                                   | Description                                                                                                                                                                                                                                                                                                      |
|--------|----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DH     | Diffie Hellman                         | Public Key Cryptosystem                                                                                                                                                                                                                                                                                          |
| RSA    | Rivest-Shamir-Adlemann                 | Public Key Cryptosystem                                                                                                                                                                                                                                                                                          |
| IV     | Initialisation Vector                  | Required to initialise symmetric encryption algorithms                                                                                                                                                                                                                                                           |
| Nonce  | Nonce                                  | Random number, used in challenge-response protocols                                                                                                                                                                                                                                                              |
| MAC    | Message Authentication Code            | Cryptographically secured checksum                                                                                                                                                                                                                                                                               |
| MIC    | Message Integrity Code                 | Synonym for MAC                                                                                                                                                                                                                                                                                                  |
| PC     | Proximity Cards (ISO 14443)            | Distance <10cm                                                                                                                                                                                                                                                                                                   |
| VC     | Vicinity Cards (ISO 15693)             | Distance between 10cm and 1m                                                                                                                                                                                                                                                                                     |
| OTP    | One Time Password                      |                                                                                                                                                                                                                                                                                                                  |
| NFC    | Near Field Communication               | NFC uses ISO 14443 proximity standard (f=13.56MHz). NFC supports two modes, active and passive. In active mode both devices generate a RF field (d < 20cm). In passive mode only the initiating device generates a RF field. The responding device applies load modulation by varying the impedance (d < 10cm).  |
| MF     | Master File                            | Root directory in the Smart Card File System, must always be present.                                                                                                                                                                                                                                            |
| DF     | Dedicated File                         | Directory file in the Smart Card File System, can contain directory and data files.                                                                                                                                                                                                                              |
| EF     | Elementary File                        | Data file in the Smart Card File System.                                                                                                                                                                                                                                                                         |
| FID    | File Identifier                        |                                                                                                                                                                                                                                                                                                                  |
| AID    | Application Identifier                 | An AID consists of a 5byte Registered Identifier (RID) containing a country code, an application category and a provider identifier plus an optional Proprietary Application Identifier (PIX). AIDs must be registered with an appointed national registration authority and are usually kept confidential.      |
| RID    | Registered Identifier                  |                                                                                                                                                                                                                                                                                                                  |
| APDU   | Application Protocol Data Units        |                                                                                                                                                                                                                                                                                                                  |
| PKCS   | Public Key Cryptography Standards      | PKCS is a group of public-key cryptography standards devised and published by RSA Security Inc.                                                                                                                                                                                                                  |
| PKCS15 | Cryptographic Token Information Format |                                                                                                                                                                                                                                                                                                                  |
| EMV    | Europay, Mastercard and Visa           | EMV is a technical standard for smart payment cards as well as for payment terminal and ATMs.                                                                                                                                                                                                                    |
| CSP    | Cryptographic Service Provider         |                                                                                                                                                                                                                                                                                                                  |

####Why is the maximal range for conctactless chipcards like LEGIC or MIFARE limited to 10cm?
The chip on the card receives its power wireless through the built-in antenna. Since this technique uses magnetic coupling 
the distance between the card and the reader has to be relatively small. 

##11. PKCS #15 Cryptographical Token Information Format

| Code   | Name                                 | Description                                                                                                                                 |
|--------|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| DIR    | Reference File                       | This optional EF provides a link to one or several PKCS#15 directories.                                                                     |
| TokInf | Token Info File                      | This EF contains card information relevant to the PKCS#15 application.                                                                      |
| ODF    | Object Directory File                | This EF contains pointers to EFs, each containing a directory over PKCS#15 objects of a particular class..                                  |
| AODF   | Authentication Object Directory File | This EF contains pointers to one or several authentication objects, e.g. PINs.                                                              |
| PrKDF  | Private Key Directory File           | This EF contains pointers to one or several private key files.                                                                              |
| CDF    | Certificate Directory File           | This EF contains pointers to one or several certificate files.                                                                              |
| PuKDF  | Public Key Directory File            | This EF contains pointers to one or several public key files.                                                                               |
| SDF    | Secret Key Directory File            | This EF contains pointers to one or several secret key files.                                                                               |
| DODF   | Data Object Directory File           | This EF contains pointers to one or several data object files.                                                                              |
| CHV    | Card Holder Verification             | Also called the PIN. Typically a 4 to 8 digit number entered by the cardholder to verify that the cardholder is authorized to use the card. |
| EF     | Elementary File                      |                                                                                                                                             |


####How can a application find the certificate in the following PKCS#15 topology and what's the absolute path to access the certificate?

<figure class="half">
	<img src="{{ site.url }}/images/pkcs15.png">
<p markdown="block">
1. The file `/3F00/2F00` has a link to the directory `/3F00/5015/`.
2. The directory `5015` has a Object Directory File (ODF) called `5031`.
3. The ODF `5031` has a link to the Certificate Directory File (CDF) `/3F00/5015/4404`.
4. The CDF `4404` has a link to the certificate file `/3F00/5015/5501`.
</p>
</figure>

So the absolute path to the certificate file is `/3F00/5015/5501`.

####What's the absolute path of the PIN file that is used to write-protect the certificate file?

The pin file used to protect the certificate is located at `/3F00/0000`.

##12. Anonymizing Mixes

Anonymizing Mixes are for example the TOR network. It allows users to access websites anonymously and content providers to 
provide their services anonymously via so-called [hidden services](https://www.torproject.org/docs/hidden-services.html.en){:target="_blank"}. 

####Why should a TOR server (hidden service) chose a number of Introductory Points and not publish a Rendezvous Point (RP) directly?

+ The Rendezvous Point (RP) might not be willing to serve as RP if it knew what content the server (hidden service) distributes.
+ The RP could be attacked with DoS (Denial of Service) attacks to keep the server and its contents offline.

####For what reason does the server (providing a hidden service) deposit a public key at a number of introduction points? What's the purpose of this public key?
The public key is used by clients to contact the server and exchange encrypted connection details.

####What is a "Rendezvous Cookie"?
A rendezvous cookie is used by a client to establish a connection to a server providing a hidden service. It is first sent to a
random Rendezvous Point (RP). Then it is forwarded to the server containing the name of the RP. Now the server shows the 
cookie to the RP (imagine a entry ticket) and the RP builds a circuit to the client. Client and server can now communicate.

####Why does the client send a (public) Diffie-Hellman (DH) factor to a hidden service server on connection establishment?
The public DH factor is used for the End-to-End encryption of the client and server via the RP. The server also sends a DH factor to the client via
the RP.

####Typical problems

 + not encrypted (input = output)
 + duplicated packets are not recognized and handed to the next mix node
 + packets are handed to the next mix node with none or minimal delay

##13. Cryptographical Speed

####Rank the following Crypto Suites by their performance on a 64bit linux platform
**Note:** The ranking is independent of whether the Intel AES-NI instruction are available or not.
{{ "button" | hide }}

| Crypto Suite     | Rank | Comment                                                                                                       |
|------------------|------|---------------------------------------------------------------------------------------------------------------|
| AES-128, SHA-256 | {{ "3" | hide }} | SHA-256 is slower then SHA-512 on 64bit platforms because it uses 32bit words instead of native 64bit words.  |
| AES-128, SHA-384 | {{ "2" | hide }} | SHA-384 has the same speed as SHA-512 because it is just a abridged 512bit hash with a different init vector. |
| AES-128, SHA-512 | {{ "2" | hide }} | SHA-512 is faster than SHA-128 on 64bit platforms because it uses native 64bit words instead of 32bit words.  |
| AES-GCM-128      | {{ "1" | hide }} | AES-GCM is very efficient.                                                                                    |

##14. VPN (Virtual Private Network)

A virtual private network (VPN) extends a private network across a public network such as the internet.[^4]

VPN connections can be established on the following three layers of the OSI model:

+ Transport Layer
+ Network Layer
+ Data Link Layer





[^1]: [Wikipedia: Quantum key distribution](https://en.wikipedia.org/wiki/Quantum_key_distribution)
[^2]: [StrongSwan ipsec.conf](https://wiki.strongswan.org/projects/strongswan/wiki/IpsecConf#Reusing-Existing-Parameters)
[^3]: [Wikipedia: DNSSEC](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions)
[^4]: [Wikipedia: VPN](https://en.wikipedia.org/wiki/Virtual_private_network)

{% include toc.html %}
