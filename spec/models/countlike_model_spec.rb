require 'rails_helper'
RSpec.describe Countlike, :type => :model do
  context "Check user like" do
    it 'checkcountuser' do
      id_video = '3'
      id_user= "1"
      output = Countlike.checkcountuser(id_user,id_video)
      expect(output).to include(Countlike)
    end
  end
  
  
end