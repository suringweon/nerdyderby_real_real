class MainController < ApplicationController
  def rank
	#	@users = User.order(:record)
	  # 시간대별로 사람 띄우는법...
	
	@users = User.where(group: Time.now.hour).order(:record)
 	
	
	end

  def regist
  end

  def regist_complete
		user = User.new
		user.username = params[:username]
		user.phone = params[:phone]
		user.carname = params[:carname]
		user.image = params[:image]
		user.content = params[:content]
		user.group = Time.now.hour	
		number = User.count
		case (number%3)
			when 0
				user.rail = "A"
			when 1
				user.rail = "B"
			else
				user.rail = "C"
		end
			
		if user.save
			flash[:alert] = "성공적으로 등록되었습니다. 당신의 트랙은 #{User.last.rail} 입니다.group = #{User.last.group}"
			redirect_to "/main/regist"
		else 
			flash[:alert] = user.errors.values.flatten.join(' ')
		redirect_to :back
		end
	end

	def check_turn
	end

	def before_admin
	end

  def admin_check
		password = params[:password]
		if password == "sorkqkfhrhksflwkek"
			redirect_to "/main/admin"
		else
			flash[:alert] = "관리자가 아닙니다."
			redirect_to :back
		end
  end
	
	def admin
		@users =User.all
	end

  def admin_complete
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :back
  end
end
