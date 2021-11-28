class Countlike < ApplicationRecord
	def self.checkcountuser(id,idvideo)
		data=Countlike.where(["iduser=? and idvideo=?",id,idvideo])
		return data
	end
end