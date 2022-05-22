require 'rails_helper'

module Services
  describe PostcodesCache do
    subject { described_class.new }

    let(:southwark_response) do
      {
        status: 200,
        lsoa: 'Southwark 034A',
        postcode: 'SE17QD'
      }
    end

    describe '#write' do
      context 'when correct method arity' do
        it 'does not raise error when postcode is passed' do
          expect { subject.write('SE17QD') }.to_not raise_error
        end

        it 'does not raises error when postcode and options are passed' do
          expect { subject.write('SE17QD', southwark_response) }.to_not raise_error
        end
      end

      context 'when no values are sent' do
        it 'raises error' do
          expect { subject.write }.to raise_error(ArgumentError)
        end
      end
    end

    describe '#read' do
      it 'returns the cached response for a given postcode' do
        subject.write('SE17QD', southwark_response)

        expect(subject.read('SE17QD')).to match(
          hash_including(southwark_response.merge(expire_at: kind_of(Time)))
        )
      end
    end

    describe '#cleanup' do
      it 'clears expired entries' do
        subject.write('SE17QD', southwark_response.merge(expire_in_seconds: 0))
        subject.cleanup

        expect(subject.read('SE17QD')).to be_nil
      end

      it 'keeps entries that have not expired' do
        subject.write('SE17QD', southwark_response.merge(expire_in_seconds: 500))

        subject.cleanup
        expect(subject.read('SE17QD')).not_to be_nil
      end
    end

    describe '#clear' do
      it 'clears the cache' do
        subject.write('SE17QD', southwark_response)

        subject.clear
        expect(subject.read('SE17QD')).to be_nil
      end
    end

    context 'when there are multiple postcodes' do
      let(:lambeth_response) do
        {
          status: 200,
          lsoa: 'Lambeth 036B',
          postcode: 'SE17QA'
        }
      end

      it 'can read the lsoa for each different postcode' do
        subject.write('SE17QD', southwark_response)
        subject.write('SE17QA', lambeth_response)

        expect(subject.read('SE17QD')).to match(
          hash_including(southwark_response.merge(expire_at: kind_of(Time)))
        )

        expect(subject.read('SE17QA')).to match(
          hash_including(lambeth_response.merge(expire_at: kind_of(Time)))
        )
      end
    end
  end
end
