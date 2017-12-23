module UserHelper
  def user_mood
    uh = @user.happiness

    if uh >= 3 # 3 - 5
      'happy'
    elsif uh == 2 # 2
      'unhappy'
    else # 0 - 1 
      'sad'
    end
  end
end