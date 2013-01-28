class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article= Article.new
  end
  def create 
     #raise params.inspect
    @article= Article.new(params[:article])
    @article.save
    flash.notice = "El articulo '#{@article.title}' fue creado"
    redirect_to article_path(@article)
  end
  def destroy 
    @article= Article.find(params[:id])
    flash.notice= "El articulo '#{@article.title}' fue borrado"
    @article.destroy
    
    redirect_to articles_path
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash.notice = "Articulo '#{@article.title}' actualizado"
    redirect_to article_path(@article)
  end


end
