class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                    allow_destroy: true,
                                    reject_if: lambda { |attrs| attrs['name'].blank? }
    validates_presence_of :title, :body
    mount_uploader :thub_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    def self.vue
        where(subtitle: 'vue js')
    end
    def self.by_position
        order("position ASC")
    end
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }
end
