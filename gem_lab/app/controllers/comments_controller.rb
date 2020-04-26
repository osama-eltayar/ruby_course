class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(detect_comment)
        redirect_to article_path(@article)
    end
    def destroy
         @article = Article.find(params[:article_id])
        Comment.find(params[:id]).destroy
        redirect_to article_path(@article)
    end
 
    private
        def detect_comment
            params.require(:comment).permit(:commentor, :body)
        end    
end
