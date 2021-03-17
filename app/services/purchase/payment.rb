class Purchase::Payment < Purchase
  def call
    {}.merge(type, value)
  end

  private

  def permitted_params
    %i[payment_type total_paid_amount]
  end

  def type
    { type: params[:payment_type].upcase }
  end

  def value
    { value: params[:total_paid_amount] }
  end
end
