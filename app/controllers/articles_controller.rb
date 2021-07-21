class ArticlesController < ApplicationController
  before_action :ArticleById , only: [ :show , :edit , :update , :destroy]

  def show
  end

  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end
  
  def create
    @article=Article.new(permitted_fields)
    if @article.save
      redirect_to articles_path()
      flash[:notice]="Articles saved sucessfully."
    else
      render 'new'
    end
  end
  def edit
  end

  def update
      if @article.update(permitted_fields)
          redirect_to articles_path()
          flash[:notice]="Articles updated sucessfully."
      else
        render 'edit'
      end
  end


  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def ArticleById
    @article=Article.find(params[:id])
  end

  def permitted_fields
    params.require(:article).permit(:Title , :Description , :author)
  end

end