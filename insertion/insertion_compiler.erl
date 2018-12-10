-module(insertion_compiler).
-export([compile/0]).

compile() -> 
    compile:file(insertion),
    compile:file(insertion_test),
    compile:file(insertion_time),
    insertion_test:test(),
    insertion_time:run(),
    {ok, compile_all}.