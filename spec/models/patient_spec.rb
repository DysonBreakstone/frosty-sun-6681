require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do
    before do
      test_data
    end

    it "::over_18" do
      @patient_2.update(name: "charlie")
      @patient_4.update(name: "Brian")
      @patient_6.update(name: "Darren")
      @patient_8.update(name: "atticus")
      expect(Patient.over_18).to eq([@patient_8, @patient_4, @patient_2, @patient_6 ])
    end
  end
end