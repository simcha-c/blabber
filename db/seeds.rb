# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroy all tables
Location.destroy_all
User.destroy_all
Blab.destroy_all

# new will instantiate the object
# save will save to the database
# create will instantiate the object and then save
new_york = Location.create!(name: 'New York'    )
argentina = Location.create!(name: 'Argentina'  )
california = Location.create!(name: 'California')
kansas = Location.create!(name: 'Kansas'        )
hawaii = Location.create!(name: 'Hawaii'        )
vermont = Location.create!(name: 'Vermont'      )
wisconsin = Location.create!(name: 'Wisconsin'  )
england = Location.create!(name: 'England'      )

soonmi = User.new(username: 'soonmi', password: 'startrek')
soonmi.location = new_york # will automatically assign location_id to new_york.id because of association
soonmi.save!

# Users
# create users that belong to argentina
tommy = argentina.users.create!(username: 'tommy', password: 'startrek'       )
mashu = argentina.users.create!(username: 'mashu', password: 'startrek'       )
# create a user that belongs to england
oliver = england.users.create!(username: 'oliver', password: 'startrek'       )
# create a user that belongs to california
brian = california.users.create!(username: 'brian', password: 'startrek'      )
# create a user that belongs to kansas
andrewG = kansas.users.create!(username: 'andrewG', password: 'startrek'      )
# create a user that belongs to hawaii
danny = hawaii.users.create!(username: 'danny', password: 'startrek'          )
# create a user that belongs to vermont
michael = vermont.users.create!(username: 'michael', password: 'startrek'     )
# create a user that belongs to wisconsin
andrewL = wisconsin.users.create!(username: 'andrewL', password: 'startrek'   )

# Blabs 
# create a blab that belongs to soonmi
soonmi.authored_blabs.create!(body: 'hello class!'                                  )
soonmi.authored_blabs.create!(body: 'loving the Rails life'                         )
# create a blab that belongs to tommy
tommy.authored_blabs.create!(body: 'hello world, from Argentina'                    )
tommy.authored_blabs.create!(body: 'blah blah blah'                                 )
tommy.authored_blabs.create!(body: 'well, I just blabber away, don\'t I?'           )
# create a blab that belongs to mashu
mashu.authored_blabs.create!(body: 'Go blabber!'                                    )
mashu.authored_blabs.create!(body: 'I don\'t really wanna blabber anymore, bye..'   )
# create a blab that belongs to oliver
oliver.authored_blabs.create!(body: '🇬🇧 God save The Queen 🇬🇧'     )
oliver.authored_blabs.create!(body: 'Needs more Franks Red Hot!'                             )
# create a blab that belongs to brian
brian.authored_blabs.create!(body: 'nobody can match lil sebastian'                 )
brian.authored_blabs.create!(body: 'michael scarn is the best'                      )
brian.authored_blabs.create!(body: 'oops - opal is better than lil sebastian'       )
# create a blab that belongs to michael
michael.authored_blabs.create!(body: 'chipotle.. yaaaas'                            )
michael.authored_blabs.create!(body: 'Ludlow, Vermont is the place to be'           )
# create a blab that belongs to danny
danny.authored_blabs.create!(body: 'I will help you find a job :)'                  )
danny.authored_blabs.create!(body: 'Career coaching from Hawaii, yall'              )
# create a blab that belongs to andrewG
andrewG.authored_blabs.create!(body: 'Danny, Joey, Sarah, and I will guide you'     )
andrewG.authored_blabs.create!(body: 'Lawrence, Kansas is where its at'             )
# create a blab that belongs to andrewL
andrewL.authored_blabs.create!(body: 'Grad night is upon us..'                      )
andrewL.authored_blabs.create!(body: 'You guys have no clue, go Wisconsin!'         )