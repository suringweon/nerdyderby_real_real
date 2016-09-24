class User < ActiveRecord::Base
	validates :carname, :presence => { :message => "자동차 이름을 반드시 입력하셔야 합니다." }
	validates :carname, :uniqueness => { :message => "이미 존재하는 이름입니다.", :case_sensitive => false }
	
end
