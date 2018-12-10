-module(insertion_test).

-import(insertion, [sort/1]).

-include_lib("eunit/include/eunit.hrl").


%% ================================================================================================
%% Test functions
%% ================================================================================================

test(Actual, Expected) -> ?assert(Actual =:= Expected).

sortEmptyList_test() -> 
    SortedList = [],
    [
       test(sort([]), SortedList)
    ].


sortOneItemList_test() -> 
    SortedList = [1],
    [
        test(sort([1]), SortedList)
    ].


sortTwoItemsList_test() -> 
    SortedList = [1, 2],
    [
        test(sort([1, 2]), SortedList),
        test(sort([2, 1]), SortedList)
    ].


sortThreeItemsList_test() ->  
    SortedList = [1, 2, 3],
    [
        test(sort([1, 2, 3]), SortedList),
        test(sort([1, 3, 2]), SortedList),

        test(sort([2, 1, 3]), SortedList),
        test(sort([2, 3, 1]), SortedList),

        test(sort([3, 1, 2]), SortedList),
        test(sort([3, 2, 1]), SortedList)
    ].


sortFourItemsList_test() ->   
    SortedList = [1, 2, 3, 4],
    [
        test(sort([1, 2, 3, 4]), SortedList),
        test(sort([1, 2, 4, 3]), SortedList),
        test(sort([1, 3, 2, 4]), SortedList),
        test(sort([1, 3, 4, 2]), SortedList),
        test(sort([1, 4, 2, 3]), SortedList),
        test(sort([1, 4, 3, 2]), SortedList),

        test(sort([2, 1, 3, 4]), SortedList),
        test(sort([2, 1, 4, 3]), SortedList),
        test(sort([2, 3, 1, 4]), SortedList),
        test(sort([2, 3, 4, 1]), SortedList),
        test(sort([2, 4, 1, 3]), SortedList),
        test(sort([2, 4, 3, 1]), SortedList),

        test(sort([3, 1, 2, 4]), SortedList),
        test(sort([3, 1, 4, 2]), SortedList),
        test(sort([3, 2, 1, 4]), SortedList),
        test(sort([3, 2, 4, 1]), SortedList),
        test(sort([3, 4, 1, 2]), SortedList),
        test(sort([3, 4, 2, 1]), SortedList),

        test(sort([4, 1, 2, 3]), SortedList),
        test(sort([4, 1, 3, 2]), SortedList),
        test(sort([4, 2, 1, 3]), SortedList),
        test(sort([4, 2, 3, 1]), SortedList),
        test(sort([4, 3, 1, 2]), SortedList),
        test(sort([4, 3, 2, 1]), SortedList)
    ].