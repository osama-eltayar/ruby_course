class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(detect_article)
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
        
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(detect_article)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy 
        Article.find(params[:id]).destroy
        redirect_to articles_path
    end

    private
    def detect_article
        params.require(:article).permit(:title, :text)   
    end
end
