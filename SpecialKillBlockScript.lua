
local scripts = game:GetService("ServerScriptService")
local scoreScript = require(scripts.Gameplay.Scripts.Scoring)
local Players = game:GetService("Players")

function destroyPlayer(hit)
	local players = Players:GetPlayers()
	--local leaderstats = player and player:FindFirstChild("leaderstats")
	--local score = leaderstats and leaderstats:FindFirstChild("Score")
	
	if hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		if hit.Parent.Humanoid.Health <= 0 then
			return
		end
		hit.Parent.Humanoid.Health = 0
		local hitPlayer = Players:FindFirstChild(hit.Parent.Name)
		local hitTeam = hitPlayer.Team
		
		if hitTeam == game.Teams.Green then
			scoreScript.incrementTeamScore(game.Teams.Pink, 1)
			scoreScript.updateScores(game.Teams.Pink)
		elseif hitTeam == game.Teams.Pink then
			scoreScript.incrementTeamScore(game.Teams.Green, 1)
			scoreScript.updateScores(game.Teams.Green)
		end
	end

end
script.Parent.Touched:connect(destroyPlayer)


