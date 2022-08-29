require 'matrix'

# 算金額
def sum_value(vector)
    vector.dot Vector[1, 5, 10, 12, 50]
end

# 算硬幣數
def sum_coins(vector)
    vector.dot Vector[1, 1, 1, 1, 1]
end

def brute_decompose(vector)
    value = sum_value(vector)
    # 暴力嘗試某規則上限當作是 金額/幣值
    maxes = [(value/5).ceil, (value/10).ceil, (value/12).ceil, (value/50).ceil]
    min = sum_coins(vector)
    query = vector
    best = try = Vector[0, 0, 0, 0, 0]
    (0..maxes[0]).each do |i|
        (0..maxes[1]).each do |j|
            (0..maxes[2]).each do |k|
                (0..maxes[3]).each do |l|
                    try = $rules.transpose * Vector[i, j, k, l]
                    if sum_coins(try) < min && (vector + try).all? {|value| value >= 0}
                        min = sum_coins(try)
                        best = try
                        #puts "#{try} was worth trying and gives #{min} coins."
                    end
                end
            end
        end
    end
    puts "#{vector} - Performs #{best} to get #{best + vector} with #{sum_coins(best + vector)} coins."
end

$rules = Matrix[
    Vector[-5, 1, 0, 0, 0],
    Vector[0, -2, 1, 0, 0],
    Vector[-2, 0, -1, 1, 0],
    Vector[-2, 0, 0, -4, 1]
]

puts "Validating rules:"
$rules.row_vectors.each_with_index do |rule, i|
    puts "rule #{i}: #{rule.inspect} - delta value: #{sum_value(rule)}, delta # of coins: #{sum_coins(rule)}"
end
puts '-' * 25
(1..100).each do |i|
    brute_decompose(Vector[i, 0, 0, 0, 0])
end

=begin
# 嘗試拆解之
(1..50).each do |q|
    failed = [false, false, false, false]
    query = Vector[q, 0, 0, 0, 0]
    print "Decomposing #{query} to "

    while !(failed.all? true) # If some deduction can still be made
        trying = rules.map {|rule| rule + query}
        trying.each_with_index do |result, ith|
            if (result.all? {|value| value >= 0})
                #puts "#{query} - Rule #{ith} #{rules[ith]} - #{result}"
                query = result
                next
            else
                failed[ith] = true
            end
        end
    end
    puts query
end
=end