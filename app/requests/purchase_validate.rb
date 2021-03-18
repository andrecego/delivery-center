class PurchaseValidate
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def response
    @response ||= Faraday.post("#{endpoint}#{service_path}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-Sent'] = Time.zone.now.strftime('%Hh%M - %D')
      req.body = payload.to_json
    end
  end

  def errors
    return '' if valid?

    response.body
  end

  def valid?
    response.success?
  end

  def invalid?
    !valid?
  end

  private

  def endpoint
    ENV.fetch('DELIVERY_ENDPOINT')
  end

  def service_path
    '/'
  end
end
