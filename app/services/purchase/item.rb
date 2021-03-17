class Purchase::Item < Purchase
  def call
    {}.merge(external_code, name, price, quantity, total, subitems)
  end

  private

  def permitted_params
    [:quantity, :unit_price, :full_unit_price, :email, { item: %i[id title] }, { subitems: [] }]
  end

  def external_code
    { externalCode: params[:item][:id] }
  end

  def name
    { name: params[:item][:title] }
  end

  def price
    { price: params[:unit_price] }
  end

  def quantity
    { quantity: params[:quantity] }
  end

  def total
    { total: params[:full_unit_price] }
  end

  def subitems
    { subItems: params[:subitems] || [] }
  end
end
