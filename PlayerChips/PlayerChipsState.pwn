stock Pkr_SetPlayerChips(const gameId, const slot, const amount) {
    g_rgPokerGames[gameId][PLAYER_CHIPS][slot] = amount;
    new _chips[128];
    format(_chips, sizeof(_chips), "CHIPS: ~g~$%s", Pkr_FormatNumber(amount));
    Pkr_SetPlayerChipsTextDraw(gameId, slot, _chips);
}

stock Pkr_ReturnAverageChips(const gameId) {
    new _total = 0;
    new _playerCount = 0;
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) {
        if(g_rgPokerGames[gameId][PLAYERS][_i] != INVALID_PLAYER_ID) {
            _total += g_rgPokerGames[gameId][PLAYER_CHIPS][_i];
            _playerCount++;
        }
    }

    return (_playerCount == 0) ? 0 : _total / _playerCount;
}
