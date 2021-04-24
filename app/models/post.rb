class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    def self.search(search)
        where("content LIKE ?", "%#{search}%")
    end
end
