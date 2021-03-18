class CreateOrder
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    return bad_request if request.invalid?

    [:ok, { text: 'order created' }]
  end

  private

  def request
    @request ||= PurchaseValidate.new(processed_params)
  end

  def processed_params
    Purchase::Processor.new(params).call
  end

  def bad_request
    [request.response.status, { text: request.response.body }]
  end
end
