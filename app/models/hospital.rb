class Hospital < ApplicationRecord
  has_many :doctors

  def order_doctors
    doctors.joins(:patients).order("count(patients.*) desc").group("doctors.id")
  end
end
