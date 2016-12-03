class Park < ApplicationRecord
  before_save :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :camping_sites,
             :foreign_key => "review_id",
             :dependent => :destroy

  has_many   :hiking_trails,
             :dependent => :destroy

  belongs_to :state,
             :counter_cache => true

  # Indirect associations

  # Validations

end
