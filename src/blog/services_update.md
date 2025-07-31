{
 "published": "2025-07-11"
}
# Services
This is an update to my *services* article I posted a few months ago.

## VPS Infrastructure {#vps}
I have a bigger infrastructure nowadays, it is hosted on [mercurycloud](https://mercurycloud.fr/) which is a small French cloud provider.

I have multiple servers on mercurycloud.
- *Ambassador* (8vCPU, 16GB of RAM), named after the *Ambassador-class* starships in Star Trek (all my hostnames are Star Trek starship classes).
- *Nova* (2vCPU, 4GB of RAM), you guessed it named after the *Nova-class* starships.

I have another server on Hetzner, it is only used for its sheer reliance to be online 24/7.
- *Miranda* (2vCPU (shared), 4GB of RAM)

*Ambassador* and *Nova* are hosted in Rennes, France. *Yellowstone* has been discontinued, and is replaced by a S3 bucket on Hetzner.

*Miranda* is hosted on the Hetzner datacentre in Helsinki, Finland.

I run on *Ambassador*:
- A [Git Forge](https://git.charlotte-thomas.me/) as well as a runner
- An instance of [Cinny (matrix client)](https://client.faefox.dev)
- A [NextCloud Instance](https://cloud.faefox.dev) (you can request an account by email)

On *Nova* there are:
- A [Grafana/Prometheus](https://monitoring.faefox.dev), which is used to quickly see the health of my servers
- The [SharedAgenda](https://git.charlotte-thomas.me/vanilla-extracts/SharedAgenda) API.

And finally on *Miranda*:
- A [conduwuit (matrix server)](https://github.com/girlbossceo/conduwuit) instance (faefox.dev)
- A [service status page](https://uptime.faefox.dev)

## Backups {#backup}
Backups are made each day at T0400+0200 on a S3-compatible bucket, hosted somewhere in Europe, but not in France, thus the data I put there is quadruple safe,
first, it is on my personal computer. Second it is on *Ambassador* on nextcloud. Third it is in the backups of my VPS provider, which puts their data in a glacier somewhere in France.
And fourth it is on the glacier of the S3-compatible bucket. So for the data to disappear it would need an explosion of some sort in Rennes, a nuke in France, and a nuke in Europe on the second glacier.

I thus decided that we were sufficiently secured, of course if a nuke is launched on France, I might very well die, which mean the fact the data is safe is not very important anymore, because I'd be dead.
But so is life you know.

And oh yes, it is *also* on my NAS, which will soon have a backup. I'm not paranoid about data retention ;).

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

## NAS {#nas}
I have a NAS (2TB on RAID1) running on my **local** network. Its name is *Olympic* (because it
is old, big, and vulnerable)

I have twice daily backups using *restic* on it.

## Hostnames {#hostnames}
- My personal laptop is *Defiant* (because it's tough, and little)
- My work laptop is *Galaxy* (because it's big)
- My personal phone is *Danube* (because it's small)
- My NAS is *Olympic*
- VPSes are:
  - *Ambassador*
  - *Nova*
  - *Miranda*

## Plans for the future {#future}
In the future, when I have my own home, with my own Network (because I am
moving to a place where I don't control it for the moment). My plan is to run a
Server/NAS where I can store my data and expose it to the web to run my
applications and everything I need

In the plans there is:
- Everything I run on my VPSes (or maybe I'll keep the VPS, still unknown.)
- A NAS (maybe with TrueNAS?)
- A Plex/Jellyfish Server 
- An OpenStack instance (to do ansible and terraform on) (maybe not in hindsight)
- And everything that strike my fancy

The budget will be around **€2,000** to build it, and the minimum spec I want
are:
- CPU: 8C/16T, reasonably recent
- GPU: An Intel ARC for transcoding
- RAM: 64GB
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
under some subdomains of *charlotte-thomas.me* and/or *faefox.dev*. Probably more *faefox.dev* as we can all agree, it is the funnier one.

- EDIT: Add miranda in the servers, 2025-07-28.
- EDIT: Remove yellowstone from the servers, 2025-07-29.
- EDIT: Moved status page to miranda, 2025-07-30.
- EDIT: Added backup on S3 bucket, 2025-07-31.
