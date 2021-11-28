require "uri"
require "net/http"
class SharemoviesController < ApplicationController
	def addsharenew
		if session[:userid].to_i>0
			if params[:urlyoutube].to_s!=""
				idyoutube=Sharemovie.getyoutubeid(params[:urlyoutube].to_s)
				url = URI("https://www.googleapis.com/youtube/v3/videos?id=#{idyoutube.to_s}&key=AIzaSyCeiAFlkUhwXC0wS02omch4KNYrTFehIDU&part=snippet,contentDetails,statistics,status")
			    https = Net::HTTP.new(url.host, url.port);
			    https.use_ssl = true
			    request = Net::HTTP::Get.new(url.request_uri)
			  
			    request["Content-Type"] = "application/json"
			   
			    response = https.request(request)
			    json_data =  ActiveSupport::JSON.decode(response.read_body)
			    if json_data["items"].length>0
			    	title=json_data["items"][0]["snippet"]["title"].to_s
			    	description=json_data["items"][0]["snippet"]["description"].to_s
			    	numberlike=json_data["items"][0]["statistics"]["likeCount"].to_i
			    	numberdislike=json_data["items"][0]["statistics"]["dislikeCount"].to_i
			    	Sharemovie.create(title:title.to_s,iduser:session[:userid].to_i,
					description:description.to_s,numberlike:numberlike,
					numberdislink:numberdislike,idyoutube:idyoutube.to_s)
					redirect_to  :controller=>'home', :action=>"index"
			    end
				
			end
			
		end
	end
	
	
end