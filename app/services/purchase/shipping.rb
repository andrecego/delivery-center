class Purchase::Shipping < Purchase
  def call
    {}.merge(country, state, city, district, street, complement, latitude, longitude, dt_order_create, postal_code,
             number)
  end

  private

  def permitted_params
    receiver_permitted = %i[street_name comment latitude longitude date_created zip_code street_number]
    nested_permitted = { country: :id, state: :name, city: :name, neighborhood: :name }

    [shipping: { receiver_address: [*receiver_permitted, nested_permitted] }]
  end

  def shipping
    @shipping ||= params[:shipping]
  end

  def receiver_address
    @receiver_address ||= shipping[:receiver_address]
  end

  def country
    { country: receiver_address[:country][:id] }
  end

  def state
    { state: receiver_address[:state][:name] }
  end

  def city
    { city: receiver_address[:city][:name] }
  end

  def district
    { district: receiver_address[:neighborhood][:name] }
  end

  def street
    { street: receiver_address[:street_name] }
  end

  def complement
    { complement: receiver_address[:comment] }
  end

  def latitude
    { latitude: receiver_address[:latitude] }
  end

  def longitude
    { longitude: receiver_address[:longitude] }
  end

  def dt_order_create
    date_created = DateTime.parse(receiver_address[:date_created])
    iso8601_format = '%FT%T.%LZ'
    { dtOrderCreate: date_created.strftime(iso8601_format) }
  end

  def postal_code
    { postalCode: receiver_address[:zip_code] }
  end

  def number
    { number: receiver_address[:street_number] }
  end
end
