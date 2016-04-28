class Address < ActiveRecord::Base
	attr_accessible :postcode
	
	belongs_to :user
	belongs_to :order

	validates :line_one, :line_two, :town, :county, :postcode, presence: true
	validates_format_of :postcode, 
	:with =>  /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$$/i, 
	:message => "invalid postcode" 
 


end
