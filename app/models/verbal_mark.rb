class VerbalMark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  # /^([a-z]{1,30}){1}(_{1}[a-z]{1,30}){,1}(_{1}[a-z]{1,30}){,1}\Z/
  validates :verbal_mark, format: { with: /\A([a-z]{1,30}){1}(_{1}[a-z]{1,30}){,1}(_{1}[a-z]{1,30}){,1}\Z/, message: "Each verbal_mark should be in lowercase, snake_case, 3 words at most, 30 letters at most for each word."}
end
