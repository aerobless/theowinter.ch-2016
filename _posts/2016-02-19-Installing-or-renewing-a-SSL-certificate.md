---
layout: article
icon: fa-server
title: Installing or renewing a SSL certificate on an Apache server
description: "How to install or renew a SSL certificate on a Linux Apache server easy and quick."
category: articles
share: true
comments: true
tags: [Server, HowTo, SSL]
image:
  feature: monument_valley.jpg
---

About a year ago I've installed my first SSL certificate for this website. I got that certificate for free from the [GitHub Student Developer Pack](https://education.github.com/pack){:target="_blank"}. 
So now a year later it's time to renew it. The renewal process is roughly the same as the registration process so in order to safe myself some 
time next year I decided to write it up. This isn't a comprehensive guide, it focuses only on my specific setup. I'm running this site on a 
digital ocean Ubuntu droplet with Apache2. The SSL certificate is from Comodo RSA, offered through 
[Namecheap](https://www.namecheap.com/security/ssl-certificates/comodo/positivessl.aspx){:target="_blank"}.


1. Buy or renew the certificate.
2. Go to [Domains/DomainList](https://ap.www.namecheap.com/Domains/DomainList){:target="_blank"} and click `activate`.
3. Connect to your server via SSH and use `openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr` to generate a new CSR (Certificate Sigining Request). 
If you have multiple domains with SSL certificates it's recommended to replace "server" with your domain name.
4. Make sure to fill in all the information requested by the CSR utility. If company name, organisation unit don't apply to you, use "NA". The most important information is the common name which 
should be your full domain name. E.g. "theowinter.ch" for me. For a subdomain it would be "sub.theowinter.ch". And for a wildcard domain "*.theowinter.ch".
5. Open the generated server.csr with a text editor and copy the entire block including the header & footer.  
_-----BEGIN CERTIFICATE REQUEST-----  
MITJSJSKDAS32rkjdsfojwe20fsfjof23H)H  
JF8923HFKADJHFdsafasdfhiw7h/IHIhhsdf  
sdajfoisdjf982IOIJAFOFADJfjifjwe....   
-----END CERTIFICATE REQUEST-----_
6. Paste the CSR into the Namecheap page and follow the instructions.
7. At some point you will need to confirm that you own the domain. There's a choice between Email, HTTP-based and DNS-based. In my experience Email is
easiest. In order to confirm the domain via email you need to have an email account like `admin@domain.com`. On a plain linux server you can 
simply use Postfix to redirect emails to your personal email address. [I've written a post on how to do this.](/articles/Minimal-Mailserver-Redirecting-from-DigitalOcean-to-Gmail/)
8. Once you have confirmed your domain you'll receive a mail with a zip file containing a yourDomain_com.crt and yourDomain_com.ca-bundle. Upload them to your server 
and place them in a folder where you can find them again. If you're renewing an existing certificate simply replace the old certificate files with the new ones and restart apache.
9. If you're doing this for the first time you'll need to configure Apache2 to use the certificates you just uploaded. Navigate to `/etc/apache2/sites-available` and 
open the .conf file of your website in a text editor. Below you can see an example configuration that redirects all users to use HTTPS.

{% highlight apache %}
<VirtualHost *:80>
        #Redirect http://yourDomain.com to https://yourDomain.com
        ServerName yourDomain.com
        Redirect permanent / https://yourDomain.com/
</VirtualHost>
<VirtualHost *:80>
        #Redirect http://www.yourDomain.com to https://yourDomain.com
        ServerName www.yourDomain.com
        Redirect permanent / https://yourDomain.com/
</VirtualHost>
<VirtualHost *:443>
        ServerAdmin you@email.com
        DocumentRoot /var/www/yourDomain.com
        ServerName yourDomain.com
        ServerAlias www.yourDomain.com
        SSLEngine on
        SSLCertificateFile /home/root/yourDomain_com.crt
        SSLCertificateKeyFile /home/root/yourDomain.com.key
        
        #Rename yourDomain_com.ca-bundle to intermediate.crt
        SSLCACertificateFile /home/root/intermediate.crt

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
{% endhighlight %}

Restart apache `service apache2 restart` and you're done. It's a good idea to 
use [SSL checker](https://www.sslshopper.com/ssl-checker.html){:target="_blank"} to confirm that everything is fine.
