class Post < ApplicationRecord
  # establish one to many relation to models/comment.rb
  has_many :comments
end
