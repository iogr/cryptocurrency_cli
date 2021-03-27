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
        choices = %w(emacs nano vim)
        input = @prompt.select("Select an editor?") do |menu|
            menu.choice :nano,  "/bin/nano"
            menu.choice :vim,   "/usr/bin/vim"
            menu.choice :emacs, "/usr/bin/emacs"
        end

        input = @prompt.select("Hey?", ) do |menu|
            menu.choice "Yes"
            menu.choice "No"
        end
    end

    def currency_test
        CRYPTO::Cryptocurrency.all.each.with_index(1) do |cryptocurrency, index|
            puts "#{index}. Currency symbol: #{cryptocurrency.symbol} Price: $#{cryptocurrency.current_price}"
        end
    end
end

#puts  "Rank   Currency      PRICE         PRICE_CHANGE_24h       DATETIME".colorize(:green)
#puts "#index  id        current_price     price_change_24h       last_updated"
#puts  "--------------------------------------------------------------------------"
