class CRYPTO::CryptocurrencySearch
  @@all = []

  def initialize(crypto_hash)
    crypto_hash.each do |key, value|
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
      #"#{key}  #{value}" if key == "#{self.input}"
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.input(input)
    self.all.each do |key, value|
    end
  end
end
