#if defined RUN_TESTS

    #include "Pot\PotTests.pwn"
    #include "Background\BackgroundTests.pwn"
    #include "Blinds\BlindTests.pwn"
    #include "PlayerStatus\PlayerStatusTests.pwn"
    #include "PlayerReady\PlayerReadyTests.pwn"
    #include "Game\GameTests.pwn"
    #include "Game\GameCmdsTests.pwn"
    #include "Game\GameStateTests.pwn"
    #include "Player\PlayerCmdsTests.pwn"

    Pkr_InitialiseTests()
    {
        Pkr_InitialisePotTests();
        Pkr_InitialiseBackgroundTests();
        Pkr_InitialiseBlindTests();
        Pkr_InitialisePlayerStatusTests();
        Pkr_InitialisePlayerReadyTests();
        Pkr_InitialiseGameTests();
        Pkr_InitialiseGameStateTests();
        Pkr_InitialisePlayerCmdsTests();
        Pkr_InitialiseGameCmdsTests();
        return;
    }

#else
    #error Do not include this file unless you're running the tests.
#endif
