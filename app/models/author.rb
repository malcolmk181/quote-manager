class Author < ActiveRecord::Base
    has_many :quotes
    has_many :topics, through: :quotes
end