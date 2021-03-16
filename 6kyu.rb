# requirement:
# given one int, return one int

# return value:
# sum of all numbers (below the given number, down to 0) that are multiples of 3 or 5
# *multiples of 3 and 5 are counted once towards the sum

# problem:
# -how do i find all the numbers below a given number
#   i can pass each number from 1.upto (given int)
#   -i can start at 3, since 0,1,2 can be safely excluded

# how do i make sure its a multiple of 3 or 5
#   if num % 3 == 0 || num % 5 == 0

# create a new array, and enter each number that fit above requirement.
# have an array of multiples of 3 or 5. no repeats (test)

# use .reduce(:+) for the sum


# def solution(number)
#   multiples_arr = []
#   3.upto(number-1).each do |n|
#     if n % 3 == 0 || n % 5 == 0
#       multiples_arr << n
#     end
#   end
#   p multiples_arr
#   multiples_arr.reduce(:+)
# end

# p solution(20)





# requirement:
# given one array of int elements, return one int

# return value:
# the array will contain one outlier. it will contain all even or odds, except for 
# one number N. return this N.

# problem:
# i must determine what majority of the array's element will be, either even or odd.
# then find the outlier and return that

# there is .all and .any method for array. 

# map the even array, 'e' for even and 'o' for odd.
# the new array will contain either one 'e' or one 'o'
# if the count('e') == 1, then use .select to find the .even?
#   and return that array's lone element.

# def find_outlier(integers)
#   eo_arr = integers.map { |int| int.even? ? 'E' : 'O' }
#   if eo_arr.count('E') == 1
#     integers.select { |int| int.even? }[0]
#   else
#     integers.select { |int| int.odd? }[0]
#   end
# end


# find_outlier( [2, 4, 0, 100, 4, 11, 2602, 36] )





# requirement:
# given one int, return another int

# return value:
# return value is a single digit that is the sum of all the digits of a number.
# 942 -> 9+4+2 -> 15,
# 15 then must be reduced again 1+5 -> 6 until single digit is reached.

# problem:
# -taking a number and creating it as collection of its digits only
# -checking the sum to be more than one digit and repeating until single digit.

# convert to string, use .chars and map this array to its integer version.
# -now digits array is made
# use .reduce(:+) for the sum

# if num % 10 == num, then it's single digit, return
#   if num % 10 == any other numb, then repeat.


# def digital_root(n)
#   digits_arr = n.to_s.chars.map { |ch| ch.to_i }
#   sum = digits_arr.reduce(:+)
#   return sum if sum % 10 == sum
#   digital_root(sum)
# end

# p digital_root(456)





# requirement:
# given a string consisting of only letters and spaces, return the same string, but mutated

# return value:
# same object as the given string, but all words with five or more letters are reversed.

# problem:
# -check each word to see if it is 5 or more letters
# -reverse a word 

# split sentence into word tokens. pass each word token and use .length to see if >= 5
# if true, use .gsub! passing the word token as first arg, and its .reverse as 2nd


# def spinWords(string)
#   string.split.each do |word| 
#     if word.length >= 5
#       string.gsub!(word, word.reverse)
#     end
#   end
#   string 
# end

# spinWords("Hey fellow warriors test")




# requirement:
# given an array of strings and one int, return one string object

# return value:
# given number will indicate how many consecutive strings to look at in the array.
# find the longest consecutive string object from the array and return that string object

# the string object is concatenation of the consecutive elements

# "elephant", "funk" -> elephantfunk

# problem:
# -return "" when n=0, k>n, or k<=0
# -how do i extract consecutive elements in the array to compare.
# i can use slice of the array given the number to indicate index jumps
# join the array into single string object, run size to get length.
# -how do i know which one is the longest
# i can use a variable that stores the longest length and the longest string
# it would update whenever longer one comes along.
# in the end return the string object
# * i can create an empty string variable. when a new consecutive string objecit is made
# compare variable.size to newstring.size. if latter is greater, reassign variable

