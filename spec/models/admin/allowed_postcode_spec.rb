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
    end
  end
end
