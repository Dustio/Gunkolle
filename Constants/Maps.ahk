#Include %A_ScriptDir%/Functions/Mouse.ahk

RunMap(x)
{
	if (x == "0_2")
	{
		0_2()
	}
	else if(x == "4_6_data")
	{
		4_6_data()
	}
	else if(x == "4_3E")
	{
		4_3E()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
	else if(x == "6_3N")
	{
		6_3N()
	}
	else if(x == "6_3N_airstrike")
	{
		6_3N_airstrike()
	}
	else if(x == "8_1N")
	{
		8_1N()
	}
	else if(x == "8_1N_airstrike")
	{
		8_1N_airstrike()
	}
	else if(x == "10_4E")
	{
		10_4E()
	}
	else if(x == "10_4Ecdo")
	{
		10_4Ecdo()
	}
	else if(x == "EmptyHouse")
	{
		EmptyHouse()
	}
}

WaitBattle()
{
	GuiControl,, NB, In Battle
	FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o30 Count1 n0 w30000,50")
	sleep 7500
	Loop
	{		
		Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
		if Found >= 1
		{
			GuiControl,, NB, Finished battle
			break
		}
		else
		{
			;Safex, Safey dont click in a valid position
			ClickS(700,400)
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				break
			}
		}
	}
}

WaitTurn(turn)
{
	Global
	GuiControl,, NB, Waiting Turn %turn%
	loop
	{
		Found := FindClick(A_ScriptDir "\pics\Turn" turn, "rLDPlayer mc o30 Count1 n0 w1000")
		if Found >= 1
		{
			break
		}
		else
		{
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				GuiControl,, NB, SF moving
			}
			else
			{
				WaitBattle()
			}	
		}		
	}
	GuiControl,, NB, G&K turn started
	TFindClick("Planning", "PlanningReady")
}

WaitExecution()
{
	Global
	loop
	{		
		Found := FindClick(A_ScriptDir "\pics\Planning", "rLDPlayer mc o30 Count1 n0 w5000")
		if Found >= 1
		{
			break
		}
		else
		{
			EndTurnFound := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n0 w1000")
			if EndTurnFound >= 1 
			{
				GuiControl,, NB, Executing Plan			
			}
			else
			{
				WaitBattle()
			}
		}		
	}
}

nodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,400)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

eventnodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

nodeboss(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		GuiControl,, NB, Waiting for next action
	}
}

;GoHome()
;{
;	Global
;	RetirementLoop := 1
;	loop, %RetirementLoop%
;	{
;		Found1 := 0
;		Found2 := 0
;		Found3 := 0
;		sleep 5000
;		while(Found1 == 0 && Found2 == 0)
;		{
;			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
;			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rLDPlayer mc o40 Count1 n0")
;			if (Found1 >= 1 or Found2 >= 1)
;			{
;
;			}
;			else
;			{
;				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
;				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
;				if FoundExp >= 1
;				{
;					RetirementLoop++
;				}
;				ClickS(Homex+52,Homey)
;			}
;			GuiControl,, NB, %found1% %found2% %found3% 
;		}
;	}
;}

GoHome()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
				;Found3 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\Login03", "rLDPlayer mc o40 Count1 n0")
				if FoundLogin >= 1
					{
						GuiControl,, NB, Login Collect Found
						TFindClick("Login03","Login04")
						sleep 500
						TFindClick("Login04","Login05")
						sleep 500
						RFindClick("Login05", "rLDPlayer mc o50 w30000,50")
					}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					sleep 1000
					RetirementLoop++
				}
				ClickS(765, 130)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

GoHomeEvent()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\Login03", "rLDPlayer mc o40 Count1 n0")
				if FoundLogin >= 1
					{
						GuiControl,, NB, Login Collect Found
						TFindClick("Login03","Login04")
						sleep 500
						TFindClick("Login04","Login05")
						sleep 500
						RFindClick("Login05", "rLDPlayer mc o50 w30000,50")
					}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(165, 328)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

