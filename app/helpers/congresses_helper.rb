module CongressesHelper
	def checked(area)
  		@congress.administrators_ids.nil? ? false : @congress.administrators_ids.match(area)
	end

end
