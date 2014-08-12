class GadgetAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :gadget
end
