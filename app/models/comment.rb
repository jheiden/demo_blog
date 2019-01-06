class Comment < ApplicationRecord
  # establish relation to models/post.rb
  belongs_to :post
end
