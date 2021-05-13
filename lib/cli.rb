class CRYPTO::CLI
    def initialize
        @sample_objects = CRYPTO::API.new.get_cryptocurrencies
        @status = CRYPTO::API.new.get_status_update
        @prompt = TTY::Prompt.new(help_color: :yellow)
        CRYPTO::API.new.get_all_cryptocurrencies_data
    end

    def run
        menu
    end

    def menu
        input = @prompt.select("Select an action?") do |menu|
            menu.choice "Currencies by Price_change_24h"
            menu.choice "Currencies by ATL"
            menu.choice "Currencies by Total Volume"
            menu.choice "Currencies by Market Cap"
            menu.choice "Currencies by Symbol"
            menu.choice "Enter currency key"
            menu.choice "View status update"
            menu.choice "Exit"
        end

        if input == "Currencies by Price_change_24h"
            currency_price_change_24h
        elsif input == "Currencies by ATL"
            currency_atl
        elsif input == "Currencies by Total Volume"
            currency_total_volume
        elsif input == "Currencies by Market Cap"
            currency_market_cap
        elsif input == "Currencies by Symbol"
            currency_symbol
        elsif input == "Enter currency key"
            query_key
        elsif input == "View status update"
            status_update
        else
            exit_cli
        end
        status_update
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
        menu
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
        menu
    end

    def currency_total_volume
        puts "Currencies by Total Volume"
        puts "The amount of the cryptocurrency that has been traded."
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.total_volume.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.total_volume.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
        end
        menu
    end

    def currency_market_cap
        puts "Currencies by Market capitalization (market cap)"
        puts "Market cap is measured by multiplication of the circulating supply of tokens or currency and its current price."
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.market_cap.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.market_cap.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
        end
        menu
    end

    def currency_symbol
        puts "Currencies by Symbol"
            CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", "#{cryptocurrency.symbol.upcase.to_s.ljust(5)}", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.market_cap.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", "#{cryptocurrency.symbol.upcase.to_s.ljust(5)}", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.market_cap.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
        end
        menu
    end

    def query_key
        puts "{id=>bitcoin, symbol=>btc, name=>Bitcoin, image=>https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579, current_price=>54743, market_cap=>1024268613412, market_cap_rank=>1, fully_diluted_valuation=>1150639700646, total_volume=>47267078492, high_24h=>55669, low_24h=>53988, price_change_24h=>-403.4445885, price_change_percentage_24h=>-0.73158, market_cap_change_24h=>5126751365, market_cap_change_percentage_24h=>0.50305, circulating_supply=>18693637.0, total_supply=>21000000.0, max_supply=>21000000.0, ath=>64805, ath_change_percentage=>-15.59813, ath_date=>2021-04-14T11:54:46.763Z, atl=>67.81, atl_change_percentage=>80562.44435, atl_date=>2013-07-06T00:00:00.000Z, roi=>nil, last_updated=>2021-04-28T14:37:40.393Z}"
        input = @prompt.ask("Please type a query key:", default: "e.g. market_cap_rank")

        if @sample_objects[0].has_key?(input)
            CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
                 if cryptocurrency.price_change_24h > 0
                    puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{CRYPTO::CryptocurrencySearch.input(input).to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
                 else
                     puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{CRYPTO::CryptocurrencySearch.input(input).to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
                 end
            end
        else
            puts "Can't find that key"
        end
        menu
    end

    def status_update
        # @status.flatten[1] -> {"description"=>"April Decred Journal is out!\r\n\r\nCheck out the detailed report on development, network and social stats, ecosystem growth and new media content.\r\n\r\nhttps://xaur.github.io/decred-news/journal/202104", "category"=>"general", "created_at"=>"2021-05-12T20:34:34.452Z", "user"=>"jz", "user_title"=>"International Ops Lead", "pin"=>false, "project"=>{"type"=>"Coin", "id"=>"decred", "name"=>"Decred", "symbol"=>"dcr", "image"=>{"thumb"=>"https://assets.coingecko.com/coins/images/329/thumb/decred.png?1547034093", "small"=>"https://assets.coingecko.com/coins/images/329/small/decred.png?1547034093", "large"=>"https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093"}}}
        status_update_count = @status.flatten[1].count { |k, _| k.to_s.include?('user') }
        if status_update_count&.nonzero?
            puts "There's #{status_update_count} status update(s):"
            @status.flatten[1].each.with_index(0) do |status, index|
                puts ["#{index + 1}.", "#{@status.flatten[1][index].dig('user')}:", "#{@status.flatten[1][index].dig("description").to_s.ljust(18)}.", "Created at: #{@status.flatten[1][index].dig("created_at").to_s.ljust(18)}"].join(' ').colorize(:green)
            end
        else
            puts "Found no status updates"
        end
        menu
    end

    def exit_cli
        exit
    end
end

