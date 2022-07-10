class Quote < ActiveRecord::Base
    belongs_to :author
    has_many :quotes_topics
    has_many :topics, through: :quotes_topics
end