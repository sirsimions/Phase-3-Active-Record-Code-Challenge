class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews 

    def favorite_product
        fav= self.reviews.order(:star_rating)
        fav.last
    end

    def remove_reviews(product)
        self.reviews.where(product: product).destroy_all
    end
end