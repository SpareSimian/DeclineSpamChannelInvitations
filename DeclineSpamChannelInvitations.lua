-- DeclineSpamChannelInvitations

local dsciFrame = CreateFrame("DeclineSpamChannelInvitations")

function dsciFrame:OnChannelInviteRequest(...)
   print("DeclineSpamChannelInvitations:", ...)

   -- todo: match spammer's channel pattern and invoke DeclineChannelInvite()
   -- for all other channels, invoke UIParent_OnEvent()
end

dsciFrame:RegisterEvent("CHANNEL_INVITE_REQUEST")

-- UIParent::UnregisterEvent("")
