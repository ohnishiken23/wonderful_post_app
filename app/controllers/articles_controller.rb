class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_article, only: %i[edit update destroy]

  def index
    articles = Article.all
    articles = articles.where('title LIKE ?', "%#{params[:title]}%")
    @articles = articles.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "記事が作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "記事が更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "記事が削除されました。"
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, tag_ids:[])
    end
end
