class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :toggel_status]
  layout "blog"
  access all: [:show], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def show
    if logged_in? :site_admin
      @blogs = @topic.blogs.recent.paginate(page: params[:page], per_page: 5)
    else
      @blogs = @topic.blogs.published.recent.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @topic = Topic.new
  end

  def edit
  end
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, notice: @topic.errors }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_topic
      @topic = Topic.find(params[:id])
    end
    def topic_params
      params.require(:topic).permit(:title)
    end
end
