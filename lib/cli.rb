class CRYPTO::CLI
    def initialize
        CRYPTO::API.new.get_cryptocurrencies
        # pry.binding
    end

    def run
        greeting
    end

    def greeting
        "Greeting"
        currency_test
    end

    def currency_test
        puts  "Rank   Currency      PRICE         PRICE_CHANGE_24h"
        puts  "-----------------------------------------------"
        puts "#index  id        current_price     price_change_24h"

        btc = CRYPTO::API.new.get_cryptocurrencies
        puts "1     #{btc[0].dig 'id'}       #{btc[0].dig 'current_price'}         #{btc[0].dig 'price_change_24h'}"
        puts "2     #{btc[1].dig 'id'}       #{btc[1].dig 'current_price'}         #{btc[1].dig 'price_change_24h'}"
        puts "3     #{btc[2].dig 'id'}       #{btc[2].dig 'current_price'}         #{btc[2].dig 'price_change_24h'}"
        # pry.binding
    end
end
