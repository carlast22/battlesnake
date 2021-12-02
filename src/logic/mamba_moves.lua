local mamba_moves = {}

function mamba_moves.move(game_info)
    local head = game_info.you.head
    local neck = game_info.you.body[2]
    local food = game_info.board.food[1]
    local possible_moves = {up = true, down = true, left = true, right = true}

    if head.x < neck.x then
        possible_moves.right = false
    elseif head.x > neck.x then
        possible_moves.left = false
    elseif head.y < neck.y then
        possible_moves.up = false
    else
        possible_moves.down = false
    end

    if head.x < food.x and possible_moves.right then
        return "right"
    elseif head.x > food.x and possible_moves.left then
        return "left"
    elseif head.y < food.y and possible_moves.up then
        return "up"
    elseif head.y > food.y and possible_moves.down then
        return "down"
    end

    for move, is_possible in pairs(possible_moves) do
        if is_possible then
            return move
        end
    end

end

return mamba_moves