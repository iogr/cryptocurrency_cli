require 'pry'

class CRYPTO::API
    def initialize
        # CoinGecko API V3
        # https://www.coingecko.com/api/documentations/v3
        @url_list = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
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

    def to_a
        puts "oywey"
    end

    # def create_cryptocurrency_objects(crypto_hash)
    #     crypto_hash.each do |crypto_object|
    #         CRYPTO::Cryptocurrency.new(crypto_object)
    #     end
    # end
end
