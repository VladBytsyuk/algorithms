-module(merge).
-export([sort/1]).


%% ================================================================================================
%% Exported functions
%% ================================================================================================

sort(_List = []) -> [];
sort(_List = [H]) -> [H];
sort(List) -> 
    {ListA, ListB} = splitIntoHalfs(List),
    SortedListA = sort(ListA),
    SortedListB = sort(ListB),
    merge(SortedListA, SortedListB, []).


%% ================================================================================================
%% Internal functions
%% ================================================================================================

merge(
    _ListA = [], 
    _ListB = [], 
    Accumulator
) -> Accumulator;

merge(
    _ListA = [AHead | ATail], 
    _ListB = [], 
    Accumulator
) -> merge(ATail, [], Accumulator ++ [AHead]);

merge(
    _ListA = [], 
    _ListB = [BHead | BTail], 
    Accumulator
) -> merge([], BTail, Accumulator ++ [BHead]);

merge(
    ListA = [AHead | _ATail], 
    _ListB = [BHead | BTail], 
    Accumulator
) when AHead > BHead -> merge(ListA, BTail, Accumulator ++ [BHead]);

merge(
    _ListA = [AHead | ATail], 
    ListB = [_BHead | _BTail], 
    Accumulator
) -> merge(ATail, ListB, Accumulator ++ [AHead]).

% -------------------------------------------------------------------------------------------------

splitIntoHalfs(_List = []) -> {[], []};

splitIntoHalfs(List) -> {
    takeFirst(List, round(erlang:length(List) / 2)),
    takeLast(List, trunc(erlang:length(List) / 2))
}.

% -------------------------------------------------------------------------------------------------

takeFirst(_List, _Count = 0) -> [];
takeFirst(_List = [], _Count) -> [];

takeFirst(
    _List = [Head | Tail], 
    Count
) -> [Head] ++ takeFirst(Tail, Count - 1).

% -------------------------------------------------------------------------------------------------

takeLast(List, Count) -> lists:reverse(takeFirst(lists:reverse(List), Count)).