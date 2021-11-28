class AjaxController < ApplicationController
	def vocieup
		if session[:userid].to_i!=0
			iduser=session[:userid].to_i
			datacheck=Countlike.where(["iduser = ? and idvideo = ? and numberlike !=0",iduser.to_i,params[:idvideo].to_i]).order("id desc")
			if datacheck.length<=0
				Countlike.create(iduser:iduser,idvideo:params[:idvideo].to_i,numberlike:1,numberdislink:0)
				updatesavevideo = Sharemovie.find_by(id: params[:idvideo].to_i)
				updatesavevideo.numberlike = updatesavevideo.numberlike + 1
				updatesavevideo.save
				render plain: "success"
			else
				render plain: "exits"
			end
		else
			render plain: "error"
			
		end
		
	end
	def vociedown
		if session[:userid].to_i!=0
			iduser=session[:userid].to_i
			datacheck=Countlike.where(["iduser = ? and idvideo = ? and numberdislink !=0",iduser.to_i,params[:idvideo].to_i]).order("id desc")
			if datacheck.length<=0
				Countlike.create(iduser:iduser,idvideo:params[:idvideo].to_i,numberlike:0,numberdislink:1)
				updatesavevideo = Sharemovie.find_by(id: params[:idvideo].to_i)
				updatesavevideo.numberdislink = updatesavevideo.numberdislink + 1
				updatesavevideo.save
				render plain: "success"
			else
				render plain: "exits"
			end
			
		else
			render plain: "error"
		end
		
	end
end