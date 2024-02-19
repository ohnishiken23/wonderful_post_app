class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_article, only: %i[edit update destroy]

  def index
    # Task.7-3 レコードの取得 20240205 Ohnishi
    @articles = Article.all.page params[:page]
    #***************************************
  end

  # Task.7-3 showメソッドの作成 20240205 Ohnishi
  def show
    @article = Article.find(params[:id])
  end
  #*******************************************

  # Task.7-3 newメソッドの作成 20240206 Ohnishi
  def new
    @article = Article.new
  end
  #******************************************

  # Task.7-4 editメソッドの作成 20240207 Ohnishi
  def edit
  end
  #*******************************************

  # Task.7-3 createメソッドの作成 20240205 Ohnishi
  def create
    # インスタンス変数をmodelから作成する
    @article = current_user.articles.new(article_params)
    if @article.save
      # redirect_to @article, notice: "Article was successfully created."
      redirect_to @article, notice: "記事が作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
    # インスタンス変数をDBに保存する
    # @article.save! これいらないの？

    # 値を返す 今回はviewsで返す？
  end
  #**********************************************


  # Task.7-4 updateメソッドの作成 20240207 Ohnishi
  def update
    if @article.update(article_params)
      # redirect_to @article, notice: "Article was successfully updated."
      redirect_to @article, notice: "記事が更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  #**********************************************

  # Task.7-5 deleteメソッドの作成 20240208 Ohnishi
  def destroy
    @article.destroy
    # redirect_to articles_url, notice: "Article was successfully destroyed."
    redirect_to articles_url, notice: "記事が削除されました。"
  end
  #**********************************************

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
