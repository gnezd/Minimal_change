#!/usr/bin/env python
# coding: utf-8

# In[122]:


def get_coin_count(exchange):
    min_coin_count = [0 for i in range(exchange+1)]
    min_coin_count[0] = 0
    min_coin_count[1] = 1

    coin_types = 5
    coins_returned = [[0 for _ in range(coin_types)] for _ in range(exchange+1)]
    
    coin_map = {1:0, 5:1, 10:2, 12:3, 50:4} # Mapping coin:index
    
    coins_returned[1][coin_map[1]] = 1

    for i in range(2,exchange+1):
        if i%50==0:
            min_coin_count[i] = min_coin_count[i-50] + 1
            
            coins_returned[i] = coins_returned[i-50][:]
            coins_returned[i][coin_map[50]] += 1
            
        elif i%12==0:
            min_coin_count[i] = min_coin_count[i-12] + 1
            
            coins_returned[i] = coins_returned[i-12][:]
            coins_returned[i][coin_map[12]] += 1

        elif i%10==0:
            min_coin_count[i] = min_coin_count[i-10] + 1

            coins_returned[i] = coins_returned[i-10][:]
            coins_returned[i][coin_map[10]] += 1

        elif i%5==0:
            min_coin_count[i] = min_coin_count[i-5] + 1
            
            coins_returned[i] = coins_returned[i-5][:]
            coins_returned[i][coin_map[5]] += 1
            
        elif i%1==0:
            min_coin_count[i] = min_coin_count[i-1] + 1
            
            coins_returned[i] = coins_returned[i-1][:]
            coins_returned[i][coin_map[1]] += 1
            
    print(f"1: {coins_returned[exchange][coin_map[1]]}")
    print(f"5: {coins_returned[exchange][coin_map[5]]}")
    print(f"10: {coins_returned[exchange][coin_map[10]]}")
    print(f"12: {coins_returned[exchange][coin_map[12]]}")
    print(f"50: {coins_returned[exchange][coin_map[50]]}")
    print(f"Total coins: {min_coin_count[exchange]}")
            


# In[123]:


get_coin_count(30)


# In[ ]:




