class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(param[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    
    

    private 
        def comment_params
            params.require(:comment).permit(:commeter, :body)
        end
        

end
