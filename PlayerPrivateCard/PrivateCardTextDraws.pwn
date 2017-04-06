/*
                    	© Los Santos Role Play 2017
                       		Texas Hold 'em Poker

							Release Candidate 1
--------------------------------------------------------------------------------

Description:
    A complete Texas Hold 'em Poker mini-game
    for San Andreas Multiplayer.

--------------------------------------------------------------------------------

Author(s):
    Noble -
        Game scripting.
        San Andreas Multiplayer plugin port.

    Cactus Kev -
        Hand Evaluator
        (http://www.suffecool.net/poker/evaluator.html)

    Paul Senzee -
        Hash optimizations.

--------------------------------------------------------------------------------

Special Thanks:
    Los Santos Role Play development team.
    San Andreas Mutliplayer development team.
    Los Santos Role Play tester team.

--------------------------------------------------------------------------------

License:
	Please see the enclosed LICENSE file in the repository.

*/

Pkr_CreatePlayerPrivateCardTDs(const gameId, const playerSlot)
{
    new _iPlayerId = Pkr_GetPlayerId(gameId, playerSlot);

    switch(playerSlot)
	{
		case 0:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0] = CreatePlayerTextDraw(_iPlayerId, 202.000000, 266.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][0], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0] = CreatePlayerTextDraw(_iPlayerId, 234.000000, 266.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][0], 0);
		}

		case 1:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1] = CreatePlayerTextDraw(_iPlayerId, 150.000000, 203.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][1], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1] = CreatePlayerTextDraw(_iPlayerId, 182.000000, 203.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][1], 0);
		}

		case 2:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2] = CreatePlayerTextDraw(_iPlayerId, 202.000000, 140.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][2], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2] = CreatePlayerTextDraw(_iPlayerId, 234.000000, 140.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][2], 0);
		}

		case 3:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3] = CreatePlayerTextDraw(_iPlayerId, 376.000000, 140.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][3], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3] = CreatePlayerTextDraw(_iPlayerId, 408.000000, 140.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][3], 0);
		}

		case 4:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4] = CreatePlayerTextDraw(_iPlayerId, 433.000000, 203.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][4], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4] = CreatePlayerTextDraw(_iPlayerId, 465.000000, 203.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][4], 0);
		}

		case 5:
		{
			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5] = CreatePlayerTextDraw(_iPlayerId, 376.000000, 266.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][5], 0);

			g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5] = CreatePlayerTextDraw(_iPlayerId, 408.000000, 266.000000, "_");
			PlayerTextDrawBackgroundColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 255);
			PlayerTextDrawFont(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 4);
			PlayerTextDrawLetterSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 0.470000, 0.899999);
			PlayerTextDrawColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], -1);
			PlayerTextDrawSetOutline(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 0);
			PlayerTextDrawSetProportional(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 1);
			PlayerTextDrawSetShadow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 1);
			PlayerTextDrawUseBox(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 1);
			PlayerTextDrawBoxColor(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 255);
			PlayerTextDrawTextSize(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 30.000000, 40.000000);
			PlayerTextDrawSetSelectable(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][5], 0);
		}
	}

	PlayerTextDrawShow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][playerSlot]);
	PlayerTextDrawShow(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][playerSlot]);

	return;
}

Pkr_DestroyPlayerPrivateCardTDs(const gameId, const playerSlot)
{
    new _iPlayerId = Pkr_GetPlayerId(gameId, playerSlot);

    PlayerTextDrawDestroy(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][playerSlot]);
    PlayerTextDrawDestroy(_iPlayerId, g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][playerSlot]);

    g_rgPokerGames[gameId][PLAYER_PRIV_CARD_ONE_TEXTDRAW][playerSlot] = PlayerText:INVALID_TEXT_DRAW;
	g_rgPokerGames[gameId][PLAYER_PRIV_CARD_TWO_TEXTDRAW][playerSlot] = PlayerText:INVALID_TEXT_DRAW;

    return;
}
