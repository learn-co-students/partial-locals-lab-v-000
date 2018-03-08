class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :hometown
      t.datetime :birthday

      t.timestamps null: false
    end
  end
end
