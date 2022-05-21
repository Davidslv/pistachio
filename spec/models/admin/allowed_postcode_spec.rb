require 'rails_helper'

RSpec.describe Admin::AllowedPostcode, type: :model do
  subject { described_class.new(attributes) }

  let(:attributes) { {} }

  describe '#save' do
    context 'when postcode is empty' do
      it { expect(subject.save).to be(false) }
    end

    context 'when postcode is empty string' do
      let(:attributes) { super().merge(postcode: '') }

      it { expect(subject.save).to be(false) }
    end

    context 'when postcode is valid' do

      context 'without whitespace' do
        let(:attributes) { super().merge(postcode: 'SH241AA') }

        it { expect(subject.save).to be(true) }
      end

      context 'with whitespace' do
        let(:attributes) { super().merge(postcode: 'SH24 1AA') }

        it { expect(subject.save).to be(true) }
      end

      context 'when saving the same postcode more than once' do
        let(:attributes) { super().merge(postcode: 'SH24 1AA') }

        before do
          subject.save
        end

        it 'returns false on second insert' do
          expect(described_class.new(attributes).save).to be(false)
        end

        it 'returns error' do
          resource = described_class.new(attributes)
          resource.save

          expect(resource.errors.messages[:postcode]).to eq(['has already been taken'])
        end
      end
    end
  end
end
