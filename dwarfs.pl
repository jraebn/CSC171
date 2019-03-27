
%% Grumpy was in front of Dopey.
%% Stumpy was behind Sneezy and Doc.
%% Doc was in front of Droopy and Happy.
%% Sleepy was behind Stumpy, Smelly and Happy.
%% Happy was in front of Sleepy, Smelly and Bashful.
%% Bashful was behind Smelly, Droopy and Sleepy.
%% Sneezy was in front of Dopey. 
%% Smelly was in front of Grumpy, Stumpy and Sneezy.
%% Dopey was in front of Droopy.
%% Sleepy was in front of Grumpy and Bashful.
%% Dopey was behind Sneezy, Doc and Sleepy.
%% Stumpy was in front of Dopey. 
%% Smelly was behind Doc.

%% What is the order of the dwarves?\

inFrontOf(X, Y) :- behind(Y,X).

inFrontOf(grumpy,dopey).
inFrontOf(doc,droopy).
inFrontOf(doc,happy).
inFrontOf(happy,sleepy).
inFrontOf(happy,smelly).
inFrontOf(happy,bashful).
inFrontOf(sneezy,dopey).
inFrontOf(smelly,grumpy).
inFrontOf(smelly,stumpy).
inFrontOf(smelly,sneezy).
inFrontOf(dopey,droopy).
inFrontOf(sleepy,grumpy).
inFrontOf(sleepy,bashful).
inFrontOf(stumpy,dopey).

behind(X, Y) :- inFrontOf(Y, X).

behind(sleepy, stumpy).
behind(sleepy, smelly).
behind(sleepy, happy).
behind(bashful, smelly).
behind(bashful, droopy).
behind(bashful, sleepy).
behind(dopey, sneezy).
behind(dopey, doc).
behind(dopey, sleepy).
behind(smelly, doc).
behind(stumpy,sneezy).
behind(stumpy,doc).


start() :- 
	order([bashful, droopy, dopey, doc, happy, sneezy, smelly, sleepy, stumpy], [grumpy]).


order([Dwarf|[]], Order) :- write("The order is: "), write(Order), nl.
order([Dwarf|Others], [F|[]]) :- 
	(front(Dwarf, F) -> order(Others, [Dwarf, F])
		; order([Others], [F, Dwarf])
	).
order([Dwarf|Others], [F|Rest]) :-
	(front(Dwarf, F) -> order(Others, [Dwarf, F|Rest])
		; order([Dwarf|Others], [F, Rest])
	).