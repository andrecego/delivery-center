describe OrderParser do
  subject { described_class.parse(params) }

  describe 'parse' do
    let(:params) do
      { externalCode: '9987071', storeId: 282, dtOrderCreate: '2019-06-27T19:59:08.251Z', subTotal: '49.90',
        deliveryFee: '5.14', total_shipping: 5.14, total: '55.04' }
    end

    it 'successfully all the fields' do
      expect(subject).to eq({ external_code: '9987071', store_id: 282, date_created: '2019-06-27T19:59:08.251Z',
                              subtotal: 49.9, shipping_cost: 5.14, total: 55.04 })
    end
  end
end
