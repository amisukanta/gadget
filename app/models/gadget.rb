class Gadget < ActiveRecord::Base
	has_many :gadget_attachments
	accepts_nested_attributes_for :gadget_attachments
end
