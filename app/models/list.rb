class List < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :bookmarks, dependent: :destroy
    has_many :movies, through: :bookmarks

    before_destroy :delete_associated_bookmarks

    private

  def delete_associated_bookmarks
    bookmarks.destroy_all
  end
end
