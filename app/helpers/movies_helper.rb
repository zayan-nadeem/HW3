module MoviesHelper
	def sorted(para)
	  "hilite" if params[:sort]==para
	end
end
