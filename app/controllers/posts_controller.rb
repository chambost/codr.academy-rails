class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    if params["search"]
      # url appending: /posts?search[word]=word_to_be_searched
      # url appending: /posts?search[word]=[word1_to_be_searched,word2_to_be_searched]
      @filter = params["search"]["word"]
      @posts = Post.all.post_search("#{@filter}")
    else
      @posts = Post.all
    end
    respond_to do |format|
      format.html
      format.js
    end  
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
if @post.user_id != current_user.id
  redirect_to posts_path, notice: "not allowed"
end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(post_params)

    # for picture attachments (attaching picture to the model)
    @post.picture.attach(params[:post][:picture])
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
       format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # attach pic via an update
    @post.picture.attach(params[:post][:picture])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # new search page is moving to '/search' as another controller
  # def search
  #   # redirect_to "/posts/search"
    
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :edited, :time)
    end
end
