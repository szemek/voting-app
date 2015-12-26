class Option < ActiveRecord::Base
  belongs_to :question
  has_many :votes
  validates_presence_of :title
end
