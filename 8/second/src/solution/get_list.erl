-module(get_list).

-export([get_digit_list/2]).

get_digit_list(L, PPID) ->
    PPID
    ! {self(),
       lists:map(fun(X) ->
                    {K, _} = string:to_integer([X]),
                    K
                 end,
                 integer_to_list(L))}.        %io:fwrite(integer_to_list(L)).
