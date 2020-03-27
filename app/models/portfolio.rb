class Portfolio < ApplicationRecord
    validates_presence_of :title, :body,:main_image, :thub_image
    def self.vue
        where(subtitle: 'vue js')
    end
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }

    after_initialize :set_defaults
    def set_defaults
        self.main_image ||= "https://via.placeholder.com/600x400.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide"
        self.thub_image ||= "https://via.placeholder.com/350x200.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide"
    end
end
