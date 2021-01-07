# frozen_string_literal: true

def choice_maximun(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  when 5
    maximo = 200
  end
  maximo
end
  
def blank_rows(rows = 2)
  rows.times { puts }
end

def welcome
  puts 'Bem vindo ao jogo de adivinhação'
  puts 'Qual é o seu nome'
  nome = gets.strip
  blank_rows 2
  puts "Vamos iniciar o jogo, #{nome}"
  nome
end

def sorteia_numero_secreto(dificuldade)
  maximum = choice_maximun(dificuldade)
  puts "Escolhendo um número secreto entre 0 e #{maximo}..."
  numero_secreto = rand(maximo) + 1
  puts 'Número escolhido... tente adinhar: qual é o nosso número?'
  numero_secreto
end

def pergunta_numero(tentativa, limite_tentativas, chutes)
  blank_rows 1
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

def pede_dificuldade
  puts 'Qual o nível de dificuldade que deseja (1 fácil, 5 díficil)'
  gets.to_i
end

def play(_nome, dificuldade)
  limite_tentativas = 3
  chutes = []
  pontos = 1000

  numero_secreto = sorteia_numero_secreto dificuldade
  blank_rows

  (1..limite_tentativas).each do |i|
    numero_chute = pergunta_numero i, limite_tentativas, chutes
    chutes << numero_chute

    pontos_a_perder = (numero_chute - numero_secreto).abs / 2.0
    pontos -= pontos_a_perder

    break if verifica_chute numero_secreto, numero_chute
  end
  blank_rows 1
  puts "Você ficou com #{pontos} pontos."
  blank_rows 1
end

def play_again
  puts 'Deseja jogar novamente? (S/N)'
  answer = gets.strip
  answer.upcase == 'S'
end
