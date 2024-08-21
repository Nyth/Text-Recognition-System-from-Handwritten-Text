clc;
close all;

% Load images of uppercase letters from A to Z
A = imread('letters_numbers\A.bmp'); B = imread('letters_numbers\B.bmp');
C = imread('letters_numbers\C.bmp'); D = imread('letters_numbers\D.bmp');
E = imread('letters_numbers\E.bmp'); F = imread('letters_numbers\F.bmp');
G = imread('letters_numbers\G.bmp'); H = imread('letters_numbers\H.bmp');
I = imread('letters_numbers\I.bmp'); J = imread('letters_numbers\J.bmp');
K = imread('letters_numbers\K.bmp'); L = imread('letters_numbers\L.bmp');
M = imread('letters_numbers\M.bmp'); N = imread('letters_numbers\N.bmp');
O = imread('letters_numbers\O.bmp'); P = imread('letters_numbers\P.bmp');
Q = imread('letters_numbers\Q.bmp'); R = imread('letters_numbers\R.bmp');
S = imread('letters_numbers\S.bmp'); T = imread('letters_numbers\T.bmp');
U = imread('letters_numbers\U.bmp'); V = imread('letters_numbers\V.bmp');
W = imread('letters_numbers\W.bmp'); X = imread('letters_numbers\X.bmp');
Y = imread('letters_numbers\Y.bmp'); Z = imread('letters_numbers\Z.bmp');

% Load images of lowercase letters from a to z
a = imread('letters_numbers\a.png'); b = imread('letters_numbers\b.png');
c = imread('letters_numbers\c.png'); d = imread('letters_numbers\d.png');
e = imread('letters_numbers\e.png'); f = imread('letters_numbers\f.png');
g = imread('letters_numbers\g.png'); h = imread('letters_numbers\h.png');
i = imread('letters_numbers\i.png'); j = imread('letters_numbers\j.png');
k = imread('letters_numbers\k.png'); l = imread('letters_numbers\l.png');
m = imread('letters_numbers\m.png'); n = imread('letters_numbers\n.png');
o = imread('letters_numbers\o.png'); p = imread('letters_numbers\p.png');
q = imread('letters_numbers\q.png'); r = imread('letters_numbers\r.png');
s = imread('letters_numbers\s.png'); t = imread('letters_numbers\t.png');
u = imread('letters_numbers\u.png'); v = imread('letters_numbers\v.png');
w = imread('letters_numbers\w.png'); x = imread('letters_numbers\x.png');
y = imread('letters_numbers\y.png'); z = imread('letters_numbers\z.png');

% Load images of numbers from 0 to 9
one = imread('letters_numbers\1.bmp'); two = imread('letters_numbers\2.bmp');
three = imread('letters_numbers\3.bmp'); four = imread('letters_numbers\4.bmp');
five = imread('letters_numbers\5.bmp'); six = imread('letters_numbers\6.bmp');
seven = imread('letters_numbers\7.bmp'); eight = imread('letters_numbers\8.bmp');
nine = imread('letters_numbers\9.bmp'); zero = imread('letters_numbers\0.bmp');

% Combines all uppercase letters into one array
letter = [A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];

% Combine all numbers into one array
number = [one two three four five...
    six seven eight nine zero];

% Combine all lowercase letters into one array
lowercase = [a b c d e f g h i j k ...
     l m n o p q r s t u v w x y z];

% Combine all characters into a single array
character = [letter number lowercase];

% Convert the character array into a cell array (templates) where each cell
% contains an individual character image, with each character having a fixed size of 42x24
templates = mat2cell(character, 42, ...
    [24 24 24 24 24 24 24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24]);

% Save the templates to a .mat file
save ('templates', 'templates');

% Clear all variables from the workspace
clear all
