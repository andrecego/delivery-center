class OrderParser < BaseParser
  keep_keys :total
  translate_keys externalCode: :external_code, storeId: :store_id, dtOrderCreate: :date_created, subTotal: :subtotal,
                 total_shipping: :shipping_cost
  def self.merge_keys
    {}.merge(subtotal, shipping_cost, total)
  end

  class << self
    def subtotal
      { subtotal: params[:subTotal].to_f }
    end

    def shipping_cost
      { shipping_cost: params[:total_shipping].to_f }
    end

    def total
      { total: params[:total].to_f }
    end
end
end
