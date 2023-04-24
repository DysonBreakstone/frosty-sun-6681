class AddEducationToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :education, :string
  end
end
