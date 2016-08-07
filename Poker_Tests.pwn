#if defined RUN_TESTS

    #include "Pot\PotTests.pwn"
    #include "3DTextLabels\3DTextLabelsTests.pwn"
    #include "Background\BackgroundTests.pwn"
    #include "Blinds\BlindTests.pwn"

    Pkr_InitialiseTests()
    {
        Pkr_InitialisePotTests();
        Pkr_Initialise3DTextLabelsTests();
        Pkr_InitialiseBackgroundTests();
        Pkr_InitialiseBlindTests();
    }

#else
    #error Do not include this file unless you're running the tests.
#endif