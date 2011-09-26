class PostsController < ApplicationController
  layout "posts"
  #before_filter :authenticate_user!
  
  # GET /posts
  # GET /posts.json
  def index
    #session[:foo] = 'bar'
    
    @posts = Post.all
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render :json => @posts }
    # end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end
      
    if not @post.nil?
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @post }
      end
    else
      @posts = Post.all
      flash[:notice] = "Post not found"
      #flash.keep(:notice)
      render :index
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
