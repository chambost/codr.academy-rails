class Post < ApplicationRecord
belongs_to :user, dependant: :destroy
has_many :comments
#has_one??? :verbalmarks

end
