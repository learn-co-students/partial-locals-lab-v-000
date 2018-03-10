require "rails_helper"

RSpec.describe "Student" do
  describe 'search' do
    let(:student_names) { ['Bob', 'Robert', 'Roberta', 'Shirley', 'Shelby'] }

    before do
      student_names.each do |name|
        Student.create(name: name, hometown: Faker::Address.city, birthday: Faker::Date.between(25.years.ago, 18.years.ago))
      end
    end

    context 'when it receives an empty search argument' do
      it 'returns all students' do
        expect(Student.search('').count).to eq(Student.all.count)
      end
    end



  end
end