# 0 1 2 3 4 5  length=6

# 0 1 
#   1 2
#     2 3
#       3 4
#         4 5

# 0 1 2
#   1 2 3
#     2 3 4
#       3 4 5

# 0 upto (length-number) these will be the starting indexes

# iterate thru: 0 ~ 6-2 = 4 for example
# [starting index..starting index+(number-1)]


# def longest_consec(strarr, k)
#   longest_str = ""
#   return longest_str if strarr.size == 0 || k > strarr.size || k <= 0
#   0.upto(strarr.size - k) do |ind|
#     current_str= strarr[ind..ind+(k-1)].join
#     if current_str.size > longest_str.size
#       longest_str = current_str
#     end
#   end
#   longest_str
# end

# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)




# requirement:
# given a string object (a squence of letters with no space)
# or numbers sequence, return an array of corresponding object type elements
# string -> string
# int -> int

# return value:
# returned array will contain elements once per repeating and consecutive sequences

# for example)
#   if given AAABBBBCCDDDD -> [A, B, C, D]
#   if given BBCCCOOOCCCBBB -> [B C O C B]

# same for numbers

# CASE SENSITIVE

# problem:
# -how do i know when a sequence is repeating?
# -when do i know it stars and when it stops repeating?
# if i can manage both of the above, i can create a new element in a new array
#   for each repeating sequence, and recording each character and returning it


# idea 1:
# create a new array, make it empty
# take string, creat char array. iterate thru each char
# check to see if the last element in the new array matches the current char
# if it does, continue to next iteration

# if it's different, then it reached the end of repeating sequence and beginning
#   of a new one. whatever left in the array was a repeating sequence

# take the first element of the storage array, and place that into a returning array.

# reassign the array to an array containing one element: current and different char.

# go to next iteration.




# def unique_in_order(iterable)
#   iterable = iterable.chars if iterable.is_a?(String)
#   result_arr = []
#   sequence_arr = [iterable[0]]
#   iterable.each do |ch|
#     if ch.match(sequence_arr[-1])
#       sequence_arr << ch
#     else
#       result_arr << sequence_arr[-1]
#       sequence_arr = [ch]
#     end
#   end
#   result_arr << sequence_arr[-1]
#   result_arr
# end

# p unique_in_order('AAAABBBCCDAABBB')
# p unique_in_order('ABBCcAD')




# requirement:
# given one int, return one int

# return value:
# number of "one" found in the binary representation of the given integer.
# ex> 1234 -> 10011010010 in binary, therefore 5, because there are 5 'one's

# problem:
# -how do i convert integer into binary.
# -how do i count only the 'one's found in the binary.

# create a hash with integer 0~9 as keys and binary rep. as values

# take given number, split into digits: use .to_s then .chars and then map 
# using .to_i

# have an array of digits only, and pass them as keys to hash to get binary value
# collect these into an array, then join as a string object

# use .count on the string to get number of '1' string object.


# def count_bits(n)
#   n.to_s(2).count('1')
# end

# p count_bits(1234)



# requirement:
# given a positive int, return one int (positive or -1)

# return value:
# given 'm', find and return 'n' such that n^3 + (n-1)^3 + (n-2)^3 + ... + 1^3
# if there is no such 'n', return -1

# problem:
# top of the building is a known = 1^3,
# and next is 2^3, and so forth until n^3

# idea1: what would happen if i were to subtract 1^3, then 2^3, and continue
# until the result is a clean 0.


# def find_nb(m)
#   base = 1
#   result = m
#   loop do
#     result = result - (base ** 3)
#     break if result <= 0
#     base += 1
#   end
#   result == 0 ? base : -1
# end


# p find_nb(135440716410000)




# requirement:
# do i return the same array?
# given two arrays, return a new array

