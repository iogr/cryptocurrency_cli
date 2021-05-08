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

    it 'CRYPTO::Cryptocurrency.all exists' do
      expect(
        "#{CRYPTO::Cryptocurrency.all}").to be_an Object

      CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
        expect(cryptocurrency.id).not_to be_empty
      end
    end

    it 'CRYPTO::Cryptocurrency.all should include bitcoin' do
      CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
        cryptocurrency.id.capitalize.to include("Bitcoin") if index == 0
        expect(cryptocurrency.id).to be_a String
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

    it 'Method currency_atl exists and returns currency table' do
      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{cryptocurrency.symbol}"
        end).to be
    end

    it 'Method query_key returns hash with queried key (sample id in input)' do
      input = "id"

      expect(
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
          "#{CRYPTO::CryptocurrencySearch.input(input)}"
        end).to be
    end

    it 'sample object exists' do
      expect(
        :sample_object).to be
    end

    it 'Method query_key returns all said keys' do
      CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
        expect([cryptocurrency.market_cap,
                cryptocurrency.id,
                cryptocurrency.name,
                cryptocurrency.image,
                cryptocurrency.current_price,
                cryptocurrency.market_cap,
                cryptocurrency.market_cap_rank,
                cryptocurrency.fully_diluted_valuation,
                cryptocurrency.total_volume,
                cryptocurrency.high_24h,
                cryptocurrency.low_24h,
                cryptocurrency.price_change_24h,
                cryptocurrency.price_change_percentage_24h,
                cryptocurrency.market_cap_change_24h,
                cryptocurrency.market_cap_change_percentage_24h,
                cryptocurrency.circulating_supply,
                cryptocurrency.total_supply,
                cryptocurrency.max_supply,
                cryptocurrency.ath,
                cryptocurrency.ath_change_percentage,
                cryptocurrency.ath_date,
                cryptocurrency.atl,
                cryptocurrency.atl_change_percentage,
                cryptocurrency.atl_date,
                cryptocurrency.roi,
                cryptocurrency.last_updated]).to be
      end
    end
  end
end
