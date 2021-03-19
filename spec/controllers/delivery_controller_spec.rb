describe DeliveriesController, type: :request do
  describe 'POST /delivery' do
    before { post deliveries_path, params: JSON.parse(payload) }

    describe 'when the payload is invalid' do
      let(:payload) { File.read(Rails.root.join('spec/fixtures/badinput.json')) }

      it 'should return bad_request' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    describe 'when the payload is valid' do
      let(:payload) { File.read(Rails.root.join('spec/fixtures/input.json')) }

      it 'should return bad_request' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
