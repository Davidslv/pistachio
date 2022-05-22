require 'rails_helper'

module Services
  RSpec.describe PostcodesIo do
    subject(:service) { described_class.new(base_url: base_url, cache: cache) }

    let(:cache) { PostcodesCache.new }

    let(:base_url) { 'http://api.postcodes.io' }
    let(:uri) { URI("#{base_url}/postcodes/#{postcode}") }

    context 'with an empty postcode' do
      let(:postcode) { '' }

      let(:response_body) do
        {
          status: 400,
          error: 'No postcode query submitted. Remember to include query parameter'
        }
      end

      let(:response) do
        instance_double('Net:HTTP', code: '400', body: response_body.to_json)
      end

      it 'returns code 400' do
        allow(Net::HTTP).to receive(:get_response).with(uri).and_return(response)

        expect(service.find(postcode)).to eq(response_body)
      end
    end

    context 'with an invalid postcode' do
      let(:postcode) { '111' }

      let(:response_body) do
        {
          status: 404,
          error: 'Invalid postcode'
        }
      end

      let(:response) do
        instance_double('Net:HTTP', code: '404', body: response_body.to_json)
      end

      it 'returns code 404' do
        allow(Net::HTTP).to receive(:get_response).with(uri).and_return(response)

        expect(service.find(postcode)).to eq(response_body)
      end
    end

    context 'with a valid postcode' do
      context 'when postcode has whitespace' do
        let(:postcode) { 'SE17QD' }

        let(:response_body) do
          {
            result: {
              lsoa: 'Southwark 034A',
              postcode: 'SE1 7QD'
            },
            status: 200
          }
        end

        let(:response) do
          instance_double('Net:HTTP', code: '200', body: response_body.to_json)
        end

        it 'returns code 200' do
          allow(Net::HTTP).to receive(:get_response).with(uri).and_return(response)

          expect(service.find('SE1 7QD')).to eq(
            {
              status: 200,
              lsoa: 'Southwark 034A',
              postcode: 'SE17QD'
            }
          )
        end
      end

      context 'when postcode has no whitespace' do
        let(:postcode) { 'SE17QA' }

        let(:response_body) do
          {
            result: {
              lsoa: 'Lambeth 036B',
              postcode: 'SE1 7QA'
            },
            status: 200
          }
        end

        let(:response) do
          instance_double('Net:HTTP', code: '200', body: response_body.to_json)
        end

        it 'returns code 200' do
          allow(Net::HTTP).to receive(:get_response).with(uri).and_return(response)

          expect(service.find(postcode)).to eq(
            {
              status: 200,
              lsoa: 'Lambeth 036B',
              postcode: 'SE17QA'
            }
          )
        end

        context 'and another request for the same postcode is done' do
          it 'should only do the http request once' do
            allow(Net::HTTP).to receive(:get_response).once
              .with(uri).and_return(response)

            service.find(postcode)
            service.find(postcode)
          end
        end
      end

      context 'when postcode is not found' do
        let(:postcode) { 'SE17QD' }

        let(:response_body) do
          {
            status: 404,
            error: 'Postcode not found'
          }
        end

        let(:response) do
          instance_double('Net:HTTP', code: '404', body: response_body.to_json)
        end

        it 'returns code 404' do
          allow(Net::HTTP).to receive(:get_response).with(uri).and_return(response)

          expect(service.find(postcode)).to eq(response_body)
        end
      end
    end
  end
end
