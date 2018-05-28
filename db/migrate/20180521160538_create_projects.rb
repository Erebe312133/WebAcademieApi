class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :descriptive

      t.timestamps
    end

    create_table :links do |t|
      t.belongs_to :project, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end

    create_table :languages do |t|
      t.belongs_to :project, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
