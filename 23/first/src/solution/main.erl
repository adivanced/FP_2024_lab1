-module(main).

-export([main/0]).

get_divisor_sum(Div, I, Sum) ->
    if Div =< I / 2 ->
           REM = I rem Div,
           if REM == 0 ->
                  get_divisor_sum(Div + 1, I, Sum + Div);
              true ->
                  get_divisor_sum(Div + 1, I, Sum)
           end;
       true ->
           Sum
    end.

is_abundant(I) ->
    RES = get_divisor_sum(1, I, 0),
    if RES > I ->
           1;
       true ->
           0
    end.

get_abundants(I, Abundants, Limit) ->
    if I /= Limit ->
           ANSW = is_abundant(I),
           if ANSW == 1 ->
                  get_abundants(I + 1, lists:append(Abundants, [I]), Limit);
              true ->
                  get_abundants(I + 1, Abundants, Limit)
           end;
       true ->
           Abundants
    end.

get_abundants(Limit) ->
    Abundants = [],
    get_abundants(1, Abundants, Limit).

fill_set([_], [], Sumd, _) ->
    Sumd;
fill_set([_ | Ti], [], Sumd, Abstash) ->
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
    Abundants = get_abundants(28123),
    Sumd = sets:from_list([]),
    NewSumd = fill_set(Abundants, Abundants, Sumd, Abundants),
    sum_from_set(0, 1, 28123, NewSumd).

main() ->
    sum_of_not_abundant_sums_upto(28123).
