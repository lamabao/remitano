
class HomeController < ApplicationController
	def index
		#@movies = Sharemovie.all.order('id DESC')
		@movies = Sharemovie.paginate(:page => params[:page], :per_page => 20).order('id DESC')
	end
end