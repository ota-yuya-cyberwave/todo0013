class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false, default: "", limit: 64
      t.belongs_to :user
      t.belongs_to :category
      t.text :content, null: false
      t.datetime :start_at, null: false, default: -> { "NOW()" }
      t.datetime :completed_at, null: true
  
      t.timestamps
    end
  end
end
