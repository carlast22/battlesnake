local luaunit = require "luaunit"
local inspect = require "inspect"
local mamba_moves = require ".src.logic.mamba_moves"

TestMoves = {}

    local board = { food = {{x=0, y=0}}}

    function TestMoves:testDoesNotMoveRightIfHeadLessThanNeckInX()
        local game_info = {you = { body = {{x = 0, y = 0}, {x = 1, y = 0}}, head = {x = 0, y = 0} }, board = board}
        luaunit.assertNotEquals(mamba_moves.move(game_info), "right")
    end

    function TestMoves:testDoesNotMoveLeftIfHeadMoreThanNeckInX()
        local game_info = {you = { body = {{x = 1, y = 0}, {x = 0, y = 0}}, head = {x = 1, y = 0} }, board = board}
        luaunit.assertNotEquals(mamba_moves.move(game_info), "left")
    end
    
    function TestMoves:testDoesNotMoveUpIfHeadMoreThanNeckInY()
        local game_info = {you = { body = {{x = 0, y = 0}, {x = 0, y = 1}}, head = {x = 0, y = 0} }, board = board}
        luaunit.assertNotEquals(mamba_moves.move(game_info), "up")
    end

    function TestMoves:testDoesNotMoveDownIfHeadLessThanNeckY()
        local game_info = {you = { body = {{x = 0, y = 1}, {x = 0, y = 0}}, head = {x = 0, y = 1} }, board = board}
        luaunit.assertNotEquals(mamba_moves.move(game_info), "down")
    end

    function TestMoves:testMovesRightTowardsFood()
        local you = { body = {{x = 4, y = 5}, {x = 4, y = 4}}, head = {x = 4, y = 5} }
        local board = { food = {{x = 5, y = 5}}}
        local game_info = {you = you, board = board}
        luaunit.assertEquals(mamba_moves.move(game_info), "right")
    end

    function TestMoves:testMovesLeftTowardsFood()
        local you = { body = {{x = 4, y = 5}, {x = 4, y = 4}}, head = {x = 4, y = 5} }
        local board = { food = {{x = 2, y = 5}}}
        local game_info = {you = you, board = board}
        luaunit.assertEquals(mamba_moves.move(game_info), "left")
    end

    function TestMoves:testMovesUpTowardsFood()
        local you = { body = {{x = 2, y = 3}, {x = 1, y = 3}}, head = {x = 2, y = 3} }
        local board = { food = {{x = 2, y = 5}}}
        local game_info = {you = you, board = board}
        luaunit.assertEquals(mamba_moves.move(game_info), "up")
    end

    function TestMoves:testMovesDownTowardsFood()
        local you = { body = {{x = 2, y = 3}, {x = 1, y = 3}}, head = {x = 2, y = 3} }
        local board = { food = {{x = 2, y = 0}}}
        local game_info = {you = you, board = board}
        luaunit.assertEquals(mamba_moves.move(game_info), "down")
    end

    function TestMoves:testDoesNotMoveOverNeckToFindFood()
        local you = { body = {{x = 4, y = 5}, {x = 3, y = 5}}, head = {x = 4, y = 5} }
        local board = { food = {{x = 1, y = 5}}}
        local game_info = {you = you, board = board}
        luaunit.assertNotEquals(mamba_moves.move(game_info), "left")
    end

    

os.exit( luaunit.LuaUnit.run() )