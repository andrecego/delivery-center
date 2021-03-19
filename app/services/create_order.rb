class CreateOrder
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    return bad_request if request.invalid?

    create_order
  end

  private

  def create_order
    begin
      ActiveRecord::Base.transaction do
        order = Order.new(**OrderParser.parse(processed_params), customer: customer, shipping_address: shipping_address)
        order.items = items
        order.payments = payments
        order.save!
      end
    rescue ActiveRecord::RecordInvalid => e
      return [:bad_request, { text: e.to_s }]
    end

    [:ok, { text: 'order created' }]
  end

  def request
    @request ||= PurchaseValidate.new(processed_params)
  end

  def processed_params
    @processed_params ||= Purchase::Processor.new(params).call
  end

  def bad_request
    [request.response.status, { text: request.response.body }]
  end

  def customer
    @customer ||= Customer.create!(CustomerParser.parse(processed_params[:customer]))
  end

  def shipping_address
    @shipping_address = ShippingAddress.create!(**ShippingAddressParser.parse(processed_params), customer: customer)
  end

  def items
    @items = processed_params[:items].map { |item_param| Item.new(ItemParser.parse(item_param)) }
  end

  def payments
    @payments = processed_params[:payments].map { |payment_param| Payment.new(PaymentParser.parse(payment_param)) }
  end
end
