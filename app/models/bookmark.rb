class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user, optional: true

  has_many :likes, dependent: :destroy

  validates :url, length: { minimum: 4 }, presence: true  #just a simple validation for now
end
