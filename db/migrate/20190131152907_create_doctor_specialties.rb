class CreateDoctorSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_specialties do |t|
      t.belongs_to :specialty, index: true
      t.belongs_to :doctor, index: true
    end
  end
end
