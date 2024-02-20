class MypageController < ApplicationController
  def show
    articles = current_user.articles.all
    articles = articles.where('articles.title LIKE(?)', "%#{params[:title]}%")
    @articles = articles.page params[:page]
  end
end
