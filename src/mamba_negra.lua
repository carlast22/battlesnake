local cjson = require "cjson"

local mamba_negra = {
    apiversion = "1",
    author = "carlast22",
    color = "#3d3d3d",
    head = "evil",
    tail = "hook",
    version = "0.1.0"
}

ngx.say(cjson.encode(mamba_negra))