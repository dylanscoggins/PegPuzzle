% Dylan Scoggins
% CSCE 4430.001
% Assignment 5
% Credit to Mississippi College for many of the rules
% used to solve this assignment.

% example of puzzle board
% x represents an occupied space
% o represents an unoccupied space
% each puzzle starts at:
% [    [o],
%     [x,x],
%   [x,x,x],
% [x,x,x,x]
% ]
% 
% actual representation will be similar to:
%
% [[o],[x,x],[x,x,x],[x,x,x,x]]
% 
% prior example is used to better visualize
% the peg puzzle board

%  possible jumps along a line
jump_line([x,x,o | T],[o,o,x | T]).
jump_line([o,x,x | T],[x,o,o | T]).

jump_line([H|T1],[H|T2]):-
   jump_line(T1,T2).

% rotate the board
rotate(
   [[A],[B,C],[D,E,F],[G,H,I,J],[K,L,M,N,O]],
   [[K],[L,G],[M,H,D],[N,I,E,B],[O,J,F,C,A]]
             ).
			 
% perform a jump on some line
jump_horizontal([A|T],[B|T]):-
   jump_line(A,B).

jump_horizontal([H|T1],[H|T2]):-
   jump_horizontal(T1,T2).

% perform legal jump
jump(B,A):-
   jump_horizontal(B,A).

jump(B,A):-
   rotate(B,BR),
   jump_horizontal(BR,BRJ),
   rotate(A,BRJ).

jump(B,A):-rotate(BR,B),
   jump_horizontal(BR,BRJ),
   rotate(BRJ,A).

% series of legal boards
% F = From
% T = To
% R = Rest
series(F, T, [F, T]):-
   jump(F, T).

series(F, T, [F, By | R]):-
   jump(F, By), 
   series(By, T, [By | R]).

% print an itteration of the game
% each move is represented on a single line
print_solution_r([]):- 
   write_ln('                    FINISH').

print_solution_r([X|Y]):-
   write_ln(X),
   print_solution_r(Y).

print_solution(Z):- 
   write_ln('\n                    START'),
   print_solution_r(Z).

% end solution given intial parameters
solution(S) :- 
   series([[o],[x,x],[x,x,x],[x,x,x,x],[x,x,x,x,x]],
                  [[x],[o,o],[o,o,o],[o,o,o,o],[o,o,o,o,o]],S).

% find and print the first solution  
solve_puzzle:-
   solution(X),
   print_solution(X).

% find and print all the solutions
% NOTE: not recommended due to
%              "numerous" solutions being printed
%                requires keyboard interrupt to cancel execution
solve_all:-
   solve_puzzle,
   fail.
