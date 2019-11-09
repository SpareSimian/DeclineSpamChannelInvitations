-- DeclineSpamChannelInvitations

local dsciFrame = CreateFrame("Frame")

dsciFrame:SetScript("OnEvent", function(self, event, channelID, name)
      if ("CHANNEL_INVITE_REQUEST" == event) then
         --print("DeclineSpamChannelInvitations:", self, event, channelID, name)
         if string.find(channelID, "www[A-Z0-9]+com") then
            print("Declining invitation to channel " .. channelID .. by " spammer " .. name)
            DeclineChannelInvite(channelID)
            -- we could open the report dialog but we need a PlayerLocation, how do we get that?
            -- C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_SPAM, name, playerLocation);
            return
         end
         -- for all other channels, invoke default handler
         UIParent_OnEvent(UIParent, event, channelID, name)
      end
   end
)

dsciFrame:RegisterEvent("CHANNEL_INVITE_REQUEST")

-- uncomment this once we know above is working
-- don't let default handler pop up accept dialog until we've looked at the channel name
UIParent:UnregisterEvent("CHANNEL_INVITE_REQUEST")
