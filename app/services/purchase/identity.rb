class Purchase::Identity < Purchase
  def call
    {}.merge(external_code, store_id)
  end

  private

  def permitted_params
    %i[id store_id]
  end

  def external_code
    { externalCode: params[:id].to_s }
  end

  def store_id
    { storeId: params[:store_id] }
  end
end
