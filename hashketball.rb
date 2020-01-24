require 'pp'

def game_hash
  
  data = {}
  
  # TOP LEVEL and TEAM LEVEL hard code
  
  data[:home] = {:team_name => 'Brooklyn Nets',
                 :colors    => ['Black', 'White'],
                 :players   => []}
                 
  data[:away] = {:team_name => 'Charlotte Hornets',
                 :colors    => ['Turquoise', 'Purple'],
                 :players   => []}
  
  
  #HOME TEAM PLAYERS
  home = data[:home][:players]
  
  home.push(assemble_player(['Alan Anderson', 0, 16, 22, 12, 12, 3, 1, 1]))
  home.push(assemble_player(['Reggie Evans', 30, 14, 12, 12, 12, 12, 12, 7]))
  home.push(assemble_player(['Brook Lopez', 11, 17, 17, 19, 10, 3, 1, 15]))
  home.push(assemble_player(['Mason Plumlee', 1, 19, 26, 11, 6, 3, 8, 5]))
  home.push(assemble_player(['Jason Terry', 31, 15, 19, 2, 2, 4, 11, 1]))
  
  
  #AWAY TEAM PLAYERS
  aw = data[:away][:players]
  aw.push(assemble_player(['Jeff Adrien', 4, 18, 10, 1, 1, 2, 7, 2]))
  aw.push(assemble_player(['Bismack Biyombo', 0, 16, 12, 4, 7, 22, 15, 10]))
  aw.push(assemble_player(['DeSagna Diop', 2, 14, 24, 12, 12, 4, 5, 5]))
  aw.push(assemble_player(['Ben Gordon', 8, 15, 33, 3, 2, 1, 1, 0]))
  aw.push(assemble_player(['Kemba Walker', 33, 15, 6, 12, 12, 7, 5, 12]))
  
  data
  
end



def assemble_player(array)
  
  output = {}
  
  output[:player_name] = array[0]
  output[:number]      = array[1]
  output[:shoe]        = array[2]
  output[:points]      = array[3]
  output[:rebounds]    = array[4]
  output[:assists]     = array[5]
  output[:steals]      = array[6]
  output[:blocks]      = array[7]
  output[:slam_dunks]  = array[8]
  
  output
  
end



def collect_players
  
  data = game_hash
  home_players = data[:home][:players]
  away_players = data[:away][:players]
  players = home_players + away_players
  players

end


def find_player_data(name, data)

  for player in collect_players
  
    if name == player[:player_name]
    
      return player
  
    end

  end

end



def num_points_scored(name)
  
  data = game_hash
  
  player = find_player_data(name, data)
  
  player[:points]
  
end



def shoe_size(name)
  
  data = game_hash
  
  player = find_player_data(name, data)
  
  player[:shoe]
  
end



def team_colors(name)
  
  data = game_hash
  
  for team in data
  
    if name == team[1][:team_name]
      
      return team[1][:colors]
      
    end
    
  end
  
end



def team_names
  
  output = []
  
  data = game_hash
  
  for team in data
  
    output.push(team[1][:team_name])
    
  end
  
  output
  
end



def player_numbers(name)
  
  output = []
  
  data = game_hash
  
  for team in data
  
    if name == team[1][:team_name]
      
      for player in team[1][:players]
      
        output.push(player[:number])
        
      end
      
    end
    
  end
  
  output

end



def player_stats(name)
  
  data = game_hash
  
  output = find_player_data(name, data)
  
  output.delete(:player_name)
  
  output

end



def big_shoe_rebounds
  
  output = 0
  shoe = 0
  
  data = game_hash
  
  for team in data
      
    for player in team[1][:players]
      
      if player[:shoe] > shoe
        
        shoe = player[:shoe]
        output = player[:rebounds]
        
      end
      
    end
    
  end
  
  output

end



def winning_team
  
  homeScore = 0
  awayScore = 0
  
  data = game_hash
  home_players = data[:home][:players]
  away_players = data[:away][:players]
  
  for home_player in home_players
    homeScore += home_player[:points]
    
  end
  
  
  for away_player in away_players
    awayScore += away_player[:points]
    
  end
  
  if homeScore > awayScore
    
    return data[:home][:team_name]
    
  else
    
    return data[:away][:team_name]
    
  end

end

def most_points_scored
  
  data = game_hash
  top_player = 'Michael Jordan'
  top_score = 0
  
  
  for player in collect_players
    
    if player[:points] > top_score
      
      top_player = player[:player_name]
      top_score  = player[:points]
  
    end
  
  end  
    
  top_player
  
end
  


def player_with_longest_name
  
  data = collect_players
  longName = ""
  
  for player in data
  
    if player[:player_name].size > longName.size
      
      longName = player[:player_name]
      
    end
    
  end
    
  longName
  
end
  
  

def top_steals
  
  data = game_hash
  top_player = 'Michael Jordan'
  top_steals = 0
  
  
  for player in collect_players
    
    if player[:steals] > top_steals
      
      top_player = player[:player_name]
      top_steals  = player[:steals]
  
    end
  
  end  
    
  top_player
  
end



def long_name_steals_a_ton?
  
  if player_with_longest_name == top_steals
    
    return true
    
  else
    
    return false
    
  end
  
end
  