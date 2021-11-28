require 'rails_helper'
RSpec.describe Sharemovie, :type => :model do
  context "Get id youtube" do
    it 'get id youtube with url youtube' do
      url = 'https://www.youtube.com/watch?v=BY0DAS56rcQ'
      output = Sharemovie.getyoutubeid(url)
      expect(output).to eq("BY0DAS56rcQ")
    end
    it 'get id youtube with no url youtube' do
      url = ''
      output = Sharemovie.getyoutubeid(url)
      expect(output).to eq(nil)
    end
  end
  
  
end