# BH-Social
Black History Social is website to learn and inform with other people about the history of African and African-Americans across the known universe. The content on the website is user generated and can be public knowledge or local knowledge about people, places, and events that may not be commonly known. You can think of it as a user generated encyclopedia built for users by users.

To install and properly use the app, you must first download the repo and run bundle install to get all the necessary gems and dependencies needed for the app to run. Run rake db:migrate and rake db:seed, to get the topics loaded, which are needed for the nav bar as one of the resources. You should make sure the models and sample/seed data, other than the topics, are properly set up by running "rails c" in the terminal. You really only need the topics for the app to function properly; users, posts, questions,answers/comments can and should be added by users. Once you have the repo downloaded, you can run "rails s" in the command line and go to http://localhost:3000/ to view and use it.

GitHub is offered as a way for users to log-in or sign up using the OmniAuth strategy and gem. You must go to your GitHub account, or create one, then create a web application with OAuth privileges by going to Developer settings and using the proper URL for the website. You must then use /auth/github/callback as your call back method. You'll be given a GITHUB_KEY and _SECRET that you should hide in the .env file to prevent it from being exploited. You can use whatever constant variable name you want, just make sure it's the same as what's in your config/initializers/omniauth.rb. For more information on GitHub and Omniauth, you can check out the repo here: https://github.com/omniauth/omniauth-github

With the app up and running, you can click on Knowledge is Power to return to the home screen at any point. The buttons below the explanation on the homepage has topics and additional features but they are only available when you're logged-in, which can be done in the navbar. The buttons are there to help users get started and familiar with the process. Users can either make a post about one of the topics, with the title being the person, place, or event, or they can post a question in any of those categories to other people and users of the app. Everyone is able to comment on other posts or questions, and you can also attempt to answer other users' questions but only they can determine if the question has been answered. 

In the future, I plan to add the ability for users to become friends and the ability for users to "upvote" or "like" comments/answers, so they can be more visible to the author of the post or question. If you can any questions or comments about the app, you can reach out to me at traytwebb14@yahoo.com. 

You can view the license to the code here: https://github.com/TriggaT/BH-Social/blob/main/LICENSE