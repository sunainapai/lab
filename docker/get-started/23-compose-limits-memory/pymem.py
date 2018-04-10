import time
i = 0
a = []
while True:
    if i < 5:
        print('i:', i)
        time.sleep(1)

    a.append(i)

    if i > 0 and i % 1000000 == 0:
        print('i:', i)

    i += 1
