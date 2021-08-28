class Like < ApplicationRecord

  belongs_to :user
  belongs_to :success
  belongs_to :message
  belongs_to :emotion

end
