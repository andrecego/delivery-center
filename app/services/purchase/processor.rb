class Purchase::Processor < Purchase
  def call
    {}.merge(*serializers)
  end

  private

  def serializers
    [
      serialize(Identity),
      serialize(Price),
      serialize(Shipping),
      { customer: serialize(Customer) },
      { items: input_params[:order_items].map { |item_params| serialize(Item, item_params) } },
      { payments: input_params[:payments].map { |payment_params| serialize(Payment, payment_params) } }
    ]
  end

  def serialize(klass, call_params = input_params)
    klass.new(call_params).call
  end
end
