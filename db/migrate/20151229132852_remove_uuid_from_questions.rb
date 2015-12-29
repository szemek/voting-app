class RemoveUuidFromQuestions < ActiveRecord::Migration
  def up
    remove_column(:questions, :uuid)
  end

  def down
    add_column(:questions, :uuid, :string)
  end
end
