# frozen_string_literal: true

def blank_rows
  3.times { puts }
end

def welcome
  puts 'Bem vindo ao jogo de adivinhação'
  puts 'Qual é o seu nome'
  nome = gets.strip
  blank_rows
  puts "Vamos iniciar o jogo, #{nome}"
end

def sorteia_numero_secreto
  puts 'Escolhendo um número secreto entre 0 e 200...'
  numero_secreto = rand 200
  puts 'Número escolhido... tente adinhar: qual é o nosso número'
  numero_secreto
end

def pergunta_numero(tentativa, limite_tentativas, chutes)
  puts "Tenhativa Nº #{tentativa} de #{limite_tentativas}"
  puts "Chutes até o momento: #{chutes}"
  puts 'Entre com o número'
  numero_chute = gets.strip
  puts "Será que você acertou? Você chutou #{numero_chute}"
  numero_chute.to_i
end

def verifica_chute(numero_secreto, numero_chute)
  diferenca = numero_secreto - numero_chute
  if diferenca.zero?
    puts 'Acertou!'
    true
  elsif diferenca.positive?
    puts 'O número secreto é maior'
    false
  else
    puts 'O número secreto é menor'
    false
  end
end

def main
  limite_tentativas = 3
  chutes = []
  pontos = 1000

  welcome
  numero_secreto = sorteia_numero_secreto
  blank_rows

  (1..limite_tentativas).each do |i|
    numero_chute = pergunta_numero i, limite_tentativas, chutes
    chutes << numero_chute

    pontos_a_perder = (numero_chute - numero_secreto).abs / 2.0
    pontos -= pontos_a_perder

    break if verifica_chute numero_secreto, numero_chute
  end

  puts "Você ficou com #{pontos} pontos."
end

main
