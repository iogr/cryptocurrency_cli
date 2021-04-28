class CRYPTO::CLI
    def initialize
        @sample_objects = CRYPTO::API.new.get_cryptocurrencies
        @prompt = TTY::Prompt.new(help_color: :yellow)
    end

    def run
        currency_test
        menu
    end

    def menu
        choices = %w(BUY SELL SKIP)
        input = @prompt.select("Select an action?") do |menu|
            menu.choice :BUY, "BUY"
            menu.choice :SELL, "SELL"
            menu.choice :SKIP, "SKIP"
        end
    end

    def currency_test
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            if cryptocurrency.price_change_24h > 0
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.price_change_24h.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:green)
            else
                puts ["#{index}.", cryptocurrency.id.capitalize.ljust(20), "$#{cryptocurrency.current_price.to_s.ljust(18)}", "$#{cryptocurrency.price_change_24h.to_s.ljust(18)}", cryptocurrency.last_updated.to_s.ljust(18)].join(' ').colorize(:red)
            end
            puts "-----------------------------------------------------------------------------------------"
        end
    end
end

#puts  "Rank   Currency      PRICE         PRICE_CHANGE_24h       DATETIME".colorize(:green)
#puts "#index  id        current_price     price_change_24h       last_updated"
#puts  "--------------------------------------------------------------------------"
