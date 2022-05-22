require 'rails_helper'

module Services
  RSpec.describe ResponseLogic do
    subject { described_class.new(postcode, response) }

    let(:postcode) { '' }
    let(:response) { {} }

    context 'when response status is 400' do
      let(:response) { super().merge(status: 400, error: 'error message') }

      it 'returns the response error message' do
        expect(subject.call).to eql({error: 'error message'})
      end
    end

    context 'when response status is 404' do
      context 'and postcode is invalid' do
        let(:response) { super().merge(status: 404, error: 'Invalid postcode') }

        it 'returns the response error message' do
          expect(subject.call).to eql({error: 'Invalid postcode'})
        end
      end

      context 'and postcode is not in the allowed list' do
        let(:response) { super().merge(status: 404, error: 'Postcode not found') }

        it 'returns the response error message' do
          expect(subject.call).to eql({error: 'Postcode not found'})
        end
      end

      context 'and postcode is in the allowed list' do
        let(:postcode) { 'SH241AA' }
        let(:response) do
          super().merge(
            status: 404,
            error: 'Postcode not found '
          )
        end

        it 'returns a notice message' do
          Admin::AllowedPostcode.create(postcode: postcode)

          expect(subject.call).to eql({ notice: 'We do operate in your postcode.' })
        end
      end
    end

    context 'when response status is 200' do
      let(:postcode) { 'SE17QA'}
      let(:response) { { status: 200, lsoa: 'Lambeth 036B', postcode: postcode } }

      context 'and area is in the allowed list' do
        Admin::AllowedArea.create(area: 'Lambeth')

        it 'returns a notice message' do
          expect(subject.call).to eql({ notice: 'We do operate in your area.' })
        end
      end

      context 'and area is not in the allowed list' do
        let(:postcode) { 'SW18 1RL' }
        let(:response) { super().merge(lsoa: 'Wandsworth 031X', postcode: postcode) }

        it 'returns an error message' do
          expect(subject.call).to eql({ error: 'Apologies, we currently do not operate in your area.' })
        end
      end
    end
  end
end
