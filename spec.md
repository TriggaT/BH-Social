# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -> User has_many Questions
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -> Post belongs_to Topics
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -> Topics has_many Answers through Questions, User has_many Comments through Posts 
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) ->  Users has_many Topics through Posts
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -> Users can select the topic from a range of three different topics 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -> users/most_frequent_poster
- [x] Include signup (how e.g. Devise) -> Devise setup 
- [x] Include login (how e.g. Devise) -> Devise setup 
- [x] Include logout (how e.g. Devise) -> Devise setup 
- [] Include third party signup/login (how e.g. Devise/OmniAuth) -> Devise setup
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -> topics/1/posts 
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -> topics/2/questions/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
