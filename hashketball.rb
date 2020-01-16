def game_hash()
  new_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players  => [
          {
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16, 
            :points => 22,
            :rebounds => 12, 
            :assists => 12, 
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
            },
          {
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals =>12,
            :blocks => 12, 
            :slam_dunks => 7
            },
            {
              :player_name => "Brook Lopez",
              :number => 11, 
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15
            },
            {
              :player_name => "Mason Plumlee",
              :number => 1, 
              :shoe => 19,
              :points => 26,
              :rebounds => 11,
              :assists => 6,
              :steals => 3,
              :blocks => 8,
              :slam_dunks => 5
            },
            {
              :player_name => "Jason Terry",
              :number => 31, 
              :shoe => 15,
              :points => 19,
              :rebounds => 2,
              :assists => 2,
              :steals => 4,
              :blocks =>11,
              :slam_dunks => 1
            }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Purple","Turquoise"],
      :players => [
          {
            :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          {
            :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16, 
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          
          {
            :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14, 
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          
          {
            :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15, 
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          
          {
            :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15, 
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
          
        ]
    }
  }
  
  return new_hash
end

def num_points_scored(player_search)
  game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player| #player array
      if player[:player_name] == player_search
        return player[:points] 
      end
      
    end 
  end


end

def shoe_size(player_search)
  game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_search
        return player[:shoe]
      end
    end
  end
  
end

  def team_colors(team_name)
      if team_name == "Brooklyn Nets"
        return game_hash[:home][:colors]
      elsif team_name == "Charlotte Hornets"
        return game_hash[:away][:colors]
      else  
        return "Sorry we do not have that team name"
      end

  end

def team_names
  game_hash.map do |h_or_a, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team_name)
  new_arr = []

  game_hash.each do |h_or_a, team_info|
   if team_info[:team_name] == team_name
    team_info.each do |key, value|
      if key == :players
        value.each do |player|
          new_arr << player[:number]
        end
      end
    end
   end
  end

return new_arr
end

def player_stats(player_name)
  new_hash = {}

  game_hash.each do |h_or_a, team_info|
    team_info.each do |key,value|
      if key == :players
        value.each do |player|
          if player[:player_name] == player_name
            new_hash = player

          end
        end
      end
    
    end
  end

  new_hash.delete(:player_name)
  return new_hash
   
  
end


def big_shoe_rebounds

  player_shoe_size = 0
  total_rebounds = 0

  game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player|
       if player[:shoe] > player_shoe_size
        player_shoe_size = player[:shoe]
        total_rebounds = player[:rebounds]
       end
    end
  end

  return total_rebounds
end

def most_points_scored
  most_points = 0 
  highest_scorer = ""
  game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player|
      
      if player[:points] > most_points
        most_points = player[:points]
        highest_scorer = player[:player_name]
      end
    end
  end
  highest_scorer
end



def winning_team
   hornets_scoring = 0 
   nets_scoring = 0
  
  game_hash.each do |h_or_a, team_info|
    if team_info[:team_name] == "Brooklyn Nets"
      team_info[:players].each do |player|
        nets_scoring += player[:points]
      end
    elsif team_info[:team_name] == "Charlotte Hornets"
      team_info[:players].each do |player|
       hornets_scoring += player[:points]
      end
    end
  
  end

    if hornets_scoring > nets_scoring
      return "Charlotte Hornets"
    else  
      return "Brooklyn Nets"
    end

end


def player_with_longest_name
player_name_lenth = 0
longest_name = ""

  game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player|
      if player[:player_name].length > player_name_lenth
        player_name_lenth = player[:player_name].length
        longest_name = player[:player_name]
      end
    end
  end

return longest_name
end

def long_name_steals_a_ton?
   most_steals = 0
   most_steals_player = ""

   game_hash.each do |h_or_a, team_info|
    team_info[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        most_steals_player = player[:player_name]
      end
    end
   end
   
     if most_steals_player == player_with_longest_name
      return true
     end

   
end