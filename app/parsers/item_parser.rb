class ItemParser < BaseParser
  keep_keys :name, :price, :quantity, :total
  translate_keys externalCode: :external_code
end
