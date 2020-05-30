class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  # validates :public, inclusion: { in: [true, false] }
end
