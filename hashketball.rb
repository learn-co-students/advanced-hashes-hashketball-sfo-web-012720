require 'pp'
require 'pry'
def game_hash 
{
  :away => { 
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
       :number => 4,
       :shoe => 18,
       :points => 10,
       :rebounds => 1,
       :assists => 1,
       :steals => 2,
       :blocks => 7,
       :slam_dunks => 2
      },
      {:player_name => "Bismack Biyombo",
       :number => 0,
       :shoe => 16,
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 22,
       :blocks => 15,
       :slam_dunks => 10
      },
      {:player_name => "DeSagna Diop",
       :number => 2,
       :shoe => 14,
       :points => 24,
       :rebounds => 12,
       :assists => 12,
       :steals => 4,
       :blocks => 5,
       :slam_dunks => 5
      },
      {:player_name => "Ben Gordon",
       :number => 8,
       :shoe => 15,
       :points => 33,
       :rebounds => 3,
       :assists => 2,
       :steals => 1,
       :blocks => 1,
       :slam_dunks => 0
      },
      {:player_name => "Kemba Walker",
       :number => 33,
       :shoe => 15,
       :points => 6,
       :rebounds => 12,
       :assists => 12,
       :steals => 7,
       :blocks => 5,
       :slam_dunks => 12
      },
    ]
  },
  :home => { 
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
       :number => 0,
       :shoe => 16,
       :points => 22,
       :rebounds => 12,
       :assists => 12,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 1
      },
      {:player_name => "Reggie Evans",
       :number => 30,
       :shoe => 14,
       :points => 12,
       :rebounds => 12,
       :assists => 12,
       :steals => 12,
       :blocks => 12,
       :slam_dunks => 7
      },
      {:player_name => "Brook Lopez",
       :number => 11,
       :shoe => 17,
       :points => 17,
       :rebounds => 19,
       :assists => 10,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 15
      },
      {:player_name => "Mason Plumlee",
       :number => 1,
       :shoe => 19,
       :points => 26,
       :rebounds => 11,
       :assists => 6,
       :steals => 3,
       :blocks => 8,
       :slam_dunks => 5
      },
      {:player_name => "Jason Terry",
       :number => 31,
       :shoe => 15,
       :points => 19,
       :rebounds => 2,
       :assists => 2,
       :steals => 4,
       :blocks => 11,
       :slam_dunks => 1
      },
    ]
  }
}
end

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  nums_arr =[]
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            nums_arr << player[:number]
          end
        end
      end
    end
  end
  nums_arr
end

def player_stats(player_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == player_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  big_shoe_rebound = 0
  big_shoe_size = 0
  game_hash.each do |place, team|
    team[:players].each do |data|
      if data[:shoe] > big_shoe_size
        big_shoe_rebound = data[:rebounds]
        big_shoe_size = data[:shoe]
      end
    end
  end
  return big_shoe_rebound
end

def most_points_scored
  most_points = 0
  most_points_player = ''
  game_hash.each do |place, team|
    team[:players].each do |data|
      if data[:points] > most_points
        most_points = data[:points]
        most_points_player = data[:player_name]
      end
    end
  end
  return most_points_player
end

def winning_team 
  away_points = 0
  home_points = 0
  game_hash[:away][:players].each do |player|
    away_points += player[:points]
  end
  game_hash[:home][:players].each do |player|
    home_points += player[:points]
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ''
  game_hash.each do |place, team|
    team[:players].each do |data|
      if data[:player_name].length > longest_name.length
        longest_name = data[:player_name]
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = ''
  game_hash.each do |place, team|
    team[:players].each do |data|
      if data[:steals] > most_steals
        most_steals = data[:steals]
        player_with_most_steals = data[:name]
      end
    end
  end
  if player_with_longest_name() == player_with_most_steals
    return false
  else
    return true
  end
end


























  
  
  
  
  