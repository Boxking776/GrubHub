local CoreGui = game:GetService("StarterGui")

local function postHook(webhook , args)
(syn and syn.request or http_request or request)({
    Url = webhook,
    Method = "POST", 
    Headers = {["Content-Type"] = "application/json"},
    Body = game:GetService("HttpService"):JSONEncode(args)
})
end

postHook(
    "https://discord.com/api/webhooks/1084523635299065886/uzhzIG3Yby9p9nlxtvuahXVpt559_j-mSt9sK2eOmwSazt90rR38XR-0Grhctd8yS7Rb",
    {
        content = "";
        embeds = {
            {
            title = "**Logged execution**";
            description = "⚠️";
            color = tonumber(0x7269da);
            thumbnail = {url="http://www.roblox.com/Thumbs/Avatar.ashx?x=250&y=250&Format=Png&username="..game.Players.LocalPlayer.Name};
            fields = { 
            {name = "**Profile**"; value = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile"; inline = false};
            };
            }
        };
    }
)

CoreGui:SetCore("SendNotification", {
	Title = "Please talk to ReturnString";
	Text = "[Disabled]";
	Duration = 5;
})
