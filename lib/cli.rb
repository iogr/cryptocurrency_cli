class CRYPTO::CLI
    def initialize
        @sample_objects = CRYPTO::API.new.get_cryptocurrencies
        @prompt = TTY::Prompt.new(help_color: :yellow)
    end

    def run
        menu
    end

    def menu
        input = @prompt.select("Select an action?") do |menu|
            menu.choice "Currency by Price_change_24h"
            menu.choice "Currency by ATL"
            menu.choice "Enter currency key"
            menu.choice "Exit"
        end

        if input == "Currency by Price_change_24h"
            currency_price_change_24h
        elsif input == "Currency by ATL"
            currency_atl
        elsif input == "Enter currency key"
            query_key
        else
            exit_cli
        end
    end

    def currency_price_change_24h
        puts "Currencies by Price_change_24h"
        puts  "RANK   CURRENCY         PRICE               PRICE_CHANGE_24h    DATETIME".colorize(:green)
        puts "#index id               current_price       price_change_24h    last_updated"
        puts  "--------------------------------------------------------------------------"
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.price_change_24h.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.price_change_24h.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
        end
        puts  "--------------------------------------------------------------------------"
    end

    def currency_atl
        puts "Currencies by All-Time-Low (ATL)"
        puts "The lowest point (in price, in market capitalization) that a cryptocurrency has been in history."
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.atl.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.atl.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
        end
    end

    def query_key
        puts "{id=>bitcoin, symbol=>btc, name=>Bitcoin, image=>https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579, current_price=>54743, market_cap=>1024268613412, market_cap_rank=>1, fully_diluted_valuation=>1150639700646, total_volume=>47267078492, high_24h=>55669, low_24h=>53988, price_change_24h=>-403.4445885, price_change_percentage_24h=>-0.73158, market_cap_change_24h=>5126751365, market_cap_change_percentage_24h=>0.50305, circulating_supply=>18693637.0, total_supply=>21000000.0, max_supply=>21000000.0, ath=>64805, ath_change_percentage=>-15.59813, ath_date=>2021-04-14T11:54:46.763Z, atl=>67.81, atl_change_percentage=>80562.44435, atl_date=>2013-07-06T00:00:00.000Z, roi=>nil, last_updated=>2021-04-28T14:37:40.393Z}"
        input = @prompt.ask("Please type a query key:", default: "e.g. market_cap_rank")
    end

    def exit_cli
        exit
    end
end

