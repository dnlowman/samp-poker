#if defined RUN_TESTS

    #include "Pot\PotTests.pwn"
    #include "3DTextLabels\3DTextLabelsTests.pwn"
    #include "Background\BackgroundTests.pwn"
    #include "Blinds\BlindTests.pwn"
    #include "PlayerStatus\PlayerStatusTests.pwn"
    #include "PlayerReady\PlayerReadyTests.pwn"
    #include "Game\GameTests.pwn"
    #include "Game\GameStateTests.pwn"
    #include "Player\PlayerCmdsTests.pwn"

    Pkr_InitialiseTests()
    {
        Pkr_InitialisePotTests();
        Pkr_Initialise3DTextLabelsTests();
        Pkr_InitialiseBackgroundTests();
        Pkr_InitialiseBlindTests();
        Pkr_InitialisePlayerStatusTests();
        Pkr_InitialisePlayerReadyTests();
        Pkr_InitialiseGameTests();
        Pkr_InitialiseGameStateTests();
        Pkr_InitialisePlayerCmdsTests();
        return;
    }

#else
    #error Do not include this file unless you're running the tests.
#endif
