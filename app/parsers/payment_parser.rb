class PaymentParser < BaseParser
  keep_keys :value

  def self.merge_keys
    { option: params[:type].downcase }
  end
end
