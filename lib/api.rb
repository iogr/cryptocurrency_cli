require 'pry'

class CRYPTO::API
    def initialize
        # CoinGecko API V3
        # https://www.coingecko.com/api/documentations/v3
        @url_list = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=25&page=1&sparkline=false"
        # {"id"=>"bitcoin", "symbol"=>"btc", "name"=>"Bitcoin", "image"=>"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", "current_price"=>54743, "market_cap"=>1024268613412, "market_cap_rank"=>1, "fully_diluted_valuation"=>1150639700646, "total_volume"=>47267078492, "high_24h"=>55669, "low_24h"=>53988, "price_change_24h"=>-403.4445885, "price_change_percentage_24h"=>-0.73158, "market_cap_change_24h"=>5126751365, "market_cap_change_percentage_24h"=>0.50305, "circulating_supply"=>18693637.0, "total_supply"=>21000000.0, "max_supply"=>21000000.0, "ath"=>64805, "ath_change_percentage"=>-15.59813, "ath_date"=>"2021-04-14T11:54:46.763Z", "atl"=>67.81, "atl_change_percentage"=>80562.44435, "atl_date"=>"2013-07-06T00:00:00.000Z", "roi"=>nil, "last_updated"=>"2021-04-28T14:37:40.393Z"}
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
end
