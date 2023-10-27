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
## @deftypefn {} {@var{retval} =} magic_with_pca (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);

  % initializare train
  train = zeros(m, n);

  % initializare miu
  miu = zeros(1, n);

  % initializare Y
  Y = zeros(m, pcs);

  % initializare Vk
  Vk = zeros(n, pcs);

  % converteste train_mat la tipul double
  train_mat = double(train_mat);

  % calculeaza media fiecarei coloane a matricii
  miu = mean(train_mat);

  % scade media din matricea initiala
  train_mat = train_mat - miu;

  % calculeaza matricea de covarianta
  cov_matrix = (train_mat' * train_mat) / (m - 1);

  % calculeaza vectorii si valorile proprii ale matricei de covarianta
  [eigenvectors, eigenvalues] = eig(cov_matrix);

  % transforma vectorii proprii si valorile proprii in matrici
  eigenvectors = fliplr(eigenvectors);
  eigenvalues = flipud(diag(eigenvalues));

  % pastreaza doar primele pcs coloane din matricea eigenvectors
  Vk = eigenvectors(:, 1:pcs);

  % creaza matricea Y schimband baza matricii initiale
  Y = train_mat * Vk;

  % calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';

endfunction

