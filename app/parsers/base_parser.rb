class BaseParser
  class << self
    def keep_keys(*keep_keys)
      @keys_to_keep = keep_keys
    end

    def translate_keys(**translate_keys)
      @keys_to_translate = translate_keys
    end

    def merge_keys
      {}
    end

    def parse(params)
      @params = params

      parsed = {}

      keys_to_keep&.each { |key| parsed[key] = params[key] }
      keys_to_translate&.each { |original_key, translated_key| parsed[translated_key] = params[original_key] }
      parsed.merge! merge_keys
      parsed
    end

    private

    attr_reader :params, :keys_to_keep, :keys_to_translate
  end
end
