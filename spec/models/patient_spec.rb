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
      expect(Patient.over_18).to eq([@patient_2, @patient_4, @patient_6, @patient_8])
    end
  end
end