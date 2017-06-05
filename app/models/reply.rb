class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :comment, :foreign_key => "reply_id"
end
