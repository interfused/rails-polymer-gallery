class MediafilesController < ApplicationController

	def index
		@mediafiles = Mediafile.all
	end

	def new
		@mediafile = Mediafile.new
	end

	def edit
		@mediafile = Mediafile.find(params[:id])
	end

	def create
		#render plain: params[:mediafile].inspect
		@mediafile = Mediafile.new(mediafile_params)

		#if statement added because of validation in mediafile controller
		if @mediafile.save
			redirect_to @mediafile
		else
			render 'new'
		end
	end

	def update
		@mediafile = Mediafile.find(params[:id])

		if @mediafile.update(mediafile_params)
			redirect_to @mediafile
		else
			render 'edit'
		end
	end

	def show
		@mediafile = Mediafile.find(params[:id])
	end

	def destroy
		@mediafile = Mediafile.find(params[:id])
		@mediafile.destroy

		redirect_to mediafiles_path
	end

	private
	def mediafile_params
		params.require(:mediafile).permit(:altText,:description,:imgUrl,:category)
	end

end
