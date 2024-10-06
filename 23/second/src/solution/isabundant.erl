-module(isabundant).

-export([isabundant/2]).

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

isabundant(I, PPID) ->
    RES = get_divisor_sum(1, I, 0),
    if RES > I ->
           PPID ! {self(), I};
       true ->
           PPID ! {self(), 0}
    end.
