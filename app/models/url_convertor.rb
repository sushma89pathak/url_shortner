class UrlConvertor < ApplicationRecord

  validates_presence_of :original_url
  validates :original_url, uniqueness: true

end
