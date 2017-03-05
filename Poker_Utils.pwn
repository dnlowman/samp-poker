#if !defined BYTES_PER_CELL
    #define BYTES_PER_CELL (cellbits / 8)
#endif

stock Pkr_FormatNumber(number)
{
	new _str[128];
	format(_str, sizeof(_str), "%i", number);
	new _len = strlen(_str);
	if(_len > 3)
	{
		new _i;
		if(_len >= 4) _i = 1;
		if(_len >= 5) _i = 2;
		if(_len >= 6) _i = 3;
		if(_len >= 7) _i = 1;
		if(_len >= 8) _i = 2;
		if(_len >= 9) _i = 3;

		while(_i < _len)
		{
			strins(_str, ",", _i);
			_i += 4;
		}
	}
	return _str;
}

stock Pkr_GetClientName(playerid) {
    new _name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, _name, sizeof(_name));
    return _name;
}

#if !defined POKER_LSRP
GetPlayerRealMoney(playerid) {
    #pragma unused playerid
    return 1000000;
}
#endif

new cardMap[13] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1 };

stock Pkr_ReturnCardSpriteName(value)
{
	new
		spriteName[16],
		val = ((value >> 8) & 0xF);

	if(value & 0x8000) format(spriteName, sizeof(spriteName), "LD_CARD:cd%ic", cardMap[val]);
	else if(value & 0x4000) format(spriteName, sizeof(spriteName), "LD_CARD:cd%id",  cardMap[val]);
	else if(value & 0x2000) format(spriteName, sizeof(spriteName), "LD_CARD:cd%ih", cardMap[val]);
	else format(spriteName, sizeof(spriteName), "LD_CARD:cd%is", cardMap[val]);
	return spriteName;
}

stock PkrSys_ReturnRandomUnusedCard(const gameId)
{
	new _f, _c, _i;
	do
	{
		_f = 0;
		_c = random(52);
		for(_i = 0; _i < MAX_TABLE_CARDS; ++_i) if(g_rgCardDeck[_c] == g_rgPokerGames[gameId][TABLE_CARD_VALUES][_i]) ++_f;
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i) if(g_rgCardDeck[_c] == g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][_i] || g_rgCardDeck[_c] == g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][_i]) ++_f;
	}
	while(_f > 0);
	return _c;
}

Pkr_IsNumeric(const string[])
{
    for(new i = 0, j = strlen(string); i < j; i++) if (string[i] > '9' || string[i] < '0') return 0;
    return 1;
}

stock Pkr_HandRank(const value)
{
	if(value > 6185) return HIGH_CARD;
	if(value > 3325) return ONE_PAIR;
	if(value > 2467) return TWO_PAIR;
	if(value > 1609) return THREE_OF_A_KIND;
	if(value > 1599) return STRAIGHT;
	if(value > 322) return FLUSH;
	if(value > 166) return FULL_HOUSE;
	if(value > 10) return FOUR_OF_A_KIND;
	return STRAIGHT_FLUSH;
}

stock Pkr_ReturnHandName(const rank)
{
	new _sz[128] = "ERROR_NO_NAME";
	switch(rank)
	{
		case (HAND_TYPES: HIGH_CARD): format(_sz, sizeof(_sz), "High Card");
		case (HAND_TYPES: ONE_PAIR): format(_sz, sizeof(_sz), "One Pair");
		case (HAND_TYPES: TWO_PAIR): format(_sz, sizeof(_sz), "Two Pair");
		case (HAND_TYPES: THREE_OF_A_KIND): format(_sz, sizeof(_sz), "Three of a Kind");
		case (HAND_TYPES: STRAIGHT): format(_sz, sizeof(_sz), "Straight");
		case (HAND_TYPES: FLUSH): format(_sz, sizeof(_sz), "Flush");
		case (HAND_TYPES: FULL_HOUSE): format(_sz, sizeof(_sz), "Full House");
		case (HAND_TYPES: FOUR_OF_A_KIND): format(_sz, sizeof(_sz), "Four of a Kind");
		case (HAND_TYPES: STRAIGHT_FLUSH): format(_sz, sizeof(_sz), "Straight Flush");
	}
	return _sz;
}

Pkr_SendGameMessage(const gameId, const color, const message[])
{
	Pkr_ForeachPlayer(player)
		if(g_rgPokerGames[gameId][PLAYERS][player] != INVALID_PLAYER_ID)
			SendClientMessage(g_rgPokerGames[gameId][PLAYERS][player], color, message);

	Pkr_ForeachPlayerIdInPool(playerId)
        if(GetPVarType(playerId, POKER_SPECTATE_VAR_NAME) != PLAYER_VARTYPE_NONE && GetPVarInt(playerId, POKER_SPECTATE_VAR_NAME) == gameId)
			SendClientMessage(playerId, color, message);

    return;
}

Pkr_SendFormattedGameMessage(const gameId, const color, fstring[], {Float, _}:...)
{
    static const
        STATIC_ARGS = 3;
    new
        n = (numargs() - STATIC_ARGS) * BYTES_PER_CELL;
    if (n)
    {
        new
            message[144],
            arg_start,
            arg_end;
        #emit CONST.alt        fstring
        #emit LCTRL          5
        #emit ADD
        #emit STOR.S.pri        arg_start

        #emit LOAD.S.alt        n
        #emit ADD
        #emit STOR.S.pri        arg_end
        do
        {
            #emit LOAD.I
            #emit PUSH.pri
            arg_end -= BYTES_PER_CELL;
            #emit LOAD.S.pri      arg_end
        }
        while (arg_end > arg_start);

        #emit PUSH.S          fstring
        #emit PUSH.C          128
        #emit PUSH.ADR         message

        n += BYTES_PER_CELL * 3;
        #emit PUSH.S          n
        #emit SYSREQ.C         format

        n += BYTES_PER_CELL;
        #emit LCTRL          4
        #emit LOAD.S.alt        n
        #emit ADD
        #emit SCTRL          4

        Pkr_SendGameMessage(gameId, color, message);
        return;
    }
    else
    {
        Pkr_SendGameMessage(gameId, color, fstring);
        return;
    }
}
