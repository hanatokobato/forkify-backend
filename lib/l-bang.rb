def l_bang(a, b, c, n)
  return '' if n <= 1 || a < 0 || b < 0 || c < 0

  min, mid, max = [a, b, c].sort
  min_char, mid_char, max_char = ['a', 'b', 'c']
  k = n - 1
  return max_char * max + mid_char * mid + min_char * min if k >= max

  max_block_count = max % k == 0 ? (max / k) : (max / k + 1)
  mid_min_arr = []
  if mid + min <= max_block_count
    mid_min_arr = mid.times.map{|i| mid_char} + min.times.map{|i| min_char}
  else
    if (mid >= max_block_count)
      main_mid = mid / max_block_count
      main_min = min / max_block_count
      remain_min = min % max_block_count
      min_arr = remain_min.times.map{|i| min_char * (main_min + 1)} + (main_min > 0 ? (max_block_count - remain_min).times.map{|i| min_char * main_min} : [])
      remain = mid % max_block_count
      mid_arr = remain.times.map{|i| mid_char * (main_mid + 1)} + (max_block_count - remain).times.map{|i| mid_char * main_mid}
      mid_min_arr = mid_arr.map.with_index{|str, i| "#{str}#{min_arr[i]}"}
    else
      following_min = max_block_count - mid
      following_min = following_min < min ? following_min : min
      remain_min = min - following_min
      mid_min_arr = mid.times.map{|i| mid_char} + following_min.times.map{|i| min_char}
      remain_min.times.each{|i| mid_min_arr[i] = "#{mid_min_arr[i]}#{min_char}"}
    end
  end

  result = ''
  max_block_str = max_char * k
  last_max_str = max % k == 0 ? max_block_str : (max_char * (max % k))
  mid_min_arr_length = mid_min_arr.length
  if (mid_min_arr_length > 0)
    mid_min_arr.each_with_index do |mid_min, i|
      if i == mid_min_arr_length - 1
        result += mid_min_arr_length === max_block_count ? "#{last_max_str}#{mid_min}" : "#{max_block_str}#{mid_min}#{last_max_str}"
      else
        result += "#{max_block_str}#{mid_min}"
      end
    end
  else
    result = max <= k ? max_char * max : max_block_str
  end

  result
end
