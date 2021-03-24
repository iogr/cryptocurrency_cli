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
    end
end
