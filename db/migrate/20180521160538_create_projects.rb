class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :descriptive
      t.string :languages, :array
      t.string :links, :array

      t.timestamps
    end
  end
end
