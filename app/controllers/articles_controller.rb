class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :edit, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]


  def index
    @articles = Article.all

    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_content
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_content
    end
  end

  def destroy
    @article.destroy!
  end

  private
    
    def set_article
      @article = Article.find(params.expect(:id))
    end

    def authorize_user!
      render json: { error: "Not authorized" }, status: :forbidden unless @article.user == current_user
    end

    def article_params
      params.expect(article: [ :title, :content ])
    end
end
