class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :gender
      t.text :grade
      t.boolean :attended
      t.belongs_to :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
