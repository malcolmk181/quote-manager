class Topic < ActiveRecord::Base
    has_many :quotes_topics
    has_many :quotes, through: :quotes_topics
    
    has_many :authors, through: :quotes
end