require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	describe 'Get #index' do
		it "assigns all courses as @movies" do
    		video = FactoryGirl.create(:sharemovie)
    		get :index
    		expect(assigns(:movies)).to include(video)
  		end
  		it "renders the :index view" do
    		get :index
    		expect(response).to render_template :index
  		end
	end
end