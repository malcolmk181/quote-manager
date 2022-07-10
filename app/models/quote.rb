class Quote < ActiveRecord::Base
    belongs_to :author
    has_many :quote_topics
    has_many :topics, through: :quote_topics

    def topic_names
        topics.map(&:name).join(", ")
    end
end