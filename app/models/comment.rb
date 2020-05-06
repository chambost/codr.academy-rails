class Comment < ApplicationRecord
    # i think it belongs to post and not user as if the post doesnt exist neither does the comment. luke
belongs_to :post
belongs_to :user  #, dependant: :destroy not needed becuase no user = no post already
has_many :verbal_marks

end
