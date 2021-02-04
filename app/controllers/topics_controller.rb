class TopicsController < ApplicationController
    helper_method :all_topics

    def show 
        @topic = Topic.find_by(id: params[:id])
    end 

    private 

    def all_topics
        Topic.all 
    end 
end
