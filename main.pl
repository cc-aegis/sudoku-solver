:- use_module(library(clpfd)).

sudoku(S) :-
    % general layout
    length(S, 9),
    maplist(same_length(S), S),
    maplist(valid_sodoku_nums, S),
    append(S, Vs),
    Vs ins 1..9,
    % content requirements
    transpose(S, T),
    maplist(valid_sodoku_nums, T),
    [R1, R2, R3, R4, R5, R6, R7, R8, R9] = S,
    valid_boxes(R1, R2, R3),
    valid_boxes(R4, R5, R6),
    valid_boxes(R7, R8, R9),
    % labeling
    labeling([ff], Vs).

valid_boxes([], [], []).
valid_boxes([A, B, C | R1], [D, E, F | R2], [G, H, I | R3]) :-
    valid_sodoku_nums([A, B, C, D, E, F, G, H, I]),
    valid_boxes(R1, R2, R3).

valid_sodoku_nums(L) :-
    length(L, 9),
    all_distinct(L).
