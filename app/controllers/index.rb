get '/' do
  # Look in app/views/index.erb
  erb :index
end

###### posts

post '/' do
  if params["p1_init"].downcase == params["p2_init"].downcase
    #can't play each other. throw error back to home
    @error = "Initials Can't Match"
    erb :index
  elsif params["p1_init"].empty? || params["p2_init"].empty?
    @error = "Both Fields Must Be Filled In"
    erb :index
  else
    #find or create player(s)
    @player1 = Player.find_or_create_by_initials(params["p1_init"])
    @player2 = Player.find_or_create_by_initials(params["p2_init"])

    erb :startgame
  end
end


post '/endgame' do
 puts params.inspect
  @game = Game.new
  @game.winner_time = params["winner_time"]
  @game.save
  puts "winner time" + @game.winner_time.to_s
  erb :results
end
