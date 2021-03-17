class Purchase
  attr_reader :input_params

  def initialize(input_params)
    @input_params = input_params
  end

  def params
    @params ||= input_params.slice(*permitted_params)
  end

  def permitted_params
    []
  end
end
