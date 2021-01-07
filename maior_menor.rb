# frozen_string_literal: true

require_relative 'maior_menor'

nome_jogador = welcome
dificuldade = pede_dificuldade

loop do
  play nome_jogador, dificuldade
  break if play_again?
end
