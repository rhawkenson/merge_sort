#-----Merge Sort Pseudocode-----
# Steps: 
#     1. Split the array in half as many times as possible
#     2. Order integers in each half, one at a time 
#     3. Merge the sorted arrays 
#     4. Return the final array with all integers 

#-----Written out: arr = [1,10,8,9,6]-----
# left:       [1,10]      right:            [8,9,6]
# left-left:  [1]         right-left:       [8]
# left-right: [10]        right-right:      [9,6]
#                         right-right-left: [9]
#                         right-right-right:[6]
# Everything is reduced to the smallest possible components
# 1. Sort: is 1 < nil? 
#          is 10 < nil? 
# 2. "Merge", but theres nothing to really merge.
# 3. Sort: is 1 < 10? 
# 4. Merge: place 1 first, then 10 in the same array      [1,10]
# 5. Sort: 8,9,6 individually against nil 
# 6. "Merge" them with themselves
# 7. Sort: is 8 < nil?
# 8. "Merge" with itself                                  [8]
# 9. Sort: is 9 < 6?
# 10. Merge: place 6 first, then 9 in the same array      [8],[6,9]
# 11. Sort: is 8 < 6?
# 12. Merge: place 6 in an array alone [6]                [8],[9] => [6]
# 13. Sort: is 8 < 9?
# 14. Merge: place 8 in the array after 6, then place 9   [9] => [6,8]
#                                                             => [6,8,9]
# 15. Sort: is 1 < 6?
# 16. Merge: place 1 in an array alone                    [10], [6,8,9] => [1]
# 17. Sort: is 10 < 6?
# 18. Place 6 in the array after 1                        [10], [8,9] => [1,6]
#                                                         [10], [9]   => [1,6,8]
#                                                         [10]        => [1,6,8,9]
#                                                                     => [1,6,8,9,10]


def merge_sort(arr)
  if arr.length <= 1
    return arr
  else 
    mid = arr.length/2
    left = merge_sort(arr.slice(0...mid))
    right = merge_sort(arr.slice(mid...arr.length))
    merge(left, right)
  end 
end


def merge(left, right)
  sorted = []

  while !left.empty? && !right.empty? do 
    if left[0] < right[0]
      sorted.push(left.shift)
    else
      sorted.push(right.shift)
    end 
  end 
  puts sorted.concat(left).concat(right)
end 


arr1 = [1,10,8,9,6]
merge_sort(arr1)