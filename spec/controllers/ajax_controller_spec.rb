require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
	describe 'Get #vocieup' do
		it "add vocie up when user not login" do
    		post :vocieup,params:{userid:1,idvideo:2}
        expect(response.body).to eq "error"
  	end
	end
  describe 'Get #vociedown' do
    it "add vocie down when user not login" do
        post :vociedown,params:{userid:1,idvideo:2}
        expect(response.body).to eq "error"
    end
  end
end