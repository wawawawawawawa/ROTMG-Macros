#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd rotmg, realmofthemadgod
GroupAdd rotmg, AssembleeGameClient
GroupAdd rotmg, AGCLoader
GroupAdd rotmg, Realm of the Mad God
GroupAdd rotmg, Adobe Flash Player 

IfNotExist, macro.INI
{
	HealMeArray := ["Heal me please! I'm hurt!", "Could you press your spacebar, kind healer?", "I need some big heals over there!", "HP please!", "Heal me dude!", "Healer required here!", "I need some heals!", "Where are the priests, I need some healing!", "I could use some heals there :)", "Mind healing me guys?"]
	ThanksArray := ["Thank you Bro, it's really  appreciated ! <3", "You're nice, thanks a bunch! :D", "You have my gratitude, friend! Cheers :)", "Thanks mate!", "That's sweet, thanks :D", "That's nice of you, thanks!", "Many thanks!", "Thanks a lot!", "Cheers, mate :)", "Thanks you kind Sir!", "How sweet of you, thank you!", "Thank you for that!", "Wow, thanks!", "Thank you dude!"]
	GLArray := ["Good luck guys! Let's get that fat loot!", "Best of luck fellows!", "Good luck everyone!", "I can sense some whitebag there! :D", "Sorry for stealing the good loot guys :3", "Seems like it's gonna be 0 again xD", "Come on RNGesus, give me an EP now!", "Everyone ready for some fat 0 ? :D", "I feel this loot will be glorious!", "I'm afraid there won't be good loot there sadly :/", "You need loot? Then let's get some ! :D", "May the pixels be with you!", "Deca, I trust you in this one, don't disapoint me now!", "./spawn fat loot", "Looks like there's gonna be some good loot for everyone this time :)", "Are you all ready for some 0? :D", "GL guys, 0 incoming! :p", "Sorry for the bad loot guys :/", "Ready for some mark ? :p", "Whitebag incoming!", "I predict a lot of white bags in this one!", "Here comes some sweet loot!", "I can smell some fat pixels close by!", "Let's believe in the good loot!", "No need luck, I know we'll get pleased in this one :)", "This bag will contain all our dreams and hope for sure!", "Get ready to be pleased by that bag guys!", "My dream foretold me that this bag is gonna be divine!", "Apologize for crushing your souls guys, but this time I'm gonna be the lucky one :p", "Even though I won't be lucky, I know you guys will be in my stead, have fun :D", "Good luck and have fun!"]
	
	IniWrite, https://autohotkey.com/docs/KeyList.htm, macro.ini, Help, HotkeyList
	IniWrite, Numpad9, macro.ini, HotKey, Key
	
	for index, element in HealMeArray
	{
		IniRead, HealMe%A_index%, macro.ini, HealMe, Text%A_index%
		if HealMe%A_index% = ERROR
		{
			IniWrite, % HealMeArray[A_index], macro.ini, HealMe, Text%A_index%
		}
	}
	for index, element in ThanksArray
	{
		IniRead, ThanksArray%A_index%, macro.ini, Thanks, Text%A_index%
		if ThanksArray%A_index% = ERROR
		{
			IniWrite, % ThanksArray[A_index], macro.ini, Thanks, Text%A_index%
		}
	}
	for index, element in GLArray
	{
		IniRead, GLArray%A_index%, macro.ini, GoodLuck, Text%A_index%
		if GLArray%A_index% = ERROR
		{
			IniWrite, % GLArray[A_index], macro.ini, GoodLuck, Text%A_index%
		}
	}
}
else
{
	HealMeArray := []
	ThanksArray := []
	GLArray := []

	Loop
	{
		IniRead, HealMe%A_index%, macro.ini, HealMe, Text%A_index%
		if HealMe%A_index% != ERROR
		{
			HealMeArray.Push(HealMe%A_index%)
		}
		else
		{
			break
		}
	}
	Loop
	{
		IniRead, Thanks%A_index%, macro.ini, Thanks, Text%A_index%
		if Thanks%A_index% != ERROR
		{
			ThanksArray.Push(Thanks%A_index%)
		}
		else
		{
			break
		}
	}
	Loop
	{
		IniRead, GL%A_index%, macro.ini, GoodLuck, Text%A_index%
		if GL%A_index% != ERROR
		{
			GLArray.Push(GL%A_index%)
		}
		else
		{
			break
		}
	}
}


IniRead, Key, macro.ini, HotKey, Key
Hotkey, ~$%Key%, Macro

Macro:
{
	ifWinActive, ahk_group rotmg
	{
		if counter >= 0 ; setTimer already started, so we log the keypress instead
		{
			counter++
			return
		}
		counter = 0 ; Start setTimer and set the number of logged keypresses to 0
		setTimer,Wawakey, 400
	}
}
return

Wawakey:
{
	setTimer,Wawakey,off
	if counter = 0 ; The key is pressed once
	{
		Random, randomnum , 1, HealMeArray.MaxIndex()
		randomtext := % HealMeArray[randomnum]
		SendInput {Enter}{Raw}%randomtext%
		SendInput {Enter}
	}
	else if counter = 1 ; The key is pressed twice
	{
		Random, randomnum , 1, ThanksArray.MaxIndex()
		randomtext := % ThanksArray[randomnum]
		SendInput {Enter}{Raw}%randomtext%
		SendInput {Enter}
	}
	else if counter = 2 ; The key is pressed thrice
	{
		Random, randomnum , 1, GLArray.MaxIndex()
		randomtext := % GLArray[randomnum]
		SendInput {Enter}{Raw}%randomtext%
		SendInput {Enter}
	}
	counter = -1
}
return