local mamba_moves = require ".etc.nginx.battlesnake.logic.mamba_moves"
local cjson = require "cjson"
ngx.req.read_body()

local game_info = cjson.decode(ngx.req.get_body_data())
-- ngx.log(ngx.ERR, game_info["you"]["name"])

local response = {
    move = mamba_moves.move(game_info)
}

ngx.say(cjson.encode(response))