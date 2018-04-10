import time
i = 0
while True:
    if i < 5:
        print('i:', i)
        time.sleep(1)

    if i > 0 and i % 1000000 == 0:
        print('i:', i)
    i += 1

