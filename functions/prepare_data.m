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
## @deftypefn {} {@var{retval} =} prepare_data (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-07

function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;

  % Inițializare train_mat.
  train_mat = zeros(no_train_images, n);

  % Inițializare train_val.
  train_val = zeros(1, no_train_images);

  % Încarcă datele din fișierul specificat.
  file_data = load(name);

  % Salvează în matricea train_mat primele no_train_images linii din
  % tabelul de imagini de antrenament.

  file_data_matrix = file_data.trainX;

  file_data_values = file_data.trainY;
  
  train_mat = file_data_matrix(1:no_train_images, :);

  % Salvează în vectorul train_val primele no_train_images valori ale
  % vectorului de etichete.
  train_val = file_data_values(1:no_train_images);
endfunction
