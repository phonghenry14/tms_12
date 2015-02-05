class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.integer :index
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :subjects
  end
end
