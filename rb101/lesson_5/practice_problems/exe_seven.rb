a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a = 2 because arr[0] += 2 reassigns the arr[0] to reference 4 and not a still, so a doesn't change
# b = [3, 8] is modified in place changing the first element to 3
p a
p b