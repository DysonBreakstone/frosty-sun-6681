class CreateDoctorPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_patients do |t|
      t.bigint :doctor_id, foreign_key: true
      t.bigint :patient_id, foreign_key: true
      
      t.timestamps
    end
  end
end
