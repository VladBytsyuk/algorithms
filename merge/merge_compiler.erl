-module(merge_compiler).
-export([compile/0]).

compile() -> 
    compile:file(merge),
    compile:file(merge_test),
    compile:file(merge_time),
    merge_test:test(),
    merge_time:run(),
    {ok, compile_all}.