class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one_attached :image

    def self.search(search)
        where("title LIKE ?", "%#{search}%")
    end
end
