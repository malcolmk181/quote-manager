class Quote < ActiveRecord::Base
    belongs_to :author
    belongs_to :topic
end