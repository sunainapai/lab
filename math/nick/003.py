#!/usr/bin/env python3

def factors(p):
    for x in range(2, int(p ** 0.5) + 1):
        if p % x == 0:
            y = p // x
            if x != y and x + y < 100:
                yield x, y


def partitions(s):
    for x in range(2, s // 2 + 1):
        y = s - x
        if x != y and x + y < 100:
            yield x, y


# P: I cannot determine the two numbers.
#
# P's statement implies that P has a product p that can definitely be
# factorized in two or more ways. If p can be factorized in exactly one
# way, then P can easily determine the two factors x and y.
def candidate_product_1(p):
    return len(list(factors(p))) > 1


# S: I knew that.
#
# S's statement implies that S has a sum s such that when we partition s
# into all possible pairs, the product of the two numbers in each pair
# is a candidate for product p that P has.
def candidate_sum_1(s, candidate_products):
    return all(x * y in candidate_products for x, y in partitions(s))


# P: Now I can determine them.
#
# P's statement implies that P has a product p such that when we
# factorize p into all possible pairs, there is exactly one pair whose
# sum is a candidate for sum s that S has.
#
# At this stage, P has already determined the factors x and y of p. But
# we, as observers, still do not know x and y.
def candidate_product_2(p, candidate_sums):
    factorizations = [(x, y) for x, y in factors(p)
                      if x + y in candidate_sums]
    return len(factorizations) == 1


# S: So can I.
#
# S's statement implies that S has a sum s such that when we partition s
# into all possible pairs, there is exactly one pair whose product is a
# candidate for product p that P has.
#
# At this stage, S has determined the summands x and y of s. But we need
# to run a few more calculations to arrive at x and y.
def candidate_sum_2(s, candidate_products):
    partitionings = [(x, y) for x, y in partitions(s)
                     if x * y in candidate_products]
    return len(partitionings) == 1


# Now we can filter the list of candidate products p further by
# exploiting the constraint that when we factorize a candidate product p
# into all possible pairs, there is exactly one pair whose sum is s.
def candidate_product_3(p, s):
    factorizations = [(x, y) for x, y in factors(p) if x + y == s]
    if len(factorizations) == 1:
        x, y = factorizations[0]
        return x, y
    else:
        return None


def main():
    cp1 = [p for p in range(2 * 3, 49 * 50 + 1) if candidate_product_1(p)]
    print('cp1:', cp1)
    print()

    cs1 = [s for s in range(2 + 3, 49 + 50 + 1) if candidate_sum_1(s, cp1)]
    print('cs1:', cs1)
    print()

    cp2 = [p for p in cp1 if candidate_product_2(p, cs1)]
    print('cp2:', cp2)
    print()

    cs2 = [s for s in cs1 if candidate_sum_2(s, cp2)]
    print('cs2:', cs2)
    print()

    # The problem is set such that we have only one candidate sum in the end.
    assert len(cs2) == 1
    s = cs2[0]

    # Check if each p in cp2 is a candidate product.
    cxy = [candidate_product_3(p, s) for p in cp2]

    # Remove all None values from the list of (x, y) pairs.
    cxy = [xy for xy in cxy if xy]

    # The problem is set such that we have only one candidate product
    # with factors x and y such that x + y = s.
    assert len(cxy) == 1
    x, y = cxy[0]
    print('x:', x)
    print('y:', y)


if __name__ == '__main__':
    main()
