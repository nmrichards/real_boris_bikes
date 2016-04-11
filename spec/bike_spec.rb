require "bike"

describe Bike do

	it { is_expected.to respond_to :working? }  	

	# one liner syntax:
	# it { is_expected.to respond_to :release_bike }
		
end