0_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(725, 430)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	ClickS(649, 401)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport
	sleep 500
	ClickS(455, 395)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport
	sleep 2000
	ClickS(455, 395)
	sleep 200
	ClickS(455, 395)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1000
	ClickS(649, 401)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(582, 99)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(814, 115)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\Maps\0_2\CriticallyDamaged", "rLDPlayer mc o30 Count1 n0 w2500,50")
	if(Found == 1)
	{
		RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "rLDPlayer mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "rLDPlayer mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "rLDPlayer mc")
		RFindClick("RepairOK", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairQuick", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairConfirm", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("RepairReturn", "rLDPlayer mc o50 w30000,50")
	}
	Found := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n1 w1000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n1 w250,50")
	GoHome()
}

4_6_data()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2800
		DragDownToUp(500, 675, 350)
		sleep 500
		ClickS(750, 625)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Loop, 9
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		sleep 1500
		GuiControl,, NB, CommandPost
		ClickS(842, 400)
		sleep 1200
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0")
		if (Found == 0)
		{
			ClickS(842, 400)
			sleep 500
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		GuiControl,, NB, Heliport
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		ClickS(868, 46)
		sleep 1000
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		sleep 2000
		ClickS(868, 46)
		GuiControl,, NB, Node1
		sleep 500
		ClickS(858, 109)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 109)
					sleep 200
					ClickS(858, 109)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					RFindClick("TerminateRestart", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 185)
					sleep 500
					ClickS(810, 185)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 185)
		sleep 150
		ClickS(810, 185)
		sleep 1500
		GuiControl,, NB, Node3
		ClickS(745, 233)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(745, 233)
					sleep 200
					ClickS(745, 233)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					RFindClick("TerminateRestart", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(818, 260)
		sleep 150
		ClickS(818, 260)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(818, 260)
					sleep 200
					ClickS(818, 260)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					RFindClick("TerminateRestart", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}		
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 250
		TFindClick("Terminate","TerminateRestart")
		sleep 750
		RFindClick("TerminateRestart", "rLDPlayer mc o50 w30000,50")
		sleep 500
		Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "rLDPlayer mc o30 Count1 n1 w500,50")
	}
	Loop, 1
	{
		GuiControl,, NB, Last reset
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		sleep 1500
		GuiControl,, NB, CommandPost
		ClickS(842, 400)
		sleep 1200
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0")
		if (Found == 0)
		{
			ClickS(842, 400)
			sleep 500
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		GuiControl,, NB, Heliport
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		ClickS(868, 46)
		sleep 1000
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		sleep 2000
		ClickS(868, 46)
		GuiControl,, NB, Node1
		sleep 500
		ClickS(858, 109)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 109)
					sleep 200
					ClickS(858, 109)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 185)
					sleep 500
					ClickS(810, 185)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 185)
		sleep 150
		ClickS(810, 185)
		sleep 1500
		GuiControl,, NB, Node3
		ClickS(745, 233)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(745, 233)
					sleep 200
					ClickS(745, 233)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(818, 260)
		sleep 150
		ClickS(818, 260)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(818, 260)
					sleep 200
					ClickS(818, 260)
					sleep 2000
					ClickTilGone("\Maps\4_6\CombatPause", " rLDPlayer mc o75 w30000,50 sleep1000")
					sleep 500
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "rLDPlayer mc o40 Count1 n1 w250")
					sleep 250
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
					continue
				}		
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 250
		TFindClick("Terminate","TerminateOK")
		sleep 750
		RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
		sleep 500
		Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
	}
	GoHome()
}

4_3E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(725, 548)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport
	sleep 1500
	ClickS(855, 460)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	ClickS(434, 400)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	ClickS(434, 400)
	sleep 200
	ClickS(434, 400)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, Heliport
	sleep 1000
	ClickS(855, 460)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(838, 126)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(4)
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\Maps\4_3E\CriticallyDamaged", "rLDPlayer mc o30 Count1 n0 w2500,50")
	if(Found == 1)
	{
		RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "rLDPlayer mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "rLDPlayer mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "rLDPlayer mc")
		RFindClick("RepairOK", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairQuick", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairConfirm", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("RepairReturn", "rLDPlayer mc o50 w30000,50")
	}
	Found := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n1 w1000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n1 w250,50")
	GoHome()
}

