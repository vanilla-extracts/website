{
 "published": "2025-12-14"
}
# Services (The Third Time)
This is an update to my *services* articles.

## Baremetal infrastructure {#baremetal}
My main infrastructure is now hosted on one small server in my living room, connected to a UPS.

This server (name *starbaseone*) is a modified M5 PLUS box, with the following specifications
- AMD Ryzen 7 5825U 8C-16T (4.55GHz)
- 32 GB of DDR4 RAM
- 512 GB of NVME SSD storage

I installed Proxmox VE on it and created two VMs
- *Galaxy* which like its namesake is the replacement of *Ambassador*
  - With 8 threads; 16GiB of RAM; and 256GB of storage
- *Daystrom* which is a internal network only VM made to run Home Assistant.
  - With 2 threads; 4GiB of RAM; and 32GB of storage
  
## VPS Infrastructure {#vps}
I run on *Galaxy*:
- A [Git Forge](https://git.charlotte-thomas.me/) as well as a runner
- An instance of [Cinny (matrix client)](https://client.faefox.dev)
- A [NextCloud Instance](https://cloud.faefox.dev) (you can request an account by email)
- A [LLDAP Instance](https://auth.faefox.dev)
- A [Jitsi Instance](https://meet.tutorat.me)
- A [Tinyauth server](https://sso.faefox.dev)
- A [Whiteboard](https://whiteboard.faefox.dev)
- A [XMPP instance](https://xmpp.faefox.dev)
- A [Matrix homeserver](https://faefox.dev)
- A [Maloja instance](https://maloja.faefox.dev) 

Then on *Daystrom* there is the [Home Assistant](https://home-assistant.io) instance of the flat.

## Backups {#backup}
Backups are made each day at T0400 Europe/Paris on a S3-compatible bucket.

For the data to completely disappear it would need an explosion of some sort in Rennes, and a nuke in Europe on the Hetzner glacier.

I thus decided that we were sufficiently secured, of course if a nuke is launched on France, I might very well die, which mean the fact the data is safe is not very important anymore, because I'd be dead.
But so is life you know.

## Hostnames {#hostnames}
- My personal laptop is *Defiant* (because it's tough, and little)
- My personal phone is *Danube-II* (I replaced my trusty *S21* by a *S24 FE*)
- My NAS is *Olympic*
- My baremetal server is *StarbaseOne*
- VPSes are:
  - *Galaxy*
  - *Daystrom*

## Plans for the future {#future}
Now that I have a good server, I might add another node to the PVE, but future money will go towards getting/constructing a modern NAS. With the following specifications

- 5 Bays
- 5x8TB NAS Hard Drive
- RAID5
- Support for SMB, NFSv4
- A good amount of RAM for caching
- A SSD for caching too
