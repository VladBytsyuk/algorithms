-module(insertion_time).

-export([run/0, run/1]).


%% ================================================================================================
%% Exported functions
%% ================================================================================================

run() -> run(1000).
run(N) -> runForList(lists:reverse(lists:seq(1, N))).


%% ================================================================================================
%% Internal functions
%% ================================================================================================

runForList(List) -> 
    AverageSortingTime = averageSortingTime(List),
    io:format("Average sorting time of ~p elements list in descending order = ~p ms.~n", [erlang:length(List), AverageSortingTime]).  

% -------------------------------------------------------------------------------------------------

averageSortingTime(List) ->
    IterationsCount = 500,
    CompositeSortingTime = compositeSortingTime(List, IterationsCount),
    round(CompositeSortingTime / IterationsCount).

% -------------------------------------------------------------------------------------------------

compositeSortingTime(_List, _Count = 0) -> 0;

compositeSortingTime(List, Count) ->
    {ReadTime, _} = timer:tc(insertion, sort, [List]),
    CurrentSortingTime = ReadTime / 1000,
    CurrentSortingTime + compositeSortingTime(List, Count - 1). 