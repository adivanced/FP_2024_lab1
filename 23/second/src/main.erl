-module(main).

-export([main/0]).
-import(isabundant, [isabundant/2]).

get_abundants(PIDS, Limit) ->
    if Limit /= 0 ->
           NEWPIDS = lists:append(PIDS, [spawn(isabundant, isabundant, [Limit, self()])]),
           get_abundants(NEWPIDS, Limit - 1);
       true ->
           PIDS
    end.

parse_pids(Abundants, []) ->
    Abundants;
parse_pids(Abundants, [H | T]) ->
    receive
        {H, VAL} ->
            VAL
    end,
    if VAL /= 0 ->
           parse_pids(lists:append(Abundants, [VAL]), T);
       true ->
           parse_pids(Abundants, T)
    end.

fill_set([_], [], Sumd, _) ->
    Sumd;
fill_set([_Hi | Ti], [], Sumd, Abstash) ->
    fill_set(Ti, Abstash, Sumd, Abstash);
fill_set([Hi | Ti], [Hj | Tj], Sumd, Abstash) ->
    K = Hi + Hj,
    if K < 28123 ->
           fill_set([Hi | Ti], Tj, sets:add_element(K, Sumd), Abstash);
       true ->
           fill_set([Hi | Ti], Tj, Sumd, Abstash)
    end.

sum_from_set(Sum, I, Limit, Set) ->
    if I /= Limit ->
           Flag = sets:is_element(I, Set),
           if Flag == false ->
                  sum_from_set(Sum + I, I + 1, Limit, Set);
              true ->
                  sum_from_set(Sum, I + 1, Limit, Set)
           end;
       true ->
           Sum
    end.

sum_of_not_abundant_sums_upto(28123) ->
    PIDSABUNDANTS = get_abundants([], 28123),
    Abundants = parse_pids([], PIDSABUNDANTS),
    Sumd = sets:from_list([]),
    NewSumd = fill_set(Abundants, Abundants, Sumd, Abundants),
    sum_from_set(0, 1, 28123, NewSumd).

main() ->
    sum_of_not_abundant_sums_upto(28123).
