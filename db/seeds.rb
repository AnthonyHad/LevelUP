# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.destroy_all
puts "Creating users..."

# usera = User.create! :nickname => 'ConcernedApe', :email => 'concerned_ape@stardewvalley.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# userb = User.create! :nickname => 'TobyFox', :email => 'toby_fox@undertale.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# userc = User.create! :nickname => 'Pixel', :email => 'pixel@cavestory.com', :password => 'topsecret', :password_confirmation => 'topsecret'
@users = [
  { :nickname => 'ConcernedApe', :email => 'concerned_ape@stardewvalley.com', :password => 'topsecret', :password_confirmation => 'topsecret' },
  { :nickname => 'TobyFox', :email => 'toby_fox@undertale.com', :password => 'topsecret', :password_confirmation => 'topsecret' },
  { :nickname => 'Pixel', :email => 'pixel@cavestory.com', :password => 'topsecret', :password_confirmation => 'topsecret' }
]

path = Rails.root.join('user_images').to_s
i = 0
@new_users = []
dir_array = []
Dir.foreach(path) do |dir|
  next unless dir.match?(/(\d)/)
  num = dir.match(/(\d)/)[1].to_i
  dir_array << dir
end
dir_array.sort!
dir_array.each do |dir|
  if dir.include?('images') && @users[i].present?
    user = User.create! @users[i]
    puts "#{i + 1}. User \"#{user.nickname}\" created"
    puts "Directory: #{dir}"
    images_to_attach = []
    Dir.foreach(File.join(path, dir)) do |file|
      if file.include?('.jpg')
        puts "File: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        @image_to_attach = { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' }
        puts 'Uploaded!'
      end
    end
    user.update!(photo: @image_to_attach)
    @new_users << user
    puts "Images attached!"
    i += 1
  end
end

Game.destroy_all
puts "Creating games"

#@categories = ['Simulator', 'Platformer', 'Action', 'Rogue-Like', 'Puzzle']