5_4_friendly()
{
	Global
	GuiControl,, NB, MapSelect
	sleep 2000
	ClickS(716, 664)
	RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	if Found >= 1
	{
	}
	Else
	{
		GuiControl,, NB, Can't find map, Paused.
		Pause
	}
	while (true)
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, CommandPost
		sleep 2000
		ClickS(840, 330)
		sleep 500
		RFindClick("OK", "rLDPlayer mc o10 w30000,50")
		sleep 500
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport1
		sleep 2000
		ClickS(425, 350)
		sleep 1000
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		sleep 500
		RFindClick("OK", "rLDPlayer mc o20 w30000,50")
		GuiControl,, NB, Heliport2
		sleep 1000
		ClickS(425, 560)
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		sleep 500
		RFindClick("OK", "rLDPlayer mc o20 w30000,50")
		sleep 500
		TFindClick("Terminate","TerminateRestart")
		sleep 500
		ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	}
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
			sleep 500
			TFindClick("Terminate","TerminateRestart")
			sleep 500
			ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
		}
}

6_3N()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(715, 550)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(522, 372)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 1500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	GuiControl,, NB, Heliport2
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 1000
	ClickS(750, 378)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(706, 425)
	sleep 1000
	RFindClick("\Maps\6_3N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	ClickS(706, 425)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateRestart")
	sleep 500
	ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 2000
	ClickS(522, 372)
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 1500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	GuiControl,, NB, Heliport2
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 1000
	ClickS(750, 378)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(706, 425)
	sleep 1000
	RFindClick("\Maps\6_3N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	ClickS(706, 425)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	GuiControl,, NB, Heliport2
	ClickS(695, 370)
	sleep 1000
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon2", "rLDPlayer mc o30 w2000,50")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o30 w30000,50")
	sleep 1000
	GuiControl,, NB, Echelon2
	ClickS(706, 425)
	sleep 500
	ClickS(706, 425)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	GuiControl,, NB, Echelon2
	ClickS(706, 425)
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

6_3N_airstrike()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(715, 550)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	Loop, 4
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
		Found := FindClick(A_ScriptDir "\Maps\6_3N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
		GuiControl,, NB, Heliport
		ClickS(522, 372)
		sleep 500
		RFindClick("OK", "rLDPlayer mc o5 w30000,50")
		sleep 500
		RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		GuiControl,, NB, Heliport
		ClickS(522, 372)
		sleep 500
		RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
		GuiControl,, NB, Plan
		sleep 500
		ClickS(750, 378)
		sleep 500
		RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
		nodes(1)
		Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
		nodes(1)
		sleep 500
		TFindClick("Terminate","TerminateRestart")
		sleep 500
		ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\Maps\6_3N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
	if(Found == 1)
	{
		RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
		GuiControl,, NB, Fairy command is low, Paused
		pause
	}
	GuiControl,, NB, Heliport
	ClickS(522, 372)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
	if(Found == 1)
	{
		GuiControl,, NB, Max equipment, Paused
		pause
	}
	GuiControl,, NB, Heliport
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

8_1N()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(820, 315)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(412, 480)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	GuiControl,, NB, Heliport2
	ClickS(850, 478)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	GuiControl,, NB, Heliport3
	ClickS(442, 225)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 1500
	GuiControl,, NB, Echelon1
	ClickS(485, 365)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(442, 300)
	sleep 1000
	RFindClick("\Maps\8_1N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	ClickS(442, 300)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 1000
	ClickS(886, 575)
	GuiControl,, NB, Echelon2
	ClickS(850, 549)
	sleep 200
	ClickS(850, 549)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(850, 549)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
	GoHome()
}

8_1N_airstrike()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(820, 315)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand2", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(412, 480)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateRestart")
	sleep 500
	RFindClick("TerminateRestart", "rLDPlayer mc o50 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "rLDPlayer mc o30 Count1 n1 w500,50")
	sleep 1000
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand2", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(412, 480)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
	GoHome()
}

