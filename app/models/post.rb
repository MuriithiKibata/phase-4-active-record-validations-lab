class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {within: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    def is_clickbait
        if title == "True Facts"
            errors.add(:title, "Title is Invalid")
        end
    end
end
