class Portfolio < ApplicationRecord
    validates_presence_of :title, :body,:main_image, :thub_image
    def self.vue
        where(subtitle: 'vue js')
    end
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }
end
