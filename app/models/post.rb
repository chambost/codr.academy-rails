class Post < ApplicationRecord
belongs_to :user, dependent: :destroy
has_many :comments
has_many :verbal_marks


end
