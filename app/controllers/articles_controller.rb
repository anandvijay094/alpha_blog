class ArticlesController < ApplicationController
  def show
    @article=Article.find(params[:id])
  end

  def list
    @articles=Article.all
  end
end