class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, length: {maximum: 140},
                      presence: true
  paginates_per 5
end
