CreateInstance = function()
	local __ERROR__ = Instance.new('BindableEvent')
	__ERROR__['Event']:Connect(error)
	
	local Create = function(class, parent)
		local Inst = Instance.new(class)
		Inst.Parent = parent
		return setmetatable({}, {
			__metatable = Inst;
			__call = function(self, Props)
				for Name, Val in next, (Props) do
					local Set, Ret = pcall(function()
						Inst[Name] = Val
					end)
					
					if not Set then
						__ERROR__:Fire('[ERROR]:- Failed to set ' .. Name .. ' on ' .. tostring(Inst))
					end
				end
				
				return Inst
			end
		})
	end

	local Main = Create('BillboardGui'){
		Active = true;
		LightInfluence = 1;
		AlwaysOnTop = true;
		Size = UDim2.new(0, 200, 0, 200);
		ClipsDescendants = true;
		Name = "Aspect-Ware";
		StudsOffsetWorldSpace = Vector3.new(0, 3.5, 0);
		MaxDistance = 45
	}
	
	local TextLabel = Create('TextLabel', Main){
		TextWrapped = true;
		BackgroundColor3 = Color3.new(1, 1, 1);
		TextSize = 45;
		Size = UDim2.new(0, 200, 0, 50);
		Name = "MainLabel";
		Text = "User Info:";
		BackgroundTransparency = 1;
		TextColor3 = Color3.new(1, 1, 1)
	}
	
	local TextLabel1 = Create('TextLabel', Main){
		TextWrapped = true;
		BackgroundColor3 = Color3.new(1, 1, 1);
		TextSize = 25;
		Size = UDim2.new(0, 200, 0, 50);
		Name = "Script";
		Text = "Active Script: Aspect-Ware";
		BackgroundTransparency = 1;
		Position = UDim2.new(0, 0, 0, 150);
		TextColor3 = Color3.new(1, 1, 1)
	}
	
	local TextLabel2 = Create('TextLabel', Main){
		TextWrapped = true;
		BackgroundColor3 = Color3.new(1, 1, 1);
		TextSize = 25;
		Size = UDim2.new(0, 200, 0, 50);
		Name = "Executor";
		Text = "Executor (Synapse X)";
		BackgroundTransparency = 1;
		Position = UDim2.new(0, 0, 0, 50);
		TextColor3 = Color3.new(1, 1, 1)
	}
	
	local TextLabel3 = Create('TextLabel', Main){
		TextWrapped = true;
		TextScaled = true;
		BackgroundColor3 = Color3.new(1, 1, 1);
		TextSize = 25;
		Size = UDim2.new(0, 200, 0, 50);
		Name = "Blank";
		Text = "━━━━━━━━━━━━";
		BackgroundTransparency = 1;
		Position = UDim2.new(0, 0, 0, 100);
		TextColor3 = Color3.new(1, 1, 1)
	}

	
	return Main
end
