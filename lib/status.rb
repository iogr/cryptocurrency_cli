# require 'pry'

class CRYPTO::Status
  @@all = []

  def initialize(status_hash)
    status_hash.each do |key, value|
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end
end
