class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_a_clickbait
    validate :sufficiently_clickbaity

    def title_is_a_clickbait
        if self.title === "True Facts"
            errors.add(:title, "Title cannot be a clickbait")
        end
    end

    def sufficiently_clickbaity
        # if self.title.exclude? { in %w("Won't Believe" "Secret" "Guess" "Top")}
        #     errors.add(:title, "Title is not clickybaity enough")
        # end
    end

end
