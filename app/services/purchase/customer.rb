class Purchase::Customer < Purchase
  def call
    {}.merge(external_code, name, email, contact)
  end

  private

  def permitted_params
    [buyer: [:id, :nickname, :email, { phone: %i[area_code number] }]]
  end

  def buyer
    @buyer ||= params[:buyer]
  end

  def external_code
    { externalCode: buyer[:id].to_s }
  end

  def name
    { name: buyer[:nickname] }
  end

  def email
    { email: buyer[:email] }
  end

  def contact
    contact_phone = buyer[:phone][:area_code].to_s + buyer[:phone][:number]
    { contact: contact_phone }
  end
end
