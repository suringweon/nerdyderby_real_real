class MainController < ApplicationController
#before_action :admin_check, :only => :admin
def rank
	#	@users = User.order(:record)
	  # 시간대별로 사람 띄우는법...
	@data = User.last.record
	recent = Time.now.hour
  i=0
  j=0
  k=0

  @A = User.where(group: recent, rail: "A")[i]
  @B = User.where(group: recent, rail: "B")[j]
  @C = User.where(group: recent, rail: "C")[k]

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
		number = User.where(group: Time.now.hour).count
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

#get data from adrduino
#data = A:11111/B:2222/C:11333/i (i는 차례를 나타내느 숫자, i=0)
	def check_turn
		data = params[:data]
		a = data.split('/')[0]
		b = data.split('/')[1]
		c = data.split('/')[2]
		turn = data.split('/')[3].to_i

		user_a = User.where(rail: "A", record:"")[turn]
		user_b = User.where(rail: "B", record:"")[turn]
		user_c = User.where(rail: "C", record:"")[turn]

		if !user_a.nil?
			user_a.record = a.split(':')[1]
			user_a.save
		else
		 #user_a가 없는경우에는? => 아무것도안할꺼임
		end

		if !user_b.nil?
			user_b.record = b.split(':')[1]
			user_b.save
		else
		 #user_a가 없는경우에는? => 아무것도안할꺼임
		end
		
		if !user_c.nil?
			user_c.record = c.split(':')[1]
			user_c.save
		else
		 #user_a가 없는경우에는? => 아무것도안할꺼임
		end
	
	end
		

	def before_admin
		@data = User.last.record
	end


  def admin_check
	  password = params[:password]
		if password == "sorkqkfhrhksflwkek"
			redirect_to "/main/sorkqkfhrhksflwkek"
		else
			flash[:alert] = "관리자가 아닙니다."
			redirect_to "/main/before_admin"
		end
	end

	def admin
	@users = User.all 
	end

  def admin_complete
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :back
  end
end
