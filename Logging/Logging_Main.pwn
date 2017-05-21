#define POKER_LOG_PATH "scriptfiles/poker.log"

#if defined POKER_DEBUG
    static const LOGGING_ADMIN_LEVEL = 1;
#endif

Pkr_Log(fstring[], {Float, _}:...)
{
    static const
        STATIC_ARGS = 1;
    new
        n = (numargs() - STATIC_ARGS) * BYTES_PER_CELL;
    if (n)
    {
        new
            message[256],
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
        #emit PUSH.C          256
        #emit PUSH.ADR         message

        n += BYTES_PER_CELL * 3;
        #emit PUSH.S          n
        #emit SYSREQ.C         format

        n += BYTES_PER_CELL;
        #emit LCTRL          4
        #emit LOAD.S.alt        n
        #emit ADD
        #emit SCTRL          4

        new Year, Month, Day, Hour, Minute, Second;
        getdate(Year, Month, Day);
        gettime(Hour, Minute, Second);
        format(message, 256, "%02d/%02d/%d %02d:%02d:%02d - %s\n", Day, Month, Year, Hour, Minute, Second, message);

        #if defined POKER_DEBUG
            sendFormatAdminWarn(LOGGING_ADMIN_LEVEL, COLOR_WHITE, message);
        #endif
        ThreadW(POKER_LOG_PATH, message);
    }
    else
    {
        new Year, Month, Day, Hour, Minute, Second;
        getdate(Year, Month, Day);
        gettime(Hour, Minute, Second);
        format(fstring, 256, "%02d/%02d/%d %02d:%02d:%02d - %s\n", Day, Month, Year, Hour, Minute, Second, fstring);

        #if defined POKER_DEBUG
            sendFormatAdminWarn(LOGGING_ADMIN_LEVEL, COLOR_WHITE, fstring);
        #endif
        ThreadW(POKER_LOG_PATH, fstring);
    }
}
