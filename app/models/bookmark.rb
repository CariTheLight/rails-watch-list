class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_uniqueness_of :movie_id, scope: :movie_list_id, message: 'This movie is already bookmarked in this list.'
  validates :movie_id, :movie_list_id, presence: true
end
