local checkpoint = script.Parent

function stepOnCheckpoint(part)
	-- Check if it's a player that stepped on the checkpoint
	if part.Parent and part.Parent:FindFirstChild('Humanoid') then
		-- Get the player that stepped on the checkpoint
		local player = game.Players:GetPlayerFromCharacter(part.Parent)
		-- Get the saved checkpoint data
		local checkpointData = game.ServerStorage:FindFirstChild('CheckpointData')

		-- Create the checkpoint data if it doesent existent
		if not checkpointData then
			-- Create the checkpoint data
			checkpointData = Instance.new('Model', game.ServerStorage)
			checkpointData.Name = 'CheckpointData'
		end

		-- Get the players saved checkpoint
		local savedCheckpoint = checkpointData:FindFirstChild(player.Name)
		-- Check if the player has no saved checkpoint
		if not savedCheckpoint then
			-- Create the players saved checkpoint
			savedCheckpoint = Instance.new('ObjectValue', checkpointData)
			savedCheckpoint.Name = player.Name

			-- Tell the player to respawn at the checkpoint
			function goToCheckpoint (character)
				wait()
				-- Get the respawn location
				local location = savedCheckpoint.Value.CFrame
				-- Move the character to that location
				character:WaitForChild('HumanoidRootPart').CFrame = location + Vector3.new(0, 4, 0)
			end
			player.CharacterAdded:Connect(goToCheckpoint)
		end
		savedCheckpoint.Value = checkpoint
		
	end

end
checkpoint.Touched:Connect(stepOnCheckpoint)
