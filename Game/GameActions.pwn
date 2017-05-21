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

Pkr_PlayerConfirmBet(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
    Pkr_Log("%s confirmed the bet with $%d for GameId: %d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, player)), amount, gameId);
    Pkr_SetLastAggressivePlayer(gameId, player);
    Pkr_AddToPlayerBetContribution(gameId, player, amount);
    Pkr_AddToPlayerPotContribution(gameId, player, amount);
    Pkr_SetLastBet(gameId, amount);
    Pkr_AddToCurrentBet(gameId, amount);
    Pkr_SetPlayerStatusBet(gameId, player, amount);
    Pkr_SetAmountOfPlays(gameId, 1);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}


Pkr_PlayerConfirmRaise(const gameId, const player, const amount, const meetAmount)
{
    Pkr_AddToPot(gameId, meetAmount + amount);
    Pkr_MinusPlayerChips(gameId, player, meetAmount + amount);
    Pkr_Log("%s confirmed the raise with $%d for GameId: %d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, player)), meetAmount + amount, gameId);
    Pkr_AddToPlayerBetContribution(gameId, player, meetAmount + amount);
    Pkr_AddToPlayerPotContribution(gameId, player, meetAmount + amount);
    Pkr_SetLastAggressivePlayer(gameId, player);
    Pkr_SetLastBet(gameId, amount);
    Pkr_AddToCurrentBet(gameId, amount);
    Pkr_SetPlayerStatusRaised(gameId, player, amount);
    Pkr_SetAmountOfPlays(gameId, 1);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}

Pkr_PlayerConfirmCall(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
    Pkr_Log("%s confirmed the call with $%d for GameId: %d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, player)), amount, gameId);
    Pkr_AddToPlayerBetContribution(gameId, player, amount);
    Pkr_AddToPlayerPotContribution(gameId, player, amount);
    Pkr_IncAmountOfPlays(gameId);
    Pkr_SetPlayerStatusCalled(gameId, player, amount);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}

Pkr_PlayerCheckConfirm(const gameId, const player)
{
    Pkr_IncAmountOfPlays(gameId);
    Pkr_SetPlayerStatusChecked(gameId, player);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}
