class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.text :name
      t.text :age
      t.boolean :visited

      t.timestamps
    end
  end
end
