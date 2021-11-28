require 'rails_helper'
#check columns
RSpec.describe User, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:username).of_type(:string) }
      it { should have_db_column(:password).of_type(:string) }
    end
  end
end
#end
#check function
RSpec.describe User, :type => :model do
  context "encode password" do
    it 'encode password' do
      input = '123456789'
      expected_output = '2fc319003c67f1170711c6d956f0fc53'
      output = User.encodepassword(input)
      expect(output).to eq(expected_output)
    end
  end
  context "get user by id" do
    it 'get user with id = 1' do
      input ='1'
      expected_output="demo@gmail.com"
      output = User.getuserid(input)
      expect(output.username).to eq(expected_output)
    end
    it 'get user with id = 4' do
      input ='4'
      expected_output="test@gmail.com"
      output = User.getuserid(input)
      expect(output.username).to eq(expected_output)
    end
  end
  context "Format email" do
    it 'check format email' do
      input = 'abc@gmail.com'
      expected_output = 0
      output = User.is_email_valid?(input)
      expect(output).to eq(expected_output)
    end
    it 'check format email' do
      input = 'abc'
      expected_output = nil
      output = User.is_email_valid?(input)
      expect(output).to eq(expected_output)
    end
  end
  
end
#end