{
 "published": "2025-03-24"
}
# Services
## Ambassador {#ambassador}
I have a few services on my Hetzner VPS/Cloud, its hostname is *ambassador*
after the *Ambassador-class* starships in Star Trek (all my hostnames are Star
Trek starship classes).

I run on this server:
- A [Git Forge](https://git.charlotte-thomas.me/) as well as a runner
- A [conduwuit (matrix server)](https://github.com/girlbossceo/conduwuit) instance (faefox.dev)
- An instance of [Cinny (matrix client)](https://client.faefox.dev)
- A [service status page](https://uptime.faefox.dev)

## CloudFare Page {#page}
I use CloudFare Page to run a few static websites.
- [Personal Web and Blog](https://www.charlotte-thomas.me)
- [Writing Web, Blog, and Online Reader (SOON)](https://writing.charlotte-thomas.me)
- [Calc Web](https://calc.charlotte-thomas.me)

## Migadu {#image}
I use _Migadu_ as my email provider. I use the micro yearly plan, for only $20
USD a year I have everything I need. I have emails under the following domains.
- *charlotte-thomas.me*
  - me
  - gc
- *faefox.dev*
  - me
- *nwa2coco.fr* (to be deleted on May 2025)
  - charlotte

## NAS {#nas}
I have a NAS (2TB on RAID1) running on my **local** network. Its name is *Olympic* (because it
is old, big, and vulnerable)

I have twice daily backups using *restic* on it.

## Hostnames {#hostnames}
- My personal laptop is *Defiant* (because it's tough, and little)
- My work laptop is *Galaxy* (because it's big)
- My personal phone is *Danube* (because it's small)
- My NAS is *Olympic*
- My VPS is *Ambassador*

## Plans for the future {#future}
In the future, when I have my own home, with my own Network (because I am
moving to a place where I don't control it for the moment), my plan is to run a
Server/NAS where I can store my data and expose it to the web to run my
applications and everything I need

In the plans there is:
- Everything I run on my VPS
- A NAS (maybe with TrueNAS?)
- A NextCloud
- A web equivalent to Google Docs/Google Sheets
- A Plex Server 
- An OpenStack instance (to do ansible and terraform on)
- And everything that strike my fancy

The budget will be around **€1,500** to build it, and the minimum spec I want
are:
- CPU: 8C/16T, reasonably recent
- GPU: An Intel ARC for transcoding
- RAM: 64GB
  - 32GB for the NAS
  - 32GB for the VMs
- Storage:
  - 8TB in RAID5 with HDD
  - 512GB in RAID1 on NVMe
- PSU:
  - Gold Rated Unit 
  - An UPS
- Silent Fans.
- LAN: 2.5 Gbit/s 

I don't know if I want to run it on a rack or not. I think not.

Everything is _very_ subject to changes. It's the early version of what I'm
thinking. I may scrap it and run it from an old motherboard because I would have
updated my Framework. Maybe. So it can change it's just what I'm feeling at the
moment.

It won't exists for another year and a half (or more); but it will probably be
under some subdomains of `charlotte-thomas.me` and/or `faefox.dev`
