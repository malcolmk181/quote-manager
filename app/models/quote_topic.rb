class QuoteTopic < ActiveRecord::Base
    belongs_to :quote
    belongs_to :topic
end