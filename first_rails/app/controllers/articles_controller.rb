class ArticlesController < ApplicationController
   before_action :authenticate_model! , except: :index 
    def new
        @article = Article.new
        authorize! :create, @article
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(detect_article.merge(model_id: current_model.id))
        authorize! :create, @article
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
        authorize! :update, @article
    end

    def update
        @article = Article.find(params[:id])
        authorize! :update, @article
        if @article.update(detect_article)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy 
        @article = Article.find(params[:id])
        authorize! :destroy, @article
        @article.destroy
        redirect_to articles_path
    end

    private
    def detect_article
        params.require(:article).permit(:title, :text)   
    end
end
