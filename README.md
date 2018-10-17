# RealEstate Application

<p align="center">
<img alt="RealEstate Image" src="https://github.com/hrshagrwl/RealEstateApp/blob/master/public/nav.gif">
</p>

The project is done using the concepts of Ruby on Rails for development. 

The purpose of this project is to design a portal for selling the properties. In the project, there are three access models: admin, realtor, and house hunter. House hunter is responsible for listing the details of the properties and replies to the inquiries of the house hunters. House hunter, on the other hand, can view the properties listed and can raise an inquiry. If they are interested in the property, then they can either contact the company directly or mark the company as interested.

We have also added the email feature with the replies to any inquiry and a Google login feature with only NC State email ids.
 
## Deployment 

We have deployed our project on **Heroku**. To view, [click here](https://whispering-coast-30139.herokuapp.com).

## Credentials

| Role | Email | Password | Notes |
| --- | --- | --- | --- |
| Admin | admin@realestate.com | password | Cannot be deleted |
| House Hunter | hunter@realestate.com | password | Unless deleted by someone |
| Realtor | realtor@realestate.com | password | Unless deleted by someone |


## Local Deployment

To run the app locally, follow these steps:

- Clone the repository on your local machine.

```
git clone https://github.com/hrshagrwl/RealEstateApp.git
```

- Go to the directory of the project where it is cloned using terminal

```
cd Desktop/RealEstateApp
```


- Install gems
```
bundle install
```
-  Complete Database Migrations
```
rake db:migrate
```
- Add pre-configured users
```
rake db:seed
```
- Run server
```
rails server
```
Your app will run on http://localhost:3000


## Features
### Admin
  - Log in to the system
  - Create realtor and house hunter accounts
  - Create real estate companies
  - Delete real estate companies from the system
  - Delete users (realtors or house hunters) from the system
  - Delete properties from the system
  - Delete inquiries from the system
  - View the details (except password) of other users
  - View the list of real estate companies, along with detailed information
  - View the list of houses and detailed information
  - View the list of inquiries and detailed information

### Realtor
  - Can log in/sign up into the system
  - Can edit the profile
  - Choose an existing real estate company or create a new real estate company
  - Edit his/her company information
  - List a house if it belongs to a company
  - Edit house information that they have listed and cannot edit houses listed by other realtors
  - View all houses (including those listed by others)
  - Remove a house from the listing (previously created by this realtor)
  - View all the potential buyers for any house in his/her company and their profile details (except password)
  - View all inquiries from house hunters for any house in the company
  - Submit replies for all inquiries of houses in the company
  - Multiple realtors can belong to a single company
  - Each realtor can have multiple houses
  

### House Hunter
  - Can log in/sign up into the system
  - Can edit the profile
  - Search available houses using filters, such as price range, square footage range, location
  - View real estate company information
  - View house information
  - Send an inquiry for a certain house
  - Add a house to his/her interest list
  - Send an inquiry to multiple houses and delete them as well
  
### Some Interesting Cases
   - Deleting a company will delete all the related properties and will remove the company name assigned to any realtor
   - On changing the company, the realtor can no longer make changes to the old houses.
   - If a house hunter is deleted, all the existing inquiries will be deleted and also the name from the potential buyer list will be deleted
  
### Miscellaneous
   - When a realtor replies a house hunter’s inquiry, send **email** to the corresponding house hunter
   - All users can use their **Google account** with NCSU email id to log into the system
    
## Testing 

The testing module has been designed thoroughly for the users model and controller. To view the configuration of the added database module of the user, go to `test/fixtures/users.yml` file. To run the test case, follow the steps:

### For Models

Clone the repository on your local machine.

```
git clone https://github.com/hrshagrwl/RealEstateApp.git
```

Go to the directory of the project where it is cloned using terminal

```
cd Desktop/RealEstateApp
```

Run the following command

```
bin/rails test test/models/user_test.rb
```



### For Controllers

Clone the repository on your local machine.

```
git clone https://github.com/hrshagrwl/RealEstateApp.git
```

Go to the directory of the project where it is cloned using terminal

```
cd Desktop/RealEstateApp
```

Run the following command

```
bin/rails test test/controllers/user_controller_test.rb
```


## Contributors

  - [Harsh Aagrawal](https://www.linkedin.com/in/hrshagrwl)
  - [Rayan Dasoriya](https://www.linkedin.com/in/rayan-dasoriya/)
  - [Juhi Madhwani](https://www.linkedin.com/in/juhi-madhwani/)
