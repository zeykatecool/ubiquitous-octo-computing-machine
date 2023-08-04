local dia = require("discordia")
require("discordia-components")
local tools = require("discordia-slash").util.tools()
local CLIENT = dia.Client():useApplicationCommands()

CLIENT:on("ready", function()
  local commands = CLIENT:getGlobalApplicationCommands()
  for commandId in pairs(commands) do
    CLIENT:deleteGlobalApplicationCommand(commandId)
  end

  local pingCommand = {}
  pingCommand = tools.slashCommand("ping", "Botun durumunu öğren.")


  CLIENT:createGlobalApplicationCommand(pingCommand)

  CLIENT:info("Komutlar yüklendi , Mamut hazir!")
CLIENT:setActivity("Mamut")
end)

CLIENT:on("slashCommand", function(interaction, command, args)
  if command.name == "ping" then
    print("b : "..interaction.createdAt,"a : ".. os.time())
    local ping = math.floor(math.abs(interaction.createdAt-os.time()))
    interaction:reply("Pong,"..ping.."ms! :ping_pong:",true)

  end
end)


  CLIENT:run('Bot ')