class CommentsController < ApplicationController

	#security per section 9 of http://guides.rubyonrails.org/getting_started.html#using-partials-to-clean-up-duplication-in-views
	#http_basic_authenticate_with name: "jeremy", password: "jeremy123", only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
