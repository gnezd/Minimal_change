def get_coin_count(exchange):
import sys

def get_coin_count(exchange):
    min_coin_count = [0 for i in range(exchange+1)]
    min_coin_count[0] = 0
    min_coin_count[1] = 1

    coin_types = 5
    coins_returned = [[0 for _ in range(coin_types)] for _ in range(exchange+1)]
    
    coin_map = {1:0, 5:1, 10:2, 12:3, 50:4} # Mapping coin:index
    
    coins_returned[1][coin_map[1]] = 1
    
    coin_value = [1, 5, 10, 12, 50]
    
    # Searching for best solution
    for i in range(2,exchange+1):
        min_num = sys.maxsize
        added_coin_value = coin_value[0]
        for value in coin_value:
            if i-value >=0:
                if min_coin_count[i-value] + 1 < min_num:
                    min_num = min_coin_count[i-value] + 1
                    added_coin_value = value
            
            
        min_coin_count[i] = min_num
        coins_returned[i] = coins_returned[i-added_coin_value][:] # Copy from previous best case
        coins_returned[i][coin_map[added_coin_value]] += 1 
            
            
    print(f"1: {coins_returned[exchange][coin_map[1]]}")
    print(f"5: {coins_returned[exchange][coin_map[5]]}")
    print(f"10: {coins_returned[exchange][coin_map[10]]}")
    print(f"12: {coins_returned[exchange][coin_map[12]]}")
    print(f"50: {coins_returned[exchange][coin_map[50]]}")
    print(f"Total coins: {min_coin_count[exchange]}")            


get_coin_count(30)




