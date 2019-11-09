# [R7-8] Purpose
In game development, specifically indie game development, a common issue is finding people to work with. Generally you specialise in one area and need help in others. For example, when developing games, I focus on programming and need to source maps, assets, art, music, etc. externally. The current way to do this is to browse freelancing sites such as Fiverr and Upwork, view social media pages such as Facebook and Twitter feeds, or look through the credits of other games. This app aims to simplify the process by providing a single platform for programmers, musicians, artists, animators, and modellers to work on others' games and source workers for their own games. 

This is an issue as it's very likely that a lot of great game ideas never come to fruition, simply due to not having been able to find the right people for the job. 

# [R9] Link to App
https://salty-crag-15864.herokuapp.com/

# [R10] Link to Repo
https://github.com/reezy24/ZacharyReyes_T2A2

# [R11] Description
## Features
The MVP, with the goal of connecting game creatives with other creatives, contains the following features:
- create and post a project, specifying the areas of expertise that you need to fill
- browse creatives on the platform
- invite creatives to work on your project
- create and post a portfolio, specifying your areas of expertise
- browse projects on the platform
- request to work on projects you're interested in
- simultaneously be a project owner and a member of other projects

- game developer building a team
So, I am a game developer who has just found gamevelop.net
I have this project that I am working on, but I only program.
I need asset makers, map makers, animators, artists and musicians. 
I land on the website, and immediately see the words "Build a Game Development Team, browse game creatives below"
I see the filter option and select the relevant fields
I then browse the different profiles which are presented to me in a grid of profile summaries
I click on the ones I am interested in
On each profile I can see the person's work, a little bit about themselves, their photo, and a button to contact / request to hire
For the people that I find suitable, I click hire
The website tells me that I first need to create a project.
I click on "create project"
I fill in the requested fields - project title, positions required, estimated duration, estimated budget, photos, interview questions PER POSITION etc.
I click create
The website asks me to signup to finalise
Finally, I am redirected to the hire page for the person I want to hire
I select the project I want to hire them for
I send them a personalised message about why I chose them, etc. 
I add any extra interview questions
I send the hire request
I repeat this process for a number of candidates in each position
(a little while later)
I compare the responses to all my hire requests
I select "hire" for the ones that showed interest and are optimal
This is now reflected in my dashboard

- artist looking for work
I am an artist looking to work on another project
I land on the site
I see two options - "Build a Team" and "Find Work"
I select "find work"
A grid of all projects are presented to me
I see a filter at the top
I select "artist" as I am only looking for artist positions
I click on projects that interest me
I can see photos of the project, filled roles and vacant roles, description, and a "apply" button
I click apply
I am presented with interview questions and a field for why I'd like to join
I fill out the interview questions and the personalised field
I send
(a little while later)
I receive responses to my applications
I accept the best offer
This is now reflected in my dashboard

- musician being requested to work
I am a musician with an existing profile
I received a request to work on a project
I am presented with interview questions
I fill out the interview questions
I send the response
(a little while later) 
I receive a response saying I am successful
I accept the offer
This is reflected in my dashboard

## Sitemap

## Screenshots

## Target Audience

## Tech Stack

# [R12] User Stories

For brevity, "creative" refers to any of the following: programmer, musician, animator, modeller, designer, writer, tester, producer, artist, project manager, 

- As a creative, I want to build a team, so I can oversee development of my game idea
- As a creative, I want to work for a team, so I can get experience in the industry
- As a creative, I want to work for a team, so I can get paid
- As a creative, I want to hire other creatives, so I can finish my project while focusing on my area of expertise
- As a game programmer, I want to hire another programmer, so I don't have to do the grunt work
- As a musician, I want to hire a level designer, so I can turn my music into an interactive experience
- As an animator, I want to sell my animations, so other games can use them
- As a modeller, I want to work for a team, so I can get paid to produce game assets
- As a game designer, I want to build a team, so I can oversee development of my game idea
- As a writer, I want to hire a programmer and artist, so I can bring my story to life
- As an artist, I want to list my services and work examples, so other game people can hire me

# [R13] Wireframes

# [R14] Entity-Relationship Diagram (ERD)

# [R15] Abstractions
> Precisely explains and shows understanding of the different high-level components of the app

The app has the following components:

| Model        | Controller           | View  |
| ------------- |-------------| -----|
| Member      | MembersController | Landing |
| Project      | ProjectsController      |   Sign Up |
| Expertise | MyDashboardController      |    Log In |
| Offer | ProjectDashboardController      |    New Project |
| ProjectRole | WelcomeController      |   Show Project |
| MemberExpertise | BrowseController      |   Dashboard - Projects |
| Expertise |       | My Dashboard - Offers|
| Expertise |       | My Dashboard - Proposals |
|  |       | My Dashboard - Profile |
|  |       | Edit Profile |
|  |       | Project Dashboard - Edit |
|  |       | Project Dashboard - Members |
|  |       | Project Dashboard - Requests |
|  |       | Project Dashboard - Profile |
|  |       | Browse |
|  |       | Show Member |
|  |       | Send Request |

