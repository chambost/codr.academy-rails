class Post < ApplicationRecord
belongs_to :user, dependent: :destroy
has_many :comments
has_many :verbal_marks

include PgSearch::Model 
pg_search_scope :post_search,
  against: [:title, :content ],
  
  using: {
    tsearch: {
              negation: true, # support negation, for example in url, /posts?search[word]=!word_to_be_excluded
              highlight: {
                StartSel: '<b>',
                StopSel: '</b>',
                HighLightAll: true
              }
            }
    
    
  }


  # for using dmetaphone search (like a fuzzy search), in postgresql, write query: 
  # CREATE EXTENSION fuzzystrmatch;
  # rails g pg_search:migration:dmetaphone
  # rails db:migrate
  # using: :dmetaphone


end
