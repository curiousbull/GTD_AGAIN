import tushare as ts
import pandas as pd

# 获取今日所有可交易股票的行情数据
df = ts.get_today_all()

# 将今日所有可交易的股票代码加入股票池
universe = df.iloc[:,0]

# 依次对股票池股票进行取出操作
for stock in universe:
    df_stock = ts.get_k_data("%s"%stock, start='2010-01-01', end='2017-07-06', retry_count=5, pause=30)
    df_stock.to_csv("%s.csv"%stock)
