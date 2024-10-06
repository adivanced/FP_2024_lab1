-module(get_product).

-export([gp/2]).

gp(L, PPID) ->
    PPID ! {self(), lists:foldl(fun(X, Acc) -> X * Acc end, 1, L)}.