10_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(720, 660)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	loop, 1
	{
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(486, 232)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	ClickS(576, 397)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport2
	sleep 500
	ClickS(855, 737)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	ClickS(576, 397)
	sleep 200
	ClickS(576, 397)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 500
	ClickS(576, 397)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport1
	sleep 500
	ClickS(486, 175)
	sleep 1000
	ClickS(486, 232)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(420, 330)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(570, 196)
	GuiControl,, NB, Plan3
	sleep 500
	ClickS(626, 234)
	GuiControl,, NB, Plan4
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	GuiControl,, NB, Heliport1
	sleep 15000
	Found := FindClick(A_ScriptDir "\pics\Maps\10_4E\CriticallyDamaged", "rLDPlayer mc o30 Count1 n0 w1500,50")
	if(Found == 1)
	{
		ClickS(486, 398)
		sleep 200
		ClickS(486, 398)
		sleep 500
		RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
		sleep 500
		RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
		sleep 500
		TFindClick("Terminate","TerminateOK")
		sleep 500
		TFindClick("Terminate","TerminateOK")
		sleep 500
		RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
		sleep 500
		Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "rLDPlayer mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "rLDPlayer mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "rLDPlayer mc")
		RFindClick("RepairOK", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairQuick", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairConfirm", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("RepairReturn", "rLDPlayer mc o50 w30000,50")
		continue
	}
	ClickS(486, 398)
	sleep 200
	ClickS(486, 398)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
	GoHome()
	}
}

10_4Ecdo()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(720, 660)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	loop, 1
	{
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(486, 232)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	ClickS(576, 397)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport2
	sleep 500
	ClickS(855, 737)
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport1
	sleep 2000
	ClickS(486, 232)
	sleep 200
	ClickS(486, 232)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(420, 330)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(570, 196)
	GuiControl,, NB, Plan3
	sleep 500
	ClickS(626, 234)
	GuiControl,, NB, Plan4
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	GuiControl,, NB, Heliport1
	sleep 15000
	Found := FindClick(A_ScriptDir "\pics\Maps\10_4E\CriticallyDamaged", "rLDPlayer mc o30 Count1 n0 w1500,50")
	if(Found == 1)
	{
		ClickS(486, 398)
		sleep 200
		ClickS(486, 398)
		sleep 500
		RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
		sleep 500
		RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
		sleep 500
		TFindClick("Terminate","TerminateOK")
		sleep 500
		TFindClick("Terminate","TerminateOK")
		sleep 500
		RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
		sleep 500
		Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "rLDPlayer mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "rLDPlayer mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "rLDPlayer mc")
		RFindClick("RepairOK", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairQuick", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairConfirm", "rLDPlayer mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("RepairReturn", "rLDPlayer mc o50 w30000,50")
		continue
	}
	ClickS(486, 398)
	sleep 200
	ClickS(486, 398)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	RFindClick("TerminateOK", "rLDPlayer mc o50 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\TerminateOK", "rLDPlayer mc o30 Count1 n1 w500,50")
	}
	GoHome()
}

EmptyHouse()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\Photo\Photo", "rLDPlayer mc o30 w30000,50")
		FindClick(A_ScriptDir "\pics\Maps\Photo\EventPage", "rLDPlayer mc o50 Count1 n0 w30000,50")
		RFindClick("\Maps\Photo\EmptyHouse", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\Photo\ConfirmStart", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	ClickS(628, 398)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	ClickS(628, 398)
	sleep 200
	ClickS(628, 398)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(471, 314)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(628, 209)
	GuiControl,, NB, Plan3
	sleep 500
	ClickS(786, 314)
	GuiControl,, NB, Plan4
	sleep 500
	ClickS(700, 312)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	eventnodes(3)
	sleep 10000
	FoundNode := FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o50 n0 Count1 w8000,50")
	if(FoundNode == 1)
		{
			GuiControl,, NB, Waiting for end of combat
			FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 Count1 n0 w30000,50")
			sleep 6000
		}
	GuiControl,, NB, Waiting for next action
	GoHomeEvent()
}