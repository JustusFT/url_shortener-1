class Url < ActiveRecord::Base
  validates_presence_of :long_url, :short_url
  validate :is_valid_url
  before_create :shorten!

  def is_valid_url
    return false if self.long_url.nil?
    unless self.long_url.start_with?("http://", "https://")
      errors.add(:long_url, "must start with http:// or https://")
    end
  end

  def shorten!
    return unless short_url.nil?
    #generate a string of 5 random alphanumeric characters
    str = ""
    characters = ("a".."z").to_a + ("0".."9").to_a
    5.times do
      str += characters.sample
    end
    self.short_url = str
  end

  def self.retrieve_short_url(long_url)
    url = Url.find_by(long_url: long_url)
    return nil if url.nil?
    url.short_url
  end
end
