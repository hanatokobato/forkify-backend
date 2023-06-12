def l_bang board
  rows = board.length
  cols = board[0].length

  visitted = Array.new(rows) { Array.new(cols, false) }

  move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  effort = {
    0 => [[0, 0]]
  }

  loop do
    smallest_effort = effort.keys.min
    return -1 unless smallest_effort

    v = effort[smallest_effort].pop
    effort.delete(smallest_effort) if effort[smallest_effort].length == 0

    return smallest_effort if v[0] == rows - 1 && v[1] == cols - 1
    next if visitted[v[0]][v[1]]

    visitted[v[0]][v[1]] = true

    move.each do |m|
      v_x = v[0] + m[0]
      v_y = v[1] + m[1]

      next if v_x < 0 || v_x >= rows || v_y < 0 || v_y >= cols || visitted[v_x][v_y]

      v_weight = if smallest_effort + 1 >= board[v_x][v_y]
        smallest_effort + 1
      elsif smallest_effort > 0 || board[0][1] <= 1 || board[1][0] <= 1
        ((board[v_x][v_y] - 1 - smallest_effort) / 2.0).ceil * 2 + 1 + smallest_effort
      end

      if v_weight
        effort[v_weight] ||= []
        effort[v_weight] << [v_x, v_y]
      end
    end
  end
end
