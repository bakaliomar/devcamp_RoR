class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destory]
    layout "portfolio"
    access all: [:show, :index, :ruby_on_rails, :vue], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

    def index
        @portfolio_items= Portfolio.by_position
    end
    def sort
        params[:order].each do |key, value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end
        render nothing: true
    end
    def vue
        @vue_portfolio_items= Portfolio.vue 
    end
    def ruby_on_rails
        @ruby_on_rails_portfolio_items= Portfolio.ruby_on_rails
    end
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    def create
        @portfolio_item = Portfolio.new(portfolio_param)

        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end
    def edit 
    end
    def update   
        respond_to do |format|
            if @portfolio_item.update(portfolio_param)
              format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
            else
              format.html { render :edit }
            end
          end
    end
    def show       
    end
    def destroy
        @portfolio_item.destroy
        respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully Deleted.' }
        end
    end
    private
    def portfolio_param
        params.require(:portfolio).permit(:title,
                                          :subtitle, 
                                          :body,
                                          :main_image,
                                          :thub_image,
                                          technologies_attributes: [:name]
                                          )
    end
    def set_portfolio_item
        @portfolio_item= Portfolio.find(params[:id])
    end
end
