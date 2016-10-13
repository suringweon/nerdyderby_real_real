class MainController < ApplicationController
#before_action :admin_check, :only => :admin
def rank
	@recent = Time.now.hour
	
  @A = User.where(group: @recent, record: -1, rail: "A")[0]
  @B = User.where(group: @recent, record: -1, rail: "B")[0]
  @C = User.where(group: @recent,record: -1, rail: "C")[0]

	@users = User.where(group: @recnet).where.not(record: -1).where.not(record: 0).order(:record)
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
			flash[:alert] = "성공적으로 등록되었습니다. 당신의 트랙은 #{User.last.rail}, #{User.last.group}그룹 입니다."
			redirect_to :back
		else 
			flash[:alert] = user.errors.values.flatten.join(' ')
		redirect_to :back
		end
	end

	def check_regist
		
	end

#get data from adrduino
#data = A:11111/B:2222/C:11333/i (i는 차례를 나타내느 숫자, i=0)
	def check_turn
		data = params[:data]
		a = data.split('/')[0]
		b = data.split('/')[1]
		c = data.split('/')[2]

		user_a = User.where(rail: "A", record:-1)[0]
		user_b = User.where(rail: "B", record:-1)[0]
		user_c = User.where(rail: "C", record:-1)[0]

		if !user_a.nil?
			user_a.record = a.split(':')[1].to_i
			user_a.save
		end

		if !user_b.nil?
			user_b.record = b.split(':')[1].to_i
			user_b.save
		end
		
		if !user_c.nil?
			user_c.record = c.split(':')[1].to_i
			user_c.save
		end
	end
		

	def before_admin
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
