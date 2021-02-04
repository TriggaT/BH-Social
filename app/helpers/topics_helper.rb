module TopicsHelper

    def topic_people
        Topic.all.find_by(id: 1)
    end 

    def topic_places
        Topic.all.find_by(id: 2)
    end 

    def topic_events
        Topic.all.find_by(id: 3)
    end 
end
