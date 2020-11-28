class BooksController < ApplicationController
  
    before_action :authenticate_user!

      def new
        @book = Book.new(book_params)
      end

      def create
         @user = current_user
         @book = Book.new(book_params)
         @books = Book.all
         @book.user = current_user
         @book.user_id = current_user.id
          if @book.save
            redirect_to book_path(@book)
            flash[:notice] = "You have created book successfully."
          else
             render template: "users/show"
          end
      end
      def index
        # users = User.all
        # books = Book.all
        @users = User.all
        @user = current_user
        @book = Book.new
        @books = Book.all
        if@user == current_user
          render "index"
        else
          redirect_to user_session_path
        end
      end

      def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
        # if @user == current_user
        #   render 'show'
        # else
        #   redirect_to user_session_path
        # end
      end

      def edit
        @book = Book.find(params[:id])
        if @book.user == current_user
           render "edit"
        else
           redirect_to books_path
        end
      end
      def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          @book.save
          redirect_to book_path(@book)
          flash[:notice] = "Book was successfully updated."
        else
          render :edit
        end
      end
      def destroy
           book = Book.find(params[:id])
        book.destroy

        if book.destroy
          redirect_to '/books'
        flash[:notice] = "Book was successfully deleted."
        else
         flash[:notice] = "error occured"
        end
      end

      private
      def book_params
        params.require(:book).permit(:title,:body)
      end
end
