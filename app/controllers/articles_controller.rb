class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new 
	end

	def edit
	end


	def create #used for new
	     #debugger
		 @article = Article.new(article_params)#cannot directly send through params so method used
		 @article.user = User.first
		 if @article.save
		 	flash[:success] = "Article Saved!!"
		 	redirect_to article_path(@article)#If article is saved then redirect to article_path ie show.html.erb
		 else
		 	render 'new'
		 end
	end

	def update #used for edit
		if @article.update(article_params)
			flash[:success] = "Article Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end


	def show 
	end


	def destroy
		@article.destroy
		flash[:danger] = "Deleted"
		redirect_to articles_path
	end

	private
		def set_article
			@article = Article.find(params[:id])	
		end
		
		def article_params
			params.require(:article).permit(:title, :description)#whitelist the params		
		end
 
end
