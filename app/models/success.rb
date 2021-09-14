class Success < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
  end

  belongs_to :user
  has_many   :likes, dependent: :destroy
  has_many   :users, through: :likes
  
end
