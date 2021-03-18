describe CustomerParser do
  subject { described_class.parse(params) }

  describe 'parse' do
    let(:params) { { externalCode: '136226073', name: 'JOHN DOE', email: 'john@doe.com', contact: '41999999999' } }

    it 'successfully all the fields' do
      expect(subject).to eq({ external_code: '136226073', name: 'JOHN DOE', email: 'john@doe.com',
                              contact: '41999999999' })
    end
  end
end
