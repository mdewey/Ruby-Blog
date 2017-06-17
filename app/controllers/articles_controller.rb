class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def index
      @articles = Article.all
    end

    def edit
      @article = Article.find(params[:id])
    end

    def destroy
      @article =  Article.find(params[:id])
      @article.destroy
      redirect_to action: "index"
    end
    

    def update
       @article = Article.find(params[:id])
       if @article.update(article_params)
         redirect_to action: "index"
       else
          render "edit"
       end
    end

    def show
      @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)

        if @article.save
          redirect_to action: "index" 
        else
          render 'new'
        end
    end

    private
      def article_params
        params.require(:article).permit(:text, :title)
      end

    
end
