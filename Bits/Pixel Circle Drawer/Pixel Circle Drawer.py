while True:
    l = []
    try:
        d = int(input('请输入正整数直径：')) # 检查小数
        if d <= 0: # 检查负数和0
            d = l[d]
    except:
        print ('输入错误！\n-----------------------------')
        continue
    w = d / 2
    z = w % 1 + 0.5
    y = d % 2
    x = d // 2
    l.append(d) # 计算一半弦长数列
    while len(l) - z + 0.5 < l[len(l) - 1] / 2:
        l.append(l[len(l) - 1])
        while (w + len(l) - z) * (w - len(l) + z) < (l[len(l) - 1] / 2 - 0.5) ** 2:
            l[len(l) - 1] -= 2
    c = len(l)
    for a in range(int(x + y - c)):
        l.append(y)
        for b in range(int(c - y)):
            if l[b + y] - 2 * c + y - 2 * a >= 2:
                l[len(l) - 1] += 2
    S = 0 # 算印面积
    for a in l:
        S += 2 * a
    S -= y * d
    print ('像素圆面积：' + str(S) + '。')
    for a in range(x): # 补全弦长数列
        l.insert(0, l[2 * a + y])
    print ('弦数列：', end = '') # 打印数列
    for a in range(len(l)):
        if a + 1 != len(l):
            print (l[a], end = ',')
        else:
            print (l[a], end = '。\n')
    for a in l: # 打印像素圆
        for b in range(int((d - a) / 2)):
            print ('  ', end = '')
        for b in range(a):
            print ('■ ', end = '')
        print ()
    print ('-----------------------------')
