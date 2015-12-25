class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :uuid

      t.timestamps null: false
    end
  end
end
