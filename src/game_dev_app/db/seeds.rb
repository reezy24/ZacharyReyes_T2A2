# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create(
    [
        {
            first_name: "Zachary",
            last_name: "Reyes",
            about_me: "Working on GameVelop.",
            email: "zach@mail.com", 
            password: "asdfasdf",
            password_confirmation: "asdfasdf",
        },
        {
            first_name: "Hayley",
            last_name: "Williams",
            about_me: "Lead singer of Paramore.",
            email: "hayley@mail.com", 
            password: "asdfasdf",
            password_confirmation: "asdfasdf",
        },
        {
            first_name: "My",
            last_name: "Dude",
            about_me: "I can do everything!",
            email: "dude@mail.com", 
            password: "asdfasdf",
            password_confirmation: "asdfasdf",
        },
    ]
)

Expertise.create(
    [
        {title: "Animator"},
        {title: "Artist"},
        {title: "Level Designer"},
        {title: "Modeller"},
        {title: "Musician"},
        {title: "Programmer"},
    ]
)

@zach = Member.first
@hayley = Member.second
@my_dude = Member.third

MemberExpertise.create(
    [
        {
            member: @zach,
            expertise: Expertise.find(6),
        },
        {
            member: @hayley,
            expertise: Expertise.find(5),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(1),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(2),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(3),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(4),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(5),
        },
        {
            member: @my_dude,
            expertise: Expertise.find(6),
        },
    ]
)

Project.create(
    [
        {
            owner: @zach,
            title: "The Next Call of Duty",
            description: "Because Treyarch can't get anything right.",
            duration: "24 hours (I'm not kidding)",
            budget: 0,
        },
        {
            owner: @hayley,
            title: "Paramore: The Game",
            description: "Because movies are overrated.",
            duration: "12 months",
            budget: 50000,
        },
        {
            owner: @my_dude,
            title: "Fivenite",
            description: "How hard could it be?",
            duration: "24 months",
            budget: 750000,
        },
    ]
)

Project.all.each do |proj|
    Expertise.all.each do |exp|
        ProjectRole.create(
            {
                project: proj,
                expertise: exp,
                description: "#{proj.title} needs a #{exp.title}."
            },
        )
    end
end

# zach sends an offer to hayley and wants to work on my dude's game
# hayley sends an offer to my dude and wants to work on zach's game
# my dude sends an offer to zach and wants to work on hayley's game
# offer - when someone is asking you to work on their project
# proposal - you ask someone if you can work on their project
# outbound request - you ask someone if they can work on your project
# inbound request - someone asks you if they can work on your project
Offer.create(
    [
        {
            project_role_id: 1,
            sender: @zach, 
            receiver: @hayley,
            description: "Hey Hayley, would love for you to come work on this."
        },
        {
            project_role_id: 13,
            sender: @zach, 
            receiver: @my_dude,
            description: "Hey my dude, what an interesting project! Can I help?",
        },
        {
            project_role_id: 7,
            sender: @hayley, 
            receiver: @my_dude,
            description: "Hey my dude, would love for you to come work on this."
        },
        {
            project_role_id: 2,
            sender: @hayley, 
            receiver: @zach,
            description: "Hey Zach, what an interesting project! Can I help?",
        },
        {
            project_role_id: 14,
            sender: @my_dude, 
            receiver: @zach,
            description: "Hey Zach, would love for you to come work on this."
        },
        {
            project_role_id: 8,
            sender: @my_dude, 
            receiver: @hayley,
            description: "Hey Hayley, what an interesting project! Can I help?",
        },
    ]
)