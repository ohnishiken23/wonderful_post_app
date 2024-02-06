class ArticlesController < ApplicationController
  def index
    # Task.7-3 レコードの取得 20240205 Ohnishi
    @articles = Article.all
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

  # Task.7-3 createメソッドの作成 20240205 Ohnishi
  def create
    # インスタンス変数をmodelから作成する
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    # インスタンス変数をDBに保存する
    # @article.save! これいらないの？

    # 値を返す 今回はviewsで返す？
  end
  #**********************************************

  # Task.7-3 updateメソッドの作成 20240205 Ohnishi
  # def update
    # 対象のレコードを探す
    # @article = Article.find(params[:id])

    # 探して来たレコードに対して変更を行う
    # @article.update!(article_params)

    # 値を返す 今回はviewsで返す？
  # end
  #**********************************************

  # Task.7-3 deleteメソッドの作成 20240205 Ohnishi
  # def destroy
    # 対象のレコードを探す
    # @article = Article.find(params[:id])

    # 探して来たレコードを削除する
    # @article.destroy!

    # 値を返す 今回はviewsで返す？
  # end
  #**********************************************

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
