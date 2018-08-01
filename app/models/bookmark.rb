class Bookmark < ApplicationRecord
  belongs_to :topic

  validates :url, length: { minimum: 4 }, presence: true  #just a simple validation for now
end
