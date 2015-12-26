class Question < ActiveRecord::Base
  has_many :options, dependent: :delete_all
  has_many :votes, dependent: :delete_all
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :title
  validates_presence_of :options

  scope :recent, -> { order('created_at DESC').last(10) }
end
