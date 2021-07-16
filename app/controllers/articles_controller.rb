class ArticlesController < ApplicationController
  def show
    @article=Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end
  
  def create
    @article=Article.new(params.require( :article).permit(:Title , :Description , :author))
    if @article.save
      redirect_to articles_path()
      flash[:notice]="Articles saved sucessfully."
    else
      render 'new'
    end
  end

end