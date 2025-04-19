{
  "published": "2025-04-19"
}
# DIY Android Auto Infotainment Screen

## Goal and motivation {#goal}
My father had two old netbooks with barely enough RAM and storage to be useful
(and which could absolutely not run modern Window.)

We thought about upcycling them, install a modern linux distribution, and
giving them to someone who could use a small and not very powerful computer. 

But then we had another idea, see, my parents have two cars:
- A beautiful 2020 Hybrid Toyota Corolla Break in a colour my parents insist is *ebene*
  which is a woody dark brown; ~don't tell them but it looks black from afar~.
  With a decent Android Auto experience, and overall is a pleasure to ride, I am
  sure it is a pleasure to drive too, but I don't drive and even if I did I am not
  sure my dad would trust me with this car.

- An old red Fiat Panda. Which to be fair is fairly fun when the person who is driving
  it has confidence in their skills. 

Well, the Corolla is mostly used by my mum, for reasons she prefers the
automatic transmission (we live in France, most of our cars are still using
manual transmissions).

The Panda does not have any infotainment -- being old and all -- and my dad
sometimes uses it to go pick mushrooms (a important hobby of his, he blogs his
mushroom adventures on his [mastodon profile (in french)](https://mastoot.fr/@atheach) -- as well as saying
a "good morning" _every_ morning.)

So a thought came to us in a discussion on a morning.

*Why not turn one of the computers into an infotainment system for the Panda?*

## Ingredients {#ingredients}
For this recipe you will need:
- Any old netbook (here is an old laptop with an 11" screen, 2 GB of RAM, and 32
  GB of RAM, an *Asus X205TA*)
- A compatible touch-screen for the laptop ([this one on
ebay](https://www.ebay.fr/itm/363419205899))
- A way of drawing power from the car to the laptop

### Photos {#ingredients-photo}
#### Laptop {#laptop}
[![Laptop](/static/start.jpg)](/static/start.jpg)

#### Power {#power}
[![Power](/static/power.jpg)](/static/power.jpg)

## Step 1: OS {#os} 
We obviously decided to install a linux distro on the netbook. 

First, the computer was running a really old version of Window -- 8.1 if I
remember correctly -- and of course with its 2 GB of RAM and 32 GB of _eMMC_ it
wasn't going to run Window 10, or worse Windows 11.

After some considerations, particularly about the bluetooth/wifi card, we
decided to wing it and install Debian 12 vanilla on it.

--

And it worked like a charm!

*Except for the Wifi*

Fortunately we found a tutorial for _this_ particular machine, the _Asus
X205TA_, and sure enough we were successful in making wifi work. 

Now we needed to modify the hardware!

## Step 2: Hardware modifications {#hardware}

Hardware was _exclusively_ done by my dad, I am not _at all_ good with hardware.
I know how to build a server/computer. And that's it. 

So I'll not go into details here.

Fortunately this step is
actually pretty easy you only need to perform a couple steps

- Remove the closing-detection magnet.
- Install the touchscreen.

### Computer Disassembled {#disassembled}
[![Disassembled](/static/disassembled.jpg)](/static/disassembled.jpg)

This is the computer fully disassembled. The keyboard is off-screen.

### Keyboard cable {#kb}
[![Keyboard disassembled](/static/kb.jpg)](/static/kb.jpg)

This is what the keyboard ribbon cable looks like. We decided to keep the
keyboard connected, just completely folded.

### Computer folded {#folded}
[![Folded](/static/folded.jpg)](/static/folded.jpg)

The computer is then folded to look like a Tablet.

## Step 3: Necessary Softwares {#software}

This is the part where I am the most capable in, and the part where I really
helped.

We started to scoure the World Wide Web to find something to be a good
infotainment system.

### AGL: Automotive Grade Linux. {#agl}

The first thing which came up in my research was _Automotive Grade Linux
(AGL)_. This is a bunch of softwares which build a custom kernel and one can use
the library to create an interface.

To test it, I compiled the "sample". And launched it in _QEMU_.

It was both cool and underwhelming. The base interface made it _really_ clear
that using this library to construct a fully custom interface was **definitely
not** a one-day thing. More like a months long adventure in multiple programming
language from _C_ to _Python_ and promised a **lot** of recompiling kernels. 

Which even with my decent laptop, would be long, _very_ long.

So even if it looked good I decided to give up on it.

[Source: Automative Grade Linux Documentation](https://docs.automotivelinux.org/en/salmon/)

### Android Auto. {#aa}

While my dad was thinking and still searching on the web I decided to search for
something very particular.

Surely, someone, somewhere, would have managed to run [_Android Auto_](https://www.android.com/intl/en_gb/auto/) on a good old x86_64 computer right?

It turns out that *yes* someone did. And that someone, is [Google itself](https://developer.android.com/training/cars/testing/dhu).

So the last link open to the "Test" page. It was *originally* made to test
Android Auto applications in the development/integration phase.

But it turns out you can just connect it to a phone and using it like regular
old android auto. It works just like the real thing. Just need a couple _adb_
commands as well as a manipulation on the phone.

### Get the Android Auto Desktop Head Unit. {#aadhu}

There is only one way to get the Android Auto Desktop Head Unit, you need to
download the _whole_ Android SDK, through _Android Studio_. And then you need
to pick to download the _Desktop Head Unit (DHU)_. 

Once you do that, you get the DHU binary and one shared library in the following
path:

> $SDK_LOCATION/extras/google/auto/

You need both the 

> desktop_head_unit

Binary, as well as the 

> libusb.so 

Shared library.

### Run and connect the DHU to a Phone {#dhuphone}

You need to prepare the phone you're connecting to.

- First, you need to activate the _Android's Developer Settings_ on your phone.
- Then, you need to install _Android Auto_ if it's not already installed.
- Finally, you need to activate the _Android Auto's Developer Settings_ on the
  app.

If you follow all the steps from the Google Developer page you will have
everything you need to start the DHU.

Connect your phone via USB and just run

> ./desktop_head_unit \-\-usb

And... it didn't work for us. We tried multiple phones but it didn't work.

We needed to follow the rest of the page.

- You need to start the _Head Unit Server_ on your phone
- And you need to run a few commands on the computer host.

> adb forward tcp:5277 tcp:5277

> ./desktop_head_unit

Then you connect your phone on USB to the Computer.

And **~~ Voilà ~~**

It works! You have a fully functional Android Auto experience on a laptop.

## Extras {#extras}
Technically you could stop there. But it wouldn't work very well.

We performed a few more steps in order to improve the experience.
- First, we modified the authentificator to auto-log.
- Then, we modified the Xorg start script to automatically forward the ports,
  and launch the DHU.
- Finally, we made a MACRO on my dad's phone, to automatically start the _Head
  Unit Server_

## Enjoy {#enjoy}

### End of the build {#build}
[![End](/static/before_mounting.jpg)](/static/before_mounting.jpg)

The build at the end of the steps, the keyboard is folded behind the screen.

### Installation {#installation}
[![Installation](/static/mounted_one.jpg)](/static/mounted_one.jpg)

This is what it looks installed inside of our Panda.

[![In Action](/static/WIP.jpg)](/static/WIP.jpg)

This is still a Work In Progress. You can see we need to adjust the size of the
Android Auto window to match the size of the whole computer.

## Technical Issues {#issues}
Having the whole computer folded introduces a lot of issues, the biggest is
**overheating**. The computer is prone to overheat quickly. We have yet to find
a solution to this one.
