this directory is used for learning excel data cleaning

1. pivot table
excel找到插入栏目，选择pivot table
  按照视频教程：我们先把country拖到row中，然后把state拖到row中（类似于sql的group by）
    形如country这种首列的排序需要点击列右侧的下拉箭头，然后进行排序
  然后拖动revnue，系统自动计算总和total revenue：我们可以选中revnue列，然后将格式改为货币
  我们可以选中列，然后对其进行改名，同样的，我们也可以改变显示方式，比如说案例中的展示比例
    然后，回到列上，我们可以对数据展示进行排序
  如果要新建列，打开分析-字段和项-计算字段
    修改字段名称和公式，其中公式修改为字段间的四则运算，如 =(字段1-字段2）
    另外，新建列不支持任何操作；新建的列会出现在右侧的字段中
  筛选器则是筛选掉特定的列，如案例中的把国家筛选掉，类似于sql的group by（筛选器会出现在第一行第二列的位置）
    如果我们要查看具体的国家，则是选中上面的全部中的指定的国家
总结：利用pivot table数据透视表，我们可以快速提取到表中的基于指定内容的信息
2. formulas 
