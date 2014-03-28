# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.create([
    { name: 'Normal', active: true },
    { name: 'Stern', active: false },
    { name: 'Funny', active: false }
  ])


Group.first.quotes.create([
    { text: "We’re proud of you", group_id: 1 },
    { text: "Outstanding job", group_id: 1 },
    { text: "Super work", group_id: 1 },
    { text: "Terrific job", group_id: 1 },
    { text: "Great job", group_id: 1 },
    { text: "Perfect job", group_id: 1 },
    { text: "You can do it", group_id: 1 },
    { text: "Excellent", group_id: 1 },
    { text: "You’re super", group_id: 1 },
    { text: "You’re the best", group_id: 1 },
    { text: "Way to go", group_id: 1 },
    { text: "Right on", group_id: 1 },
    { text: "You did it", group_id: 1 },
    { text: "Looks good", group_id: 1 },
    { text: "You deserve a star", group_id: 1 },
    { text: "Fantastic job", group_id: 1 },
    { text: "Very good", group_id: 1 },
    { text: "Impressive work", group_id: 1 },
    { text: "You’re tops", group_id: 1 },
    { text: "Nice work", group_id: 1 },
    { text: "Hurray for you", group_id: 1 },
    { text: "Great imagination", group_id: 1 },
    { text: "You’re a champ", group_id: 1 },
    { text: "Keep up the good work", group_id: 1 },
    { text: "You’re #1", group_id: 1 },
    { text: "You’ve got what it takes", group_id: 1 },
    { text: "You’re on the mark", group_id: 1 },
    { text: "You’re the greatest", group_id: 1 },
    { text: "Well done", group_id: 1 },
    { text: "Exceptional work", group_id: 1 },
    { text: "Great idea", group_id: 1 },
    { text: "Super job", group_id: 1 },
    { text: "Nice shirt!", group_id: 1 },
    { text: "I like the way you think", group_id: 1 },
    { text: "Save the pandas", group_id: 1 },
    { text: "A+ day", group_id: 1 },
    { text: "Don't forget your suspenders", group_id: 1 },
    { text: "And the winner is....", group_id: 1 },
    { text: "Did you do something with your hair?", group_id: 1 },
    { text: "Help computer", group_id: 1 }
  ])
