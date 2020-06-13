module PortfoliosHelper

    def image_generator(height:, width:)
        "https://via.placeholder.com/#{height}x#{width}.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide"
    end
    def portfolio_img img, type
        if img.model.main_image? || img.model.thub_image?
            img
        elsif type == 'thumb'
            image_generator(height: '358', width: '250')
        elsif type == 'main'
            image_generator(height: '600', width: '400')
        end
    end
end