# return value:
# given array 1 and array 2, remove all values found in 2 from 1, and return
# an array of remaining elements

# solution:
# iterate thru all elements of 2nd array and delete them from 1st array
# using .delete(obj) on an array removes all items equal to obj

# return the 1st array after words


# def array_diff(a, b)
#   result_arr = a
#   b.each do |num|
#     result_arr.delete(num)
#   end
#   result_arr
# end

# p array_diff([1, 2, 2], [1])



# requirement:
# given one array of integers, and another integer, return one int

# return value:
# how long it takes for all the customers to check out in minutes.

# first argument is an array of ints, each element represents a customer 
# and how long they will take. queue is taken in order always.

# second argument is number of total check-out lines.


# algo:
# - so when more than one check-out is available, two customers
# can go at once. meaning their time is simulatenous spent.
# * how do i track the total time spent across all customers in queue.

# 10, 2, 3, 3

# one: 10
# two: 2

# one: 8
# two: 3

# one: 5
# two: 3

# one: 2
# two: 0

# 2, 3, 10

# one: 2
# two: 3

# one: 10
# two: 1

# one: 9
# two: 0

# if there is only one check-out, add them all up 

# if there is more than one,

#   take first element, put it in first check-out
#   take next elemtn, and put it in second check-out
#   until all check-outs are filled.

#   ::repeat::
#   once all check-out a filled. find the smallest number
#   reduce all elements by this amount.

#   add this number to the total time spent (which will be the return value)

#   ex 10, 2, 3 - reduce by 2
#       8, 0, 1

#   one of the check-out will be empty, repped by 0

#   if there is another customer in queue, then
#   a new customer from the queue must fill this check-out

#   take next element and replace 0 with it.

#   otherwise,
#   take the smalelst number and reduce all positive elements by it.
#   ex 8, 0, 1 - reduce by 1
#      7, 0, 0

#   if there is no other elements in the queue, and there is only one positive int
#     with all others being 0 in the check-out, then add this number to the minutes spent


#   now return to ::repeat::

#   create a hash of check-outs as keys and customers with their minutes spent as values
#   {checkout1: 10, checkout2: 2, checkout3: 8}

#   if there are more customers in queue, and there is a checkout with a value of 0,
#     place next customer into this checkout with value 0.
#   if array.size > 0, and hash.values.any? { |v| v == 0 }

#   find the smallest number, hash.values.min 
#   reduce all values by it,
#   hash.each_key { |key| hash[key] -= hash.values.min }

#   hash [hash.key(0)] = new customer
#   can i mutate the given array? assume no

def create_checkout_hsh(n)
  checkout_hsh = Hash.new
  1.upto(n) do |key|
    checkout_hsh[key] = 0
  end
  checkout_hsh
end

def queue_time(customers, n)
  checkout_hsh = create_checkout_hsh(n)
  queue = customers.dup
  result = 0
  return customers.max if n > customers.size
  1.upto(n) do |checkout|
    checkout_hsh[checkout] = queue.shift
  end
  loop do
    least_minutes = checkout_hsh.values.min
    result += least_minutes
    checkout_hsh.each_key { |key| checkout_hsh[key] -= least_minutes }
    while queue.size > 0 && checkout_hsh.values.any? { |v| v == 0 }
      empty_checkout = checkout_hsh.key(0)
      checkout_hsh[empty_checkout] = queue.shift
    end
    if queue.size == 0 && checkout_hsh.count { |_, v| v == 0 } == n-1
      last_checkout_minutes = checkout_hsh.values.max
      result += last_checkout_minutes
      checkout_hsh[checkout_hsh.key(last_checkout_minutes)] = 0
    end
    break if checkout_hsh.values.all? { |v| v == 0 }
  end
  result
end



a = [572, 365, 80, 100, 96, 909, 99, 8, 7, 868, 7, 512, 28, 10, 6, 159, 6, 3] 
p queue_time(a, 2)















