module CoursesHelper
	def truncate(text, options = {})
    		options.reverse_merge!(:length => 115)
    		text.truncate(options.delete(:length), options) if text
  	end
end
