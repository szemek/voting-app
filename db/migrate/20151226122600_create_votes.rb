class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :question
      t.belongs_to :option
    end
  end
end
