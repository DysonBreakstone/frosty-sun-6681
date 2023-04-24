require 'rails_helper'

RSpec.describe "patients index page", type: :feature do
  describe 'display' do
    before do
      test_data
    end

    it "shows all patients over 18" do
      visit patients_path

      expect(page).to have_content("All Patients over the age of 18:")

      pt_over_18 = [@patient_2, @patient_4, @patient_6, @patient_8]
      pt_not_over_18 = [@patient_1, @patient_3, @patient_5, @patient_7]

      pt_over_18.each do |pt|
        expect(page).to have_content(pt.name)
      end

      pt_not_over_18.each do |pt|
        expect(page).to have_no_content(pt.name)
      end
    end

    it "alphabetical order" do
      @patient_2.update(name: "charlie")
      @patient_4.update(name: "Brian")
      @patient_6.update(name: "Darren")
      @patient_8.update(name: "atticus")

      visit patients_path

      expect("atticus").to appear_before("Brian")
      expect("Brian").to appear_before("charlie")
      expect("charlie").to appear_before("Darren")
    end
  end
end
