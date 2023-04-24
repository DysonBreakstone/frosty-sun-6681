require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe "instance methods" do
    before do
      test_data
    end

    it "#pt_num" do
      expect(@doctor_1.pt_num).to eq(4)

      @doctor_1.doctor_patients.create!(patient_id: @patient_5.id)

      expect(@doctor_1.pt_num).to eq(5)
    end
  end
end
