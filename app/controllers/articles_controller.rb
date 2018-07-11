class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new 
	end

	def edit
		@article = Article.find(params[:id])
	end


	def create #used for new
		 @article = Article.new(article_params)#cannot directly send through params so method used
		 if @article.save
		 	flash[:notice] = "Article Saved!!"
		 	redirect_to article_path(@article)#If article is saved then redirect to article_path ie show.html.erb
		 else
		 	render 'new'
		 end
	end

	def update #used for edit
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end


	def show 
		@article = Article.find(params[:id])#use id to show the article that was just saved
	end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Deleted"
		redirect_to articles_path
	end
	
	private
		def article_params
			params.require(:article).permit(:title, :description)#whitelist the params		
		end
 
end
