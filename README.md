Gunkolle - Automated expedition checker 
--



```
>scripting
>kuso ttk
```

## Requirements: 

Running from source
* AHK (http://ahkscript.org/ or https://autohotkey.com/)
* Gdip_All library by tic (included)
* findclick library by berban (also included)
* Mouse library by fnzr (included)
* playing at 1280 x 720 res
* Both NVIDIA and AMD graphics cards are working, but AMD users might need to replace some pics. 
* Latest version of LDPlayer should work fine (3.76) but older versions work too.
* Newer versions of LDPlayer are rumored to have a cryptominer, so use old version or delete fynews.exe, fyservice.exe in ld player directory, and delete fyservice from services via admin CMD - type "SC DELETE fyservice".
* Default background in main menu.
* Using the uncensored pics via recipe (522/320/404/137).
* Using old apk before the V2.0410 Optional Client Update for now. https://reddit.com/r/girlsfrontline/comments/e3n7dt/all_the_design_issuesbugs_with_the_new_optional/
* There is a branch for the new client, but I get idle crashes using it.

THIS SCRIPT IS ONLY TESTED AND MAINTAINED ON WIN8.1 AND WIN10. I may be unable to help you on any other version.

## Features:

* Background scripting (cannot be minimized)
* Dynamic pixel checking to prevent user error
* Can be set up to pause/resume at a certain time
* All clicks have randomness to avoid click tracking
* Can run for 24 hours, even skipping the daily login messages! (running maps for long can cause game to lag/crash)

## What does not work at current state:
1. Auto-Factory check
2. Auto-Battle return
3. Combat simulation, batteries, time checks

## How to use: Gunkolle(Expeditions)
When starting Gunkolle make sure your android emulator is the active window when starting the script. (else you'll get an invald screen reading)

Dont do anything until you see the 'Ready' in the gui box.

Click expedition only and leave window open in background.

To use another emulator, add/create an entry in the config.ini file in the script directory. Use AU3_Spy Window Spy that is included with your AHK installation to determine the window properties.  As shown below (Two valid options are show, **PICK ONE**)-

```
[Variables]
WINID=ahk_class Qt5QWindowIcon
WINID=ahk_exe Nox.exe
```

You will also likely need to find and replace all existing mentions of LDPlayer in all functions for window to be found. Also the HWND needs replaced in Mouse.ahk. I know it works on LeapDroid and Nox, MuMu doesn't like FindClick when I last tried.

## How to use: Gunkolle(Sortie)
read the wiki

old old client example:

![lol](https://github.com/dice4321/Gunkolle/blob/master/uselesspics/lol32.gif)

## How to use: Pause Utility

Simple pause script that runs alongside Gunkolle.

Enter in config.ini under [Variables], PauseHr=22 , and PauseMn=22 to pause at 22:22.  Use 24 Hour format only. You may use PCSleep=1 to sleep the computer at that time as well.

Use ResumeHr and ResumeMn to have the script resume at a specific time. Can be omitted for pause functionality only. When resume is enabled, PCSleep will be ignored and expired timers will automatically be set to pause/resume 24 hours later.

## Making new maps:

If you're looking to edit/make your own maps in game you will  need a couple of things first. If you don't already have it, download notepad++ for editing. You will also need WindowSpy, which should be in your AHK folder.

Maps are located in the Constants folder, so right click on it and edit with notepad++.

To make a new map, here's how I would start. For this example I will make 4_3E for dragging.

1. Within the RunMap(x) function, you will see if/else statements. Copy any of the else statements and paste it at the end of RunMap so that it looks like the others.

Now replace the text 4_6_data with 4_3E.

2. Since I'm making 4_3E, I will copy another normal map like 0_2. Scroll down or ctrl-f for the 0_2() function and copy the whole thing. Then paste it afterwards as another function. You can start editing the pasted function and make it into 4_3E.

3. Making the map. Replace the text 0_2 with 4_3E, and make sure the name of the map you are making stays consistent. 

Next you will need to find coords for the map, so open WindowSpy and make sure LDPlayer is clicked on. The first ClickS coordinate is for selecting the map, so to find the coord you need, hover your mouse over where you want to click and hold ctrl or shift on your keyboard. Then on WindowSpy, under mouse position, copy the coordinates under "Window:" and paste them under the corresponding ClickS() coords for map select. Now your first click is done!

4. Leave Retirement stuff alone, and move onto when the map is loaded, here the first line will make sure a map is loaded by looking for the pic "Turn". After that, GuiControl is there to tell the user what the script is clicking with ClickS. 
You will use RFindClick to click on pics that are on all maps, like "OK" and "StartOperation". 
Sleep is to buffer for lag between clicks so the it doesn't click too fast; it pauses the script for milliseconds.

From here, look down the script and edit the clicks for the map you want to make using WindowSpy to find coords. ClickS has an offset of 10 pixels. Also you will be rearranging the order of a lot of these ClickS and RFindClick for the new map you are making, just do it as you are playing through the new map.

5. Once you are done editing the clicks and the map is ready to test, you need to lastly add the map to the Gui by editing Gunkolle.ahk. Once open, ctrf-f for 0_2 and you should see the map list. At the end of the list add your new map, seperating them like oldmap|newmap. 

6. Remember to save all then test the map. If you want to know more about FindClick options, look through FindClick.ahk. Might edit later with more info.

