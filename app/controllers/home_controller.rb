class HomeController < ApplicationController
  
  def index
   @user = current_user
   @book = Book.new
  end
 
  def show
  end
end
