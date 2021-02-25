class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :comment_title

  def current_user 
    User.find_by(id: session[:user_id])
  end 

  private 

    def find_post
        @post = Post.find_by(id: params[:post_id])
    end

    def comment_title
      @post ? @post.title : @question.content
    end 

    def question_or_post
      if find_question
      else find_post
      end 
    end 


    def find_question
      @question = Question.find_by(id: params[:question_id])
    end
    
    def find_topic
      @topic = Topic.find_by(id: params[:topic_id])
    end 

end
