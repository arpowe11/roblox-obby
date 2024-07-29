local checkpoint = script.Parent

function stepOnCheckpoint (part)

  -- Check if it's a player that stepped on the checkpoint
  if part.Parent and part.Parent:FindFirstChild('Humanoid') then
    -- Get the player that stepped on the checkpoint
    local player = game.Players:GetPlayerFromCharater(part.Parent)
    -- Get the saved checkpoint data
    local checkpointData = game.ServerStorage:FindFirstChild('CheckpointData')
    
    -- Create the checkpoint data if it doesent existent
    if not checkpointData then
      -- Create the checkpoint data
      checkpointData = Instance.new('Model', game.ServerStorage)
      checkpointData.Name = 'CheckpointData'
    end
    
  end

end
checkpoint.Touched:Connect(stepOnCheckpoint)
