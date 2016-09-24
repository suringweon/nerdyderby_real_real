class MainController < ApplicationController
  def rank
		@users = User.order(:record).all
	end

  def regist
  end

  def regist_complete
		user = User.new
		user.username = params[:username]
		user.phone = params[:phone]
		user.carname = params[:carname]
		user.image = params[:image]
		if user.save
			flash[:alert] = "성공적으로 등록되었습니다."
			redirect_to "/main/regist"
		else 
			flash[:alert] = user.errors.values.flatten.join(' ')
			redirect_to :back
		end
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
