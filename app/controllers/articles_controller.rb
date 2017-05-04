class ArticlesController < ApplicationController

	#security per section 9 of http://guides.rubyonrails.org/getting_started.html#using-partials-to-clean-up-duplication-in-views
	#http_basic_authenticate_with name: "jeremy", password: "jeremy123", except: [:index, :show]

	#various methods for this controller which should show in the 3rd column of the terminal command "bin/rails routes"

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		#if statement added because of validation in article controller
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title,:text)
	end
end
