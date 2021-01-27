class Article < ApplicationRecord
  has_many :comments

  def preview
    return self.content[0..100]+' ...'
  end
end
