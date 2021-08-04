class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false, default: "", limit: 64
      t.belongs_to :user

      t.timestamps
    end
  end
end
