# frozen_string_literal: true

require 'rspec'
require_relative '../core_maior_menor.rb'

describe '#' do
  it 'choice maximum number by difficulty' do
    expect(choice_maximun(1)).to eq(30)
  end
end
