class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    def self.search(search)
        where("title LIKE ?", "%#{search}%")
    end
end
