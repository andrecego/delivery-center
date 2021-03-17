class Purchase::Price < Purchase
  def call
    {}.merge(sub_total, delivery_fee, total_shipping, total)
  end

  private

  def permitted_params
    %i[total_amount total_shipping total_amount_with_shipping]
  end

  def sub_total
    { subTotal: number_to_currency(params[:total_amount]) }
  end

  def delivery_fee
    { deliveryFee: number_to_currency(params[:total_shipping]) }
  end

  def total_shipping
    { total_shipping: params[:total_shipping] || 0 }
  end

  def total
    { total: number_to_currency(params[:total_amount_with_shipping]) }
  end

  def number_to_currency(value)
    format('%<value>0.2f', value: value || 0)
  end
end
