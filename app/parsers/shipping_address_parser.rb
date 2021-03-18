class ShippingAddressParser < BaseParser
  keep_keys :country, :state, :city, :district, :street, :complement, :latitude, :longitude, :number
  translate_keys postalCode: :postal_code
end
