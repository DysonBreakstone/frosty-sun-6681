require 'rails_helper'

RSpec.describe "doctor show page", type: :feature do
  describe 'display' do
    before do
      test_data
    end

    it "doctor information" do
      visit doctor_path(@doctor_1)

      expect(page).to have_content("Doctor 1")
      expect(page).to have_content("Specialty: Specialty 1")
      expect(page).to have_content("Education: University 1")
      expect(page).to have_content("Hospital: Hospital 1")

      within("#patients") do
        expect(page).to have_content("Patients:")
        expect(page).to have_content("Patient 1")
        expect(page).to have_content("Patient 2")
        expect(page).to have_content("Patient 3")
        expect(page).to have_content("Patient 4")
      end

      expect(page).to have_no_content("Doctor 2")
      expect(page).to have_no_content("Patient 7")
      expect(page).to have_no_content("University 3")
      expect(page).to have_no_content("Hospital 2")
    end
  end

  describe "links and buttons" do
    before do
      test_data
    end

    it "delete button next to patients" do
      visit doctor_path(@doctor_2)

      within("#patients") do
        expect(page).to have_content(@patient_5.name)
        expect(page).to have_content(@patient_6.name)
        expect(page.all(:button, "Remove this patient").count).to eq(4)
      end

      click_button "delete_#{@patient_5.id}"

      within("#patients") do
        expect(page).to have_no_content(@patient_5.name)
        expect(page).to have_content(@patient_6.name)
        expect(page.all(:button, "Remove this patient").count).to eq(3)
      end

      click_button "delete_#{@patient_6.id}"

      within("#patients") do
        expect(page).to have_no_content(@patient_5.name)
        expect(page).to have_no_content(@patient_6.name)
        expect(page.all(:button, "Remove this patient").count).to eq(2)
      end
    end
  end
end