require 'rails_helper'

RSpec.describe "patients index page", type: :feature do
  describe 'display' do
    before do
      test_data
    end

    it "shows doctors ordered by # of patients" do
      @doctor_3.update(hospital_id: @hospital_1.id)
      @doctor_4.update(hospital_id: @hospital_1.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_2.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_4.id)
      @doctor_3.doctor_patients.create!(patient_id: @patient_6.id)
      @doctor_4.doctor_patients.create!(patient_id: @patient_1.id)
      @doctor_4.doctor_patients.create!(patient_id: @patient_3.id)
      @doctor_1.doctor_patients.create!(patient_id: @patient_5.id)
    
      visit hospital_path(@hospital_1)

      within("#doctors") do
        expect(page).to have_content("Doctors:")
        expect("Doctor 3 - Patients: 7").to appear_before("Doctor 4 - Patients: 6")
        expect("Doctor 4 - Patients: 6").to appear_before("Doctor 1 - Patients: 5")
        expect("Doctor 1 - Patients: 5").to appear_before("Doctor 2 - Patients: 4")
      end

    end
  end
end
