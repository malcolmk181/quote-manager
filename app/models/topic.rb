class Topic < ActiveRecord::Base
    has_many :quote_topics
    has_many :quotes, through: :quote_topics

    has_many :authors, through: :quotes
end