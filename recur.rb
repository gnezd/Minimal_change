# With recursion!
# 輸出金額n最少須由幾顆硬幣組成
def min_coins(n, trivials)

    min = n
    return trivials[n], trivials if trivials[n]
    
    # 試試看拿走任一種硬幣各一顆
    # 醜惡的先展開寫因為用 [].each 會出現層數爆炸問題
    if n > 50
        try, trivials = min_coins(n - 50, trivials) # 拿走之後需要幾顆啊，遞迴
        trivials[n-50] = try # 辛苦算出來的答案需記載
        min = try + 1 if min > try + 1 # 如果有最好的拿法那就是他了
    end

    if n > 12 
        try, trivials = min_coins(n - 12, trivials)
        trivials[n-12] = try
        min = try + 1 if min > try + 1
    end

    if n > 10 
        try, trivials = min_coins(n - 10, trivials)
        trivials[n-10] = try
        min = try + 1 if min > try + 1
    end
    
    if n > 5
        try, trivials = min_coins(n - 5, trivials)
        trivials[n-5] = try 
        min = try + 1 if min > try + 1
    end
    try, trivials = min_coins(n - 1, trivials)
    trivials[n-1] = try
    min = try + 1 if min > try + 1
    
    trivials[n] = min
    return min, trivials
end

# 紀載解答用此 Hash
trivials = {1 => 1, 5 => 1, 10 => 1, 12 => 1, 50 => 1}
q = ARGV[0].to_i

(1..Math.log2(q).floor).each do |i|
    break if 2 ** i < 1000
    n, trivials = min_coins(2 ** i, trivials)
end

n, trivials = min_coins(ARGV[0].to_i, trivials)
puts n