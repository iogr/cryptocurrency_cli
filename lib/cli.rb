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
        puts  "Rank   Currency      PRICE         PRICE_CHANGE_24h       DATETIME".colorize(:green)
        puts "#index  id        current_price     price_change_24h       last_updated"
        puts  "--------------------------------------------------------------------------"

        puts "1     #{@sample_objects[0].dig 'id'}       #{@sample_objects[0].dig 'current_price'}         #{@sample_objects[0].dig 'price_change_24h'}         #{@sample_objects[0].dig 'last_updated'}"
        puts "2     #{@sample_objects[1].dig 'id'}       #{(@sample_objects[1].dig 'current_price').to_s.colorize(:green)}         #{@sample_objects[1].dig 'price_change_24h'}         #{@sample_objects[0].dig 'last_updated'}"
        puts "3     #{@sample_objects[2].dig 'id'}       #{@sample_objects[2].dig 'current_price'}         #{@sample_objects[2].dig 'price_change_24h'}         #{@sample_objects[0].dig 'last_updated'}"
        # pry.binding
    end
end
