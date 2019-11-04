-- DeclineSpamChannelInvitations

local dsciFrame = CreateFrame("Frame")

dsciFrame:SetScript("OnEvent", function(self, event, channelID, name)
      if ("CHANNEL_INVITE_REQUEST" == event) then
         print("DeclineSpamChannelInvitations:", self, event, channelID, name)
         if string.find(channelID, "GOLD") then
            print("Spammer " .. name .. "invited you to channel " .. channelID)
            DeclineChannelInvite(channelID)
            return
         end
         -- for all other channels, invoke default handler
         UIParent_OnEvent(UIParent, event, channelID, name)
      end
   end
)

dsciFrame:RegisterEvent("CHANNEL_INVITE_REQUEST")

-- uncomment this once we know above is working
-- UIParent::UnregisterEvent("CHANNEL_INVITE_REQUEST")
