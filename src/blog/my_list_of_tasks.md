{
  "published": "2025-10-04"
}
# Tasks, Agendas, and CalDav.
## Introduction {#introduction}
Hello!

Like many people I have a Nextcloud instance running on my main server (*Ambassador*). And it stores all my calendars.

You may say *all* your calendars Charlotte? How many does a girl need? Well at the moment I have three calendars. My main one is of course the default
*Personal* equipped by default for any Nextcloud account. I also have a *Work* calendar which, you guessed it, stores my work related events that I need
to access outside of my employer's network.

And finally I decided recently to start a private tutoring gig beside my main line of work. I am slowly constructing [the website (FR)](https://tutorat.me), which will be translated for international use, so I need a *Teaching* calendar, granted I could have used my *Personal* agenda but I wanted a clean one.

And I really wanted to have those events in my *waybar* so I can easily see which is my next task/event, and a list of events by hovering.

## State of the art {#sa}
Like a good developer, I am lazy, and I (correctly) guessed that someone had previously wanted their calendars in their cli, and I could use that to do a custom module for waybar.

It turns out it was even better than that. Someone had created [*nextmeeting*](https://github.com/chmouel/nextmeeting) which even arrived with its own waybar config and module.

So great, job done!

...However, at the moment I started this idea *nextmeeting* only supported Google Calendar through a CLI API Client. It didn't support CalDav, now it does, thanks to an issue I posted, and if I had been patient I would have used his way a week ago when I did it.

Next, I saw [*plann*](https://github.com/tobixen/plann) which is a CLI CalDav client, so I was happy. After reading the documentation I set out to create a script...

## First approach, plann. {#plann}
### The tool {#tool}
I needed to
- configure *plann*
- check for the list of events in the next X days (X was to be determined) and limit to 10
- somehow displaying the first event in waybar and the remainder in the tooltip.

I use *fish* as my daily driver for scripts, the script is probably very easily adaptable to bash, but now for reasons [that are yet to come](#nextmeeting) I won't update the script.

It turned out configuring *plann* was really easy you just need to write YAML in *calendar.conf* at the root of your *XDG_CONFIG* folder. After a bit of a struggle I finally ended up on this configuration for multiple agendas.
```yaml
default:
  caldav_url: https://cloud.faefox.dev/remote.php/dav/
  caldav_user: user
  caldav_pass: password
  calendar_url:
    - personal
    - teaching
```

After that I just had to use *plann*, some examples of commands include,
```fish
plann select list
```
To list every event in your calendars (even past one)
```fish
plann select --from $(date) list
```
To list every event *from* the current date and time.

### The Script {#script}
I wanted a script which listed the next ten events from the next 30 days, and returned a json string with the text from the first event, and the remainder in tooltip.

So I started experimenting with *plann*. The list of tasks is fairly easy after a bit of practice with this command
```fish
set list_of_tasks $(plann select --from $(date) --end $(date -d "+30 days") list | string collect)
```

As you see in this command we are selecting everything in the next 30 days (thanks to date and its easy parsing it's easily done) and we use the fish directive *string collect* to collect them into a big string.

With some manipulations we can obtain the first task
```fish
set task $(echo "$list_of_tasks" | head -n 1 | xargs)
```

Here we use *xargs* to trim the string, according to the ~~bible~~ Stack Overflow, this is the easiest method to trim a string in shell.

Then we can get the first 10 with this command
```fish
set list $(echo "$list_of_tasks" | head -n 10)
```

And job done!

...Almost

If we run this command we end up with a nightmare string which is impossible to parse, and can't be easily put into lines. Thankfully we have the fish directive *string join* which allows us to add a simple newline character to every line.

Thus the end script looks like this
```fish
$ cat nexttask
#!/usr/bin/fish
set list_of_tasks $(plann select --from $(date) --end $(date -d "+30 days") list | string collect)
set task $(echo "$list_of_tasks" | head -n 1 | xargs)
set list $(echo "$list_of_tasks" | head -n 10 | string join \\n )
echo "{\"text\":\"$task\",\"tooltip\":\"$list\"}"
```

### The Waybar module. {#plann-waybar}
Great! We have a json string ready for Waybar.

Writing a custom waybar module isn't hard, and it's not the focus of this article so please refer to the wiki for any information.

The module looked like this
```json
 "custom/tasks": {
    "format": "{}",
    "interval": 100,
    "exec": "/usr/bin/nexttask",
    "on-click": "alacritty --class floating -e fish -i -c calcure",
    "return-type": "json",
    "class": "tasks"
  },
```

*Calcure* is a great tool, but not the topic of this article, perhaps I will make an article on this topic one day.
If we test it we end up with this

[![waybar plann](/static/waybar_plann.png)](/static/waybar_plann.png)

Which is... okay I guess? If you're a *real* fan of ISO date it's cool. I like ISO date, it's my main date format, but it's not very user friendly.

## Come nextmeeting {#nextmeeting}
It turns out in the days which came after my issue to *nextmeeting* the author implemented CalDav in his CLI.
Which is great, but was a nightmare to configure.

If you're reading that at a later date, the bug is likely fixed, but as of 2025-10-04 T2000+0200 the author mixed *caldav-\** and *caldav_\** in the code meaning we need to configure *nextmeeting* with the latter, contrary to the README. I'm sure the author will quickly fix this little bug.
```
[nextmeeting]
caldav_url = "https://cloud.faefox.dev/remote.php/dav/calendars/charlotte/personal"
caldav_username = "charlotte"
caldav_password = "password"
caldav_lookahead_hours = 720
caldav_calendar="personal"
```

And now we know the biggest downside to this approach, it only is possible to sync *one* calendar at a time. I opened an issue to ask for multiple calendars support. I'll update you when that evolves.

But now we can just use *nextmeeting* as if we were using a Google Calendar, the documentation is good.
The results speak for themselves in term of user friendly-ness

[![waybar nextmeeting](/static/waybar_nextmeeting.png)](/static/waybar_nextmeeting.png)
[![tooltip nextmeeting](/static/tooltip_nextmeeting.png)](/static/tooltip_nextmeeting.png)

## Afterwords {#after}
Thank you for reading this (*really*) nerdy post on CalDav synchronisation and status bars.

I will profit from this new article to announce that I moved everything writing related to a new domain, [analgesia.icu](https://analgesia.icu), why? Mostly because (Painkillers) (Dot) (Intensive Care Unit) was too much fun to pass.

See you next time,

Cheers,

Charlotte.
