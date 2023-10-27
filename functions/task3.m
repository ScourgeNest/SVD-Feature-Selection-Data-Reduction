## Copyright (C) 2021 Andrei
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
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3(photo, pcs)
  [m, n] = size(photo);
  
  % Inițializare matrice finală.
  Aux = zeros(m, n);
  
  % Convertirea matricei photo la tipul double.
  photo = double(photo);
  
  % Calcularea mediei pentru fiecare rând al matricei.
  mu = mean(photo, 2);
  
  % Normalizarea matricei photo prin scăderea mediei fiecărui rând.
  photo = photo - mu;
  
  % Calcularea matricei de covarianță.
  Z = photo * photo';
  
  % Calcularea vectorilor și valorilor proprii ale matricei de covarianță.
  [V, S] = eig(Z);
  
  % Ordonarea descrescătoare a valorilor proprii și crearea matricei V.
  [~, indices] = sort(diag(S), 'descend');
  V = V(:, indices);
  
  % Păstrarea doar a primelor pcs coloane din matricea V.
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

