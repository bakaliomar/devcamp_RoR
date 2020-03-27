module Placeholder
    extend ActiveSupport::Concern
    def self.image_generator(height:, width:)
        "https://via.placeholder.com/#{height}x#{width}.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide"
    end
end