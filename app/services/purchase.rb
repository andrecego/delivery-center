class Purchase
  attr_reader :input_params

  def initialize(input_params)
    @input_params = input_params
  end

  def params
    @params ||= ActionController::Parameters.new(input_params).permit(*permitted_params)
  end

  def permitted_params
    []
  end
end
