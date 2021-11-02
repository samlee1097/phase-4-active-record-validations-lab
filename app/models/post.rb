class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, :length => {:minimum => 250}
    validates :summary, :length => {:maximum => 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :is_clickbait

      def is_clickbait
        if title
            unless title.match?(/Won't Believe|Secret|Guess/)
                errors.add(:title, "Not Clickbait")
            end
        end
    end

end
