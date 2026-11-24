-- ElizziHub Loader
-- Created by wldv

task.spawn(function()
    local gameid = game.PlaceId
    local base_url = "https://raw.githubusercontent.com/wldv/ElizziHub/main/"
    
    local supported_games = {
        [73768006371986] = "games/obbyscript.luau" -- Save the Krusty Krab
    }

    if supported_games[gameid] then
        loadstring(game:HttpGet(base_url .. supported_games[gameid]))()
    else game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "ElizziHub";
            Text = "This game is not supported";
            Duration = 5;
        })
    end
end)