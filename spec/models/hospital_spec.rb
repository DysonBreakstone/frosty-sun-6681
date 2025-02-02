require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}

  describe "instane methods" do
    before do
      test_data
    end

    it "#order_doctors" do
      @doctor_3.update(hospital_id: @hospital_1.id)
      @doctor_4.update(hospital_id: @hospital_1.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_2.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_4.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_6.id)
      @doctor_4.doctor_patients.create!(patient_id: @patient_1.id)
      @doctor_4.doctor_patients.create!(patient_id: @patient_3.id)
      @doctor_1.doctor_patients.create!(patient_id: @patient_5.id)

      expect(Hospital.first.order_doctors).to eq([@doctor_3, @doctor_4, @doctor_1, @doctor_2])
    end
  end
end
