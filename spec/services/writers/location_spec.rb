RSpec.describe Writers::Location do

  let(:data) { YAML.load(IO.binread('spec/fixtures/writers/location.yml')).with_indifferent_access }
  let(:subject) { Writers::Location.new(data) }

  describe '#call' do
    context 'New location' do
      context 'New state' do
        it 'creates location record' do
          subject.call!
          location = Location.last
  
          expect(location.name).to eql data[:name]
          expect(location.state.name).to eql data[:state]
          expect(location.latlon.lat).to eql data[:lat]
          expect(location.latlon.lon).to eql data[:lon]
        end
      end

      context 'Existing state' do
        let!(:existing_state) { create(:state, name: 'Delhi') }

        it 'creates location record and associates with existing state' do
          subject.call!
          location = Location.last
  
          expect(location.name).to eql data[:name]
          expect(location.state.name).to eql data[:state]
          expect(location.latlon.lat).to eql data[:lat]
          expect(location.latlon.lon).to eql data[:lon]
          expect(location.state_id).to eql existing_state.id
        end
      end
    end

    context 'Existing location' do
      let!(:existing_location) { create(:location) }

      before do
        data[:lat] = 51.0
        data[:lon] = 51.0
      end

      it 'updates location record' do
        subject.call!
        location = Location.last

        expect(location.id).to eql existing_location.id
        expect(location.name).to eql data[:name]
        expect(location.latlon.lat).to eql 51.0
        expect(location.latlon.lon).to eql 51.0
      end
    end
  end
end