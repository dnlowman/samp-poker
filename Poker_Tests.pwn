#if defined RUN_TESTS
	#include "Game\GameStateTests.pwn"

    Pkr_InitialiseTests()
    {
		Pkr_InitialiseGameStateTests();
        return;
    }

#else
    #error Do not include this file unless you're running the tests.
#endif
