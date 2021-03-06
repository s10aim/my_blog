class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  has_rich_text :content
  # validates :public, inclusion: { in: [true, false] }
end
