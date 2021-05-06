require 'rspec'
require_relative '../config/environment'
require_relative 'cli.rb'

describe CRYPTO::CLI.new do
  context 'data' do
    let(:sample_object) { CRYPTO::API.new.get_cryptocurrencies[0] }

    it 'CRYPTO::Cryptocurrency.all exists' do
      expect(
        "#{CRYPTO::Cryptocurrency.all}").to be
    end

    it 'CRYPTO::Cryptocurrency.all should include bitcoin' do
      CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
        cryptocurrency.id.capitalize.to include("Bitcoin") if index == 0
      end
    end

    it 'CRYPTO::Cryptocurrency.all.each exists and returns plural current_price' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.current_price}"
        end).to be
    end

    it 'Method currency_price_change_24h exists and returns plural price_change_24h' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.price_change_24h}"
        end).to be
    end

    it 'Method currency_atl exists and returns currency table' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.atl}"
        end).to be
    end

    it 'Method currency_total_volume exists and returns currency table' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.total_volume}"
        end).to be
    end

    it 'Method currency_market_cap exists and returns currency table' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.market_cap}"
        end).to be
    end

    it 'Method query_key returns hash with queried key (sample id in input)' do
      input = "id"

      expect(
        "#{CRYPTO::CryptocurrencySearch.input(input)}").to be

      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          puts "#{CRYPTO::CryptocurrencySearch.input(input)}"
        end).to be
    end

    it 'sample object exists' do
      expect(
        :sample_object).to be
    end

    # it 'input id returns hash' do
    # end
  end

  # context 'command user interface' do
  # end
end
