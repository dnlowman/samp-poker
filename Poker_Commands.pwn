Pkr_RouteCommands(playerid, cmdtext[])
{
    new command[16];
    new parameters[112];
    sscanf(cmdtext, "s[16]s[112]", command, parameters);

    if(strcmp("create", command) == 0) PkrCMD_Create(playerid);
    else if(strcmp("addbot", command) == 0) PkrCMD_AddBot(playerid, parameters);
    else if(strcmp("removebot", command) == 0) PkrCMD_RemoveBot(playerid, parameters);
    else if(strcmp("join", command) == 0) PkrCMD_Join(playerid);
    else if(strcmp("leave", command) == 0) PkrCMD_Leave(playerid);
	//else if(strcmp("leave", cmdtext) == 0) pkrleave(playerid);
	else if(strcmp("mouse", command) == 0) PkrCMD_Mouse(playerid);
    else if(strcmp("start", command) == 0) PkrCMD_Start(playerid);
	else if(strcmp("nexthand", command) == 0) PkrCMD_NextHand(playerid);
	//else if(strcmp("nexthand", cmdtext) == 0) pkrnexthand(playerid);
	//else if(strcmp("spec", cmdtext) == 0) pkrspectate(playerid);
	//else if(strcmp("cam", cmdtext) == 0) pkrcam(playerid);
	//else if(strcmp("camin", cmdtext) == 0) pkrzoomin(playerid);
	//else if(strcmp("camout", cmdtext) == 0) pkrzoomout(playerid);
    //else if(strcmp("kick", cmdtext, .length = 4) == 0) pkrkick(playerid, cmdtext);
    //else if(strcmp("stand", cmdtext) == 0) pkrstandup(playerid);
	//else if(strcmp("sit", cmdtext) == 0) pkrsitdown(playerid);
    //else if(strcmp("addbot", cmdtext) == 0) pkraddbot(playerid);
    //else if(strcmp("allready", cmdtext) == 0) pkrallready(playerid);
    //else if(strcmp("checknext", cmdtext) == 0) pkrchecknextplayer(playerid);
	//else pkrhelp(playerid);
	return 1;
}

CMD:pkr(playerid, cmdtext[])
{
	Pkr_RouteCommands(playerid, cmdtext);
	return 1;
}

CMD:poker(playerid, cmdtext[])
{
	Pkr_RouteCommands(playerid, cmdtext);
	return 1;
}