Given the features listed in Description, the above components work together to achieve these features in the following ways:
- The MembersController allows first-time users to sign up by creating their own Member model. The Member model stores the user's name, profile description, and areas of expertise. Their areas of expertise are represented by the MemberExpertise model, which is the join table between Members and Expertises. Users can view their own profile in the profile section of the My Dashboard view. External users can view other users' profiles in the Browse and Show Member views, and in the My Dashboard or Project Dashboard views where an offer or request is pending. 
- The ProjectsController allows Members to create their own projects using the Project model. A new Project can be created from the My Dashboard view. It requires a title, description, duration, budget, and at least one area of expertise to be filled, which is represented by the ProjectRole model. The ProjectRole holds a description set by the project owner (e.g. "I need a programmer to code x"), a Project ID, an Expertise ID, and a Member ID which is initially blank. The ProjectRole is considered "filled" when its Member ID is no longer nil, and it is rendered in the views as such. Members can view each of their owned Projects in the My Dashboard view, or in the Project's respective Project Dashboard view (i.e. each Project has it's own Project Dashboard). Members can view projects that they do not own in the Browse and Show Project views, and in their My Dashboard view where an offer or proposal is pending. 
# [R16] Third-Party Services
Third Party Service / Gem|Description
---|---
Devise|User authentication
Heroku|Deployment
Cloudinary|Image upload for project image
RSpec|Unit testing (mainly with models) and acceptance testing
nested-form-fields + jquery-rails|Was used in the new project form to add multiple project roles, and in the create profile form to add multiple expertises

# [R17] Models
Member

A member has many expertises, project roles, offers, proposals and projects. A member has many expertises through the MemberExpertise join table, which also holds a description about their experience in this expertise. This allows a user to display multiple expertises in their portfolio. Both offers and proposals use the Offer model. In terms of associations, an offer is where an outside member is asking you to work on their project, while a proposal is where you are asking an outside member if you can work on their project. This allows users to send offers when they are hiring, and receive offers when they are looking for work. A member has projects that they are the owner of. This allows them to create projects which they can subsequently hire for. Projects that the member is a part of (i.e. an offer was accepted) are associated with the member via their project roles instead.

Expertise

An expertise has many members and project roles. An expertise has many members through the MemberExpertise join table. An expertise has many project roles such that all vacancies for a particular expertise can be listed in the app.

Project

Projects are the core of the app. It is the medium that users us to connect, as they allow users to hire and get hired, which is the ultimate goal. A project belongs to an owner, which is a Member. It has many project roles, and from each role multiple offers can be created. All inbound and outbound offers related to this project can be found via its project roles.

MemberExpertise

A MemberExpertise belongs to Member and Expertise. It is the join table between the two. If either the expertise or the member is destroyed, so will the MemberExpertise. 

ProjectRole

ProjectRoles allow vacancies to be specified within projects. A ProjectRole has one expertise and member. The expertise is used in the browse section of the app, when users are looking for vacancies. The member field starts off as nil, and is said to be filled (and is rendered as such) when a member is allocated (i.e. a related offer is accepted). A ProjectRole belongs to a project and has many offers. 

Offer

An offer allows users to express their interest in projects, and ultimately get hired. It belongs to a sender (which is a Member), a receiver and a project role. It also has a response field that is initially nil. When a member accepts or declines an offer, this response is update to true or false and renders in the relevant dashboards accordingly. For example, when a user declines an offer, it will disappear from the offers section of their dashboard, and show as declined in the respective project dashboard of the sender.

# [R18] Database Relations
> Provides coherent discussion of the database relations, with reference to the ERD

|Relation|Relationship Type|Discussion|
|---|---|---|
|Member to Expertise|many-to-many|A Member can have many areas of Expertise, and an area of Expertise can contain many Members. 
|Member to Project|one-to-many|A Member can have many Projects while a Project can only have one owner. 
|Member to ProjectRole|one-to-many|A Member can occupy many ProjectRoles, but a ProjectRole can only be filled by one Member.
|Member to Offer|one-to-many|A member can have many offers, both as a sender or receiver, but an offer can only take one member as its sender and one member as its receiver.
|Expertise to ProjectRole|one-to-many|Many ProjectRoles can be classified under one Expertise, though a ProjectRole can only specify a single Expertise.
|ProjectRole to Offer|one-to-many|A ProjectRole can have many offers through people applying for the position and the project owner hiring for this position. An offer can only specify one ProjectRole to be filled.
|Project to ProjectRole|one-to-many|A Project can have many ProjectRoles that need to be filled, while a ProjectRole can only be a part of one project.

# [R19] Schema Design

# [R20] Project Management

I started off by listing the pages I need. It's not a complete list, I just needed something that I could refer to to get started with sketches. 

![page list](https://github.com/reezy24/ZacharyReyes_T2A2/blob/master/docs/images/page_list.PNG)

I also created a trello board with the requirements, high distinction criteria and high-level tasks listed. 

![page_list](https://github.com/reezy24/ZacharyReyes_T2A2/blob/master/docs/images/trello_start.png)
