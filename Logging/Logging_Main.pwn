#define POKER_LOG_PATH "scriptfiles/poker.log"
static const LOGGING_ADMIN_LEVEL = 1;
//static bool:gIsPokerDebug = true;

Pkr_Log(fstring[], {Float, _}:...)
{
    static const
        STATIC_ARGS = 1;
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

        sendFormatAdminWarn(LOGGING_ADMIN_LEVEL, COLOR_WHITE, message);
        ThreadW(POKER_LOG_PATH, message);
    }
    else
    {
        sendFormatAdminWarn(LOGGING_ADMIN_LEVEL, COLOR_WHITE, fstring);
        ThreadW(POKER_LOG_PATH, fstring);
    }
}
