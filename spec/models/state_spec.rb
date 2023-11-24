RSpec.describe State, type: :model do
  let(:subject) { create(:state) }

  it 'should validate the presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end