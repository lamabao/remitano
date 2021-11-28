require 'rails_helper'

RSpec.describe UserController, type: :controller do
	
  describe 'POST addnewuser' do
	 context "with valid attributes" do
	    it "creates a new user" do
	      expect{
	        post :addnewuser,params:FactoryGirl.attributes_for(:user)
	      }.to change(User,:count).by(1)

	    end

	    it "redirects to the user register" do
	      post :addnewuser, params:FactoryGirl.attributes_for(:user)
	      expect(response).to redirect_to user_register_path
	    end

	    it 'is expected to set flash message' do
	    	post :addnewuser, params: FactoryGirl.attributes_for(:user)
        	expect(flash[:quicknotice]).to eq("<div class='alert alert-success'><strong>Success!</strong> Account successfully created, please login.</div>")
      	end
	 end

	context "with invalid attributes" do
	    it "does not save the new user" do
	      expect{
	        post :addnewuser, params: FactoryGirl.attributes_for(:invalid_user)
	      }.to_not change(User,:count)
	    end
	    it "redirects to the user register" do
	      post :addnewuser, params:FactoryGirl.attributes_for(:invalid_user)
	      expect(response).to redirect_to user_register_path
	    end

	    it "is expected to set flash message" do
	      post :addnewuser, params: FactoryGirl.attributes_for(:invalid_user)
	      expect(flash[:quicknotice]).to eq("<div class='alert alert-danger'><strong>Warning!</strong> Please enter username and password.</div>")
	    end
  	end 

  	context "with invalid attributes with email" do
	    it "does not save the new user" do
	      expect{
	        post :addnewuser, params: FactoryGirl.attributes_for(:invalid_useremail)
	      }.to_not change(User,:count)
	    end
	    it "redirects to the user register" do
	      post :addnewuser, params:FactoryGirl.attributes_for(:invalid_useremail)
	      expect(response).to redirect_to user_register_path
	    end

	    it "is expected to set flash message" do
	      post :addnewuser, params: FactoryGirl.attributes_for(:invalid_useremail)
	      expect(flash[:quicknotice]).to eq("<div class='alert alert-danger'><strong>Warning!</strong> Email invalidate.</div>")
	    end
  	end
  end

  # check login
  describe 'POST checklogin' do
  	context "with valid attributes" do
	    it "Get user with username:demo@gmail.com and password: 123456789 login success" do
	      user=FactoryGirl.attributes_for(:userloginsucess)
	      post :checklogin, params:user
	      expect(flash[:quicknotice]).to eq("Login sucess")
	    end

	    it "Get user with username:demo@gmail.com and password: 1234567890 login error" do
	      user=FactoryGirl.attributes_for(:userloginerror)
	      post :checklogin, params:user
	      expect(flash[:quicknotice]).to eq("Login error")
	    end
	    it "redirects to the home page" do
	      post :checklogin, params:FactoryGirl.attributes_for(:userloginsucess)
	      expect(response.status).to eq(302)
	    end

	    it "redirects to the home page" do
	      post :checklogin, params:FactoryGirl.attributes_for(:userloginerror)
	       expect(response.status).to eq(302)
	    end
	end

	context "with invalid attributes" do
	    it "Get user with account invalid" do
	      user=FactoryGirl.attributes_for(:invalid_user)
	      post :checklogin, params:user
	      expect(flash[:quicknotice]).to eq("Please enter username and password.")
	    end
	    it "redirects to the home page" do
	      post :checklogin, params:FactoryGirl.attributes_for(:invalid_user)
	       expect(response.status).to eq(302)
	    end
	end


	context "with invalid attributes with email" do
	    it "Get user with email invalid" do
	     user=FactoryGirl.attributes_for(:invalid_useremail)
	     post :checklogin, params:user
	      expect(flash[:quicknotice]).to eq("Email invalidate.")
	    end
	  
	    it "redirects to the home page" do
	      post :checklogin, params:FactoryGirl.attributes_for(:userloginerror)
	       expect(response.status).to eq(302)
	    end
  	end

  end
 #logout
  describe 'GET logout' do
  	it 'allows user to log out' do
    	get :logout
    	session.should be_empty
  	end
  	it "redirects to the home page" do
  		get :logout
    	expect(response.status).to eq(302)
  	end
  end


end