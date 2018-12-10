-module(insertion).

-export([sort/1]).


%% ================================================================================================
%% Exported functions
%% ================================================================================================

sort(List) -> sort(List, []).


%% ================================================================================================
%% Internal functions
%% ================================================================================================

sort(_List = [], Accumulator) -> Accumulator;

sort(_List = [Head | Tail], Accumulator) -> sort(Tail, insertOrdered(Head, Accumulator)).

% -------------------------------------------------------------------------------------------------

insertOrdered(Item, _List = []) -> [Item];

insertOrdered(Item, _List = [Head | Tail]) when Item > Head -> [Head] ++ insertOrdered(Item, Tail);

insertOrdered(Item, List) -> [Item] ++ List.

