class Url < ActiveRecord::Base

  validates :long_url, presence: true
  validates :long_url, format: { with: /http(s?):\/\//, message: "must contain http:// or https://" }

  def shorten
    self.short_url = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    @short = self.short_url
  end

  def retrieve_short_url(long_url)
    if @short
      return @short
    else
      return nil
    end
  end

end
