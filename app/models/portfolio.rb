class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                    reject_if: lambda { |attrs| attrs['name'].blank? }
    include Placeholder
    validates_presence_of :title, :body,:main_image, :thub_image
    mount_uploader :thub_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    def self.vue
        where(subtitle: 'vue js')
    end
    def self.by_position
        order("position ASC")
    end
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby On Rails') }

    after_initialize :set_defaults
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thub_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
