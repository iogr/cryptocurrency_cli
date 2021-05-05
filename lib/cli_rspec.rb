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
      # cryptocurrency = CRYPTO::Cryptocurrency.help_hash[:fifty_fifty]

      CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
        cryptocurrency.id.capitalize.to include("Bitcoin") if index == 0
      end
    end
    # .to include("1.")
    # should include("Bitcoin")
    # "#{CRYPTO::Cryptocurrency.all}").should include('Bitcoin')

    it 'sample object exists' do
      expect(
        :sample_object).to be
      # should include("1.")
      # should include("Bitcoin")
    end

    it 'currency_price_change_24h returns currency table' do
      expect(
        :sample_object).to be
    end
  end

  context 'command user interface' do
    # it "user input" do
    # end

    # it 'data is get' do
    # end
    #
    # it 'correct data' do
    # end
  end
end