@games = [
  { title: "Stardew Valley", description: "A spiritual successor to Harvest Moon where you manage your own farm in a picturesque village!", category: "Simulator", user_id: @new_users.sample.id },
  { title: "Goat Simulator", description: "Live out your dreams, live your life as an out-of-control goat.", category: "Simulator", user_id: @new_users.sample.id },
  { title: "RimWorld", description: "RimWorld is an indie top-down construction and management simulation video game.", category: "Simulator", user_id: @new_users.sample.id },
  { title: "Euro Truck Simulator 2", description: "Euro Truck Simulator 2 is a vehicle simulation game in which the player drives across a lightly fictionalised Europe", category: "Simulator", user_id: @new_users.sample.id },
  { title: "Tabletop Simulator", description: "Tabletop Simulator is an independent video game that allows players to play and create tabletop games in a multiplayer physics sandbox.", category: "Simulator", user_id: @new_users.sample.id },
  { title: "Celeste", description: "Help Madeline survive her inner demons on her journey to the top of Celeste Mountain, in this super-tight, hand-crafted platformer.", category: "Platformer", user_id: @new_users.sample.id },
  { title: "Limbo", description: "Journey through limbo as a young boy looking for his lost sister in this dark, atmospheric platformer.", category: "Platformer", user_id: @new_users.sample.id },
  { title: "Super Meat Boy", description: "Super Meat Boy is a tough as nails platformer where you play as an animated cube of meat who's trying to save his girlfriend, Bandage Girl.", category: "Platformer", user_id: @new_users.sample.id },
  { title: "Shovel Knight", description: "Destroy and bounce on foes with your shovel in this charming retro-inspired platformer as you look for Shield Knight.", category: "Platformer", user_id: @new_users.sample.id },
  { title: "Hollow Knight", description: "Forge your own path in Hollow Knight! An epic action adventure through a vast ruined kingdom of insects and heroes.", category: "Platformer", user_id: @new_users.sample.id },
  { title: "Bastion", description: "Discover the secrets of the Calamity, a surreal catastrophe that shattered the world in this action game.", category: "Action", user_id: @new_users.sample.id },
  { title: "Hotline Miami", description: "Hotline Miami is a high-octane action game overflowing with raw brutality, hard-boiled gunplay and skull crushing close combat.", category: "Action", user_id: @new_users.sample.id },
  { title: "Katana Zero", description: "Katana ZERO is a stylish neo-noir, action game featuring breakneck action and instant-death combat.", category: "Action", user_id: @new_users.sample.id },
  { title: "Hellblade", description: "Hellblade: Senua's Sacrifice is a dark fantasy action-adventure game set in 8th century Ireland.", category: "Action", user_id: @new_users.sample.id },
  { title: "Nidhogg", description: "Nidhogg is the epic award-winning fencing tug-of-war, full of graceful acrobatics and clumsy stabs.", category: "Action", user_id: @new_users.sample.id },
  { title: "Binding of Isaac", description: "When Isaac’s mother starts hearing the voice of God demanding a sacrifice be made to prove her faith, Isaac escapes into the basement.", category: "Rogue-Like", user_id: @new_users.sample.id },
  { title: "Enter the Gungeon", description: "Enter the Gungeon is a bullet hell dungeon crawler following a band of misfits seeking to shoot, loot, dodge roll and table-flip their way to personal absolution.", category: "Rogue-Like", user_id: @new_users.sample.id },
  { title: "Dicey Dungeons", description: "In this new fast-paced deckbuilding roguelike you'll fight monsters, find better loot, and level up your heroes.", category: "Rogue-Like", user_id: @new_users.sample.id },
  { title: "Streets of Rogue", description: "Streets of Rogue is a rogue-like about freedom and anarchic fun. The game takes inspiration from fast-paced top-down rogue-likes like Binding of Isaac.", category: "Rogue-Like", user_id: @new_users.sample.id },
  { title: "Dead Cells", description: "Death is not the end. Play as a failed alchemic experiment and explore the sprawling, ever-changing castle to find out what happened on this gloomy island.", category: "Rogue-Like", user_id: @new_users.sample.id },
  { title: "Baba is You", description: "Baba Is You is a puzzle game where the rules you have to follow are present as blocks you can interact with.", category: "Puzzle", user_id: @new_users.sample.id },
  { title: "Gorogoa", description: "Gorogoa is an elegant evolution of the puzzle genre, told through a beautifully hand-drawn story.", category: "Puzzle", user_id: @new_users.sample.id },
  { title: "The Talos Principle", description: "The Talos Principle is a first-person puzzle game in the tradition of philosophical science fiction.", category: "Puzzle", user_id: @new_users.sample.id },
  { title: "Papers, Please", description: "Congratulations. The October labor lottery is complete. Your name was pulled. For immediate placement, report to the Ministry of Admission at Grestin Border Checkpoint.", category: "Puzzle", user_id: @new_users.sample.id },
  { title: "The Witness", description: "The Witness is a single-player game in an open world with dozens of locations to explore and over 500 puzzles.", category: "Puzzle", user_id: @new_users.sample.id }
]

path = Rails.root.join('games_images').to_s
i = 0
dir_array = []
Dir.foreach(path) do |dir|
  next unless dir.match?(/(\d)/)
  num = dir.match(/(\d)/)[1].to_i
  dir_array << dir
end
dir_array.sort!
dir_array.each do |dir|
  if dir.include?('images') && @games[i].present?
    game = Game.create! @games[i]
    puts "#{i + 1}. Game \"#{game.title}\" created"
    puts "Directory: #{dir}"
    images_to_attach = []
    Dir.foreach(File.join(path, dir)) do |file|
      if file.include?('.jpg')
        puts "File: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        images_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' }
        puts 'Uploaded!'
      elsif file.include?('.png')
        puts "File: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        images_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/png' }
        puts 'Uploaded!'
      end
    end
    game.update!(photos: images_to_attach)
    puts "Images attached!"
    i += 1
  end
end

puts "Finished!"





