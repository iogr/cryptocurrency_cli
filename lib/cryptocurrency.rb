# require 'pry'

class CRYPTO::Cryptocurrency
    @@all = []
    @@input = []

    def initialize(crypto_hash)
        crypto_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.input
        @@input
    end

    def input
    end
end
