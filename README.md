# good-old-windows-update

You are now dead  
The new updater are now carrying you to Heaven  
You had a good life

## What is this

A "old" style Windows update manager maybe, or actually just a set of scripts.  
These scripts intend to control Windows update in an understandable workflow.  
In case you care about how a software will modify your system.  
And how to revert back. Which is most other similar software don't.

## How to use

Check the wiki page before run any script.  
Some of them are one-way, you need to handle the backup manually if necessary,  
or reinstall related software to recover.

### Wu_RunOnce.ps1

After applying the `All_Disable`, this script is the most used one.  
It can temporarily enable Windows Update service,  
and disable Windows Update service after update is installed.

## Background

Until Windows 10 being a thing,  
we never realize that a PC could constantly reboot itself without confirm before.  
Thus most of the software have no response to the Windows reboot event.  
They just simply lose all status and running tasks.  
For example:

- Ancient service like `Minecraft server`
- 3D Rendering like `3DS Max`
- Video editing like `Premiere`, `MeGui`, `ffmpeg`
- Streaming like `OBS`

The consumer grade software world is based on a simple truth: PC won't reboot in an unexpected time.  
Even now, after I know Windows 10 will reboot,  
my every other software still not possible to get an update to support this "feature".  
I'm lacking money, time and interest, which is Microsoft nor anyone won't pay.

However, pick one of the popular solution also not my style.  
If a solution is close source, or go too big with its GUI, or no document...
