class Vote < ActiveRecord::Base
  belongs_to :option
  belongs_to :question

  validates_presence_of :option
  validates_presence_of :question
end
