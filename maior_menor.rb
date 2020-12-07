# frozen_string_literal: true

LIMITE_TENTATIVAS = 3

def blank_rows
  3.times { puts }
end

def welcome
  puts 'Bem vindo ao jogo de adivinhação'
  puts 'Qual é o seu nome'
  nome = gets
  blank_rows
  puts "Vamos iniciar o jogo, #{nome}"
end

def sorteia_numero_secreto
  puts 'Escolhendo um número secreto entre 0 e 200...'
  numero_secreto = 175
  puts 'Número escolhido... tente adinhar: qual é o nosso número'
  numero_secreto
end

def pergunta_numero(tentativa)
  puts "Tenhativa Nº #{tentativa} \nEntre com o número"
  numero_chute = gets
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

welcome
numero_secreto = sorteia_numero_secreto
blank_rows

(1..LIMITE_TENTATIVAS).each do |i|
  numero_chute = pergunta_numero i
  break if verifica_chute numero_secreto, numero_chute
end
