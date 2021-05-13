require 'pry'

class CRYPTO::API
    def initialize
        # CoinGecko API V3
        # https://www.coingecko.com/api/documentations/v3
        @url_list = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=25&page=1&sparkline=false"
        @status_update = "https://api.coingecko.com/api/v3/status_updates?category=general&project_type=&per_page=5&page=1"
    end

    def get_cryptocurrencies
        request = URI.parse(@url_list)
        response = Net::HTTP.get_response(request)
        crypto_hash = JSON.parse(response.body)
        self.create_cryptocurrency_objects(crypto_hash)
    end

    def create_cryptocurrency_objects(crypto_hash)
        crypto_hash.each do |crypto_object|
            # might take a while to load
            CRYPTO::Cryptocurrency.new(crypto_object)
        end
    end

    def get_all_cryptocurrencies_data
        url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        request = URI.parse(url)
        response = Net::HTTP.get_response(request)
        crypto_hash = JSON.parse(response.body)
        self.create_cryptocurrency_data(crypto_hash)
    end

    def create_cryptocurrency_data(crypto_hash)
        crypto_hash.each do |crypto_object|
            CRYPTO::CryptocurrencySearch.new(crypto_object)
        end
    end

    def get_status_update
        request = URI.parse(@status_update)
        response = Net::HTTP.get_response(request)
        status_hash = JSON.parse(response.body)
        self.create_status_data(status_hash)
    end

    def create_status_data(status_hash)
        status_hash.each do |status_object|
            CRYPTO::Status.new(status_hash)
        end
    end
end
