class BookCommentsController < ApplicationController
    def create
      @book = Book.find(params[:book_id])
      comment = current_user.book_comments.new(book_comment_params)
      comment.book_id = @book.id
      comment.save
      #if comment.save
       #redirect_to request.referer
      #else
       #redirect_to book_path(book)
      #end
    end


    def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @book = Book.find(refroute[:id])
    BookComment.find(params[:id]).destroy
    #redirect_to request.referer
    end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
