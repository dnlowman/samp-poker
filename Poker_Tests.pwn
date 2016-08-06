#if defined RUN_TESTS

    #include "Pot\PotTests.pwn"

    Pkr_InitialiseTests()
    {
        Pkr_InitialisePotTests();
    }

#else
    #error Do not include this file unless you're running the tests.
#endif
