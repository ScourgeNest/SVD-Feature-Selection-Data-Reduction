## Copyright (C) 2023 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} task2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28

function new_X = task2(photo, pcs)
  [m, n] = size(photo);
  
  % Inițializare matrice finală.
  Aux = zeros(m, n);
  
  % Convertirea matricei photo la tipul double.
  photo = double(photo);
  
  % Calcularea mediei pentru fiecare vector ai.
  mu = mean(photo, 2);
  
  % Normalizarea matricei photo prin scăderea mediei fiecărui rând.
  photo = photo - mu;
  
  % Construirea matricei Z.
  Z = photo';
  
  % Calcularea SVD pentru matricea Z.
  [U, S, V] = svd(Z);
  
  % Construirea matricei W din primele pcs coloane ale lui V.
  W = V(:, 1:pcs);
  
  % Calcularea matricei Y.
  Y = W' * photo;
  
  % Aproximarea matricei inițiale.
  Aux = W * Y + mu;
  
  % Transformarea matricei în uint8 pentru a reprezenta o imagine validă.
  Aux = uint8(Aux);

  % Returnarea matricei finale.
  new_X = Aux;
endfunction

