RSpec.describe Location, type: :model do
  let(:subject) { create(:location) }

  it 'should validate the presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the uniqueness of name' do
    subject.save
    new_location = subject.dup
    expect(new_location).to_not be_valid
  end

  it 'should validate the presence of state' do
    subject.state = nil
    expect(subject).to_not be_valid
  end
end