module AttachmentValidator
	def valid_data(attachment)
		if attachment.match /.png/ || attachment.match /.tiff/ || attachment.match /.jpg/ || attachment.match /.jepg/ 
			return true
		else
			return false
		end
	end
end