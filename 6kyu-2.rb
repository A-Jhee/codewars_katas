foo = 0

# requirement:
# given 2 arrays, return boolean value true or false

# return value:
# whether the elements in 2nd array are the squared value of one element in 1st array.
# order of elements do not matter. All elements in b must be squares of an element in a 

# solution:
# -i must check each elements in 2nd array to be a square,

# if not a perfect square, return false
# if 1st or 2nd is empty, return message that either one is empty
# if 1st or 2nd are nil, return false

# iterate thru each elements of arr2,
# - OR  i can square root each element of arr2 and match against elements in arr1

# - i can either square each elements in arr1, and match against elements in arr2
# use .map to create new arr where arr1's elements are squared.
# passing thru each element in arr2, see if new_arr.any? { |v| v == element from arr2 }
# any? returns true or false, so map it to a new array
# if newarray.all? { |v| v } if all values are true, then return true
#   all else return false

# def comp(arr1, arr2)
#   return false unless arr1 && arr2
#   return true if arr1.size == 0 && arr2.size == 0
#   return false if arr1.size == 0 || arr2.size == 0
#   squares_arr1 = arr1.map { |num| num*num }
#   squares_arr1.sort == arr2.sort
#   # results_arr = arr2.map do |square| 
#   #   squares_arr1.any? { |v| v == square }
#   # end
#   # results_arr.all? { |v| v }

# end

# p comp([2, 2, 3], [4, 9, 9])

# p comp([], [1])




# requirement:
# given an array of letters (in unified case), return one letter 

# return value:
# given array of letters will be in order, but missing a letter
# return that missing one letter.

# solution:
# -how do i find each letter is missing?
#   -furthermore how do i know a letter is missing and which one?

# can there be a missing letter before the first or after the last letter? NO 
# so taking first letter and last letter will give a --range-- of the letters 
# i need to inspect. 

# i can create an array using range from first to last letter 
# and compare to the given array. the created array should be always longer
# than the given. so new array - given array should give the missing letter

# i can return the element inside this resulting array.


# def find_missing_letter(arr)
#   full_range_arr = arr[0].upto(arr[-1]).map { |ch| ch }
#   (full_range_arr - arr)[0]
# end

# p find_missing_letter(['a','b','c','d','f'])




# requirement:
# given a string object consisting only of () [] and {}, return boolean true or false 

# return value:
# true if 
# each of the parentheses () [] {} are paired and in order
# for example ) before ( is false 
# also they need to be closed properly ([]) is true, ([)] is false

# false if
# there is only one half of a pair, ( but no ) for example
# if inside a brace there is only one half of a pair. ( { ) }

# solution:
# if i can clearly define the true criteria, all else can be false

# TRUE
# if an open brace is found (, [, {
#   check to see if the immediate next char is the right closing pair.

#   if immediate next char is another opening brace, 
#     check next char to see if it closes the previous char
#     or if another brace opens
#     which case check next char to see if it closes the previous char

# in order to be true, at some point consecutive chars need to be right pair.

# FALSE
#   when first char is opening half and immediate next char is the wrong closing pair
#   if first char is closing half 
#   if last char is opening half 


# { ( ) } [ ]
# create an empty array. place opening brace into it, if another open one is found
# place it into it, until coming across a closing one, check to see if last element in
# the array is the closing pair of the current brace half. 
# if true, remove the last element of the array, and move to the char on the string,
#   if it's closing, check last element again.

# BRACES_HSH = { '(' => ')', '[' => ']', '{' => '}'}

# def validBraces(braces)
#   opening_braces_arr = []
#   opening_braces = /[\(\[\{]/
#   closing_braces = /[\)\]\}]/
#   return false if opening_braces_arr.first =~ closing_braces
#   return false if opening_braces_arr.last =~ opening_braces
#   braces.chars.each do |ch|
#     if ch =~ opening_braces
#       opening_braces_arr << ch
#     else
#       if BRACES_HSH[opening_braces_arr.last] == ch
#         opening_braces_arr.pop
#       else
#         return false
#       end
#     end
#   end
#   return false if opening_braces_arr.size == braces.size
#   true
# end

# p validBraces("([{}])")
# p validBraces("(){}[]")
# p validBraces("[({})](]")
# p validBraces("(((({{")




# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.



# requirement:
# given two string objects, return boolean value true or false

# return value:
# return true if there is a substring (longer than one letter) that appears
# in both given string objects.
# return false if there are none.

# working solution:
# Only need to detect if there is at least one shared substring.

# Ignores case. BANANA and banana returns true.

# empty string in one of the two arguments, or both, makes it false.
# -> if there is an empty string in the argument, false 

# consider numbers as well.

# Since I only need to find one shared substring to return true.
# and it must be longer than one letter. I can look for just two letter substrings.

# 1) create a method to slice a string object into two letter substrings, and
# map into an array.

# - starting index = 0 and increment by 1 each time.
# - from 1, upto string.length - 1 will be the ending index
# String[start..end] gives two letter substring.
# -iterate thru the range and append them to a new array.

# 2) compare the resulting arrays from 1st and 2nd arguments.
# -iterate thru one of the arrays, and match each element against all the elements
# of the other array. once match is found, return true.

# 3) if a match is found, return true.
# 4) else false.

# def two_letters_arr(str)
#   result_arr = []
#   start_indx = 0
#   1.upto(str.length-1).each do |end_indx|
#     result_arr << str[start_indx..end_indx]
#     start_indx += 1
#   end
#   result_arr
# end

# def two_letters_arr(str)
#   1.upto(str.length-1).map do |end_indx|
#     str[end_indx-1..end_indx]
#   end
# end

# def substring_test(str1, str2)
#   str1_substrings_arr = two_letters_arr(str1)
#   str2_substrings_arr = two_letters_arr(str2)
#   str1_substrings_arr.each do |substr1|
#     str2_substrings_arr.each do |substr2|
#       return true if substr1.downcase == substr2.downcase
#     end
#   end
#   false
# end


# p substring_test('Something', 'Fun') ==  false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true





# requirement:
# given an array of int, return a new array of int

# return value:
# given array will contain even and odd ints, freeze even numbers and zero 
# in place, but sort the odd numbers in ascending order.

# working solution:
# i can iterate through the given array, and take note of index at which numbers are
# odd.

# have an array of those indexes. and use map to create a new array with only the
# numbers from those indexes. it would give odd numbers out of order

# sort this array. and then use the index array to replace the elements of the 
# given array at those indexes with the elements from the sorted array
# starting from the first to last.




# requirement:
# given two integers (positive or negative), return one int

# return value:
# remainder of division of 1st argument as dividend and 2nd as divisor

# working solution:
# when divising 1st by 2nd ( 1st/2nd ), what are the possible outcomes
#  - divides without remainder -> remainder is 0
#  - divides but leaves a remainder -> remainder is positive or negative
#  - does not divide, so leaves the entire dividend as remainder


# when both are positivwe:

# how do i know when a number is divisible by divisor.
#   if dividend is greater than divisor.
#     subtract dividend by divisor, result = dividend, result -= divisor.
#     until result is less than divisor. that's the remainder

# 12 % 5, 12-5 = 7, 7-5 = 2, 2 < 5, remainder 2

# if divisor is greater than dividend, return dividend as remainder.

# if divisor is equal to dividend, return 0

# when both are negative;

# if they are equal, return 0

# if a / b, and a > b. return a 

# if a / b, and a < b. subtract by b while result is less than b.

# -14 % -5, -14 - (-5) = -9, -9 - (-5) = -4
# -4 is greater than -5, so stops and returns -4

# if one is negative.

# a / b. if a is negative is |a| > b, 
# a + b, until result is positive

# |a| < b, a+b = remainder


# a / b. if b is negative. a > |b|,
# a + b, until result is negative

# a < |b|, a+b = remainder 

# def modulo_positive(a, b)
#   remainder = a 
#   if a > b
#     loop do 
#       remainder -= b
#       break if remainder < b
#     end
#   elsif a == b
#     remainder = 0
#   end
#   remainder
# end


# def modulo_negative(a, b)
#   remainder = a
#   if a < b
#     loop do 
#       remainder -= b
#       break if remainder > b
#     end
#   elsif a == b
#     remainder = 0
#   end
#   remainder
# end


# def modulo_mixed(a, b)
#   remainder = a
#   return 0 if a.abs == b.abs
#   if a < 0
#     if a.abs > b
#       loop do 
#         remainder += b
#         break if remainder > 0
#       end
#     elsif a.abs < b
#       remainder += b
#     end
#   elsif b < 0
#     if a > b.abs
#       loop do 
#         remainder += b
#         break if remainder < 0
#       end
#     elsif a < b.abs
#       remainder += b
#     end
#   end
#   remainder
# end


# def no_modulo(a, b)
#   if a >= 0 && b >= 0
#     modulo_positive(a, b)
#   elsif a < 0 && b < 0
#     modulo_negative(a, b)
#   elsif a < 0 || b < 0
#     modulo_mixed(a, b)
#   end
# end

# p 5 % 14
# p no_modulo(5, 14)
# p 5 % -14
# p no_modulo(5, -14)
# p -5 % 14
# p no_modulo(-5, 14)
# p -5 % - 14
# p no_modulo(-5, -14)
# p 14 % 5
# p no_modulo(14, 5)
# p 14 % -5
# p no_modulo(14, -5)
# p -14 % 5
# p no_modulo(-14, 5)
# p -14 % -5
# p no_modulo(-14, -5)




# requirement:
# given an array, return a new reduced array

# return value:
# given array will contain string objects denoting directions, reduce the elements
# in this array with the following logic,

# north, then south, or south, then north. eliminated each other.
# east, then west, or west, then east elimniate each other.

# the elements must be adjacent to each other for it to be reduced.

# [north, west, south, east] is irreducable since no opposing directions
# are adjacent.

# however, if two opposing directions become adjacent as a result of a reduction
# for example

# north, east, west, south, west.
# east and west a reduced
# north, south, west
# north and south are reduced
# leaving only west

# resulting reduction leaves only unopposed elements, return this array.
# if all elements are eliminated return empty array.

# working solution:
# i want to look for the first occurence of opposing pair of directions,
# eliminate those two elements from the array,
# look over the array again for the first occurence of opposing pair of directions

# if i find none during my pass through the array, return the mutated array.

# create a new empty array
# as i iterate through the array's elements,
# check to see if the last element of the new array is an opposing direction
# if it's true, then remove the last element from the new array, and continue
# if NOT, append the current element into the new array and continue.

# after the iteration is over, return the new array. it should only contain the reduced
# elements.

# north, east, west, south, west, west

# north compare to array.last = empty [north]
# east, compare to north, [north, east]
# west, compare to east, remove east [north]
# south, compare to north, remove north []
# west, compare to nil, append west [west]
# west, ocmpare to west, append west [west, west]

# how do i recognize opposing pairs. i could use hash. west: east, east: west. 


# DIRECTION_HSH = { 'NORTH' => 'SOUTH', 'SOUTH' => 'NORTH',
#                   'EAST' => 'WEST', 'WEST' => 'EAST' }

# def dirReduc(arr)
#   result = []
#   arr.each do |direction|
#     if DIRECTION_HSH[direction.upcase] == result.last
#       result.pop
#     else
#       result << direction.upcase
#     end
#   end
#   result
# end

# p dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])


# def zero(arr=[0])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 0 + arr[1]
#   when "-" then 0 - arr[1]
#   when "/" then 0 / arr[1]
#   when "*" then 0 * arr[1]
#   end
# end

# def one(arr=[1])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 1 + arr[1]
#   when "-" then 1 - arr[1]
#   when "/" then 1 / arr[1]
#   when "*" then 1 * arr[1]
#   end
# end

# def two(arr=[2])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 2 + arr[1]
#   when "-" then 2 - arr[1]
#   when "/" then 2 / arr[1]
#   when "*" then 2 * arr[1]
#   end
# end

# def three(arr=[3])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 3 + arr[1]
#   when "-" then 3 - arr[1]
#   when "/" then 3 / arr[1]
#   when "*" then 3 * arr[1]
#   end
# end

# def four(arr=[4])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 4 + arr[1]
#   when "-" then 4 - arr[1]
#   when "/" then 4 / arr[1]
#   when "*" then 4 * arr[1]
#   end
# end

# def five(arr=[5])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 5 + arr[1]
#   when "-" then 5 - arr[1]
#   when "/" then 5 / arr[1]
#   when "*" then 5 * arr[1]
#   end
# end

# def six(arr=[6])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 6 + arr[1]
#   when "-" then 6 - arr[1]
#   when "/" then 6 / arr[1]
#   when "*" then 6 * arr[1]
#   end
# end

# def seven(arr=[7])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 7 + arr[1]
#   when "-" then 7 - arr[1]
#   when "/" then 7 / arr[1]
#   when "*" then 7 * arr[1]
#   end
# end

# def eight(arr=[8])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 8 + arr[1]
#   when "-" then 8 - arr[1]
#   when "/" then 8 / arr[1]
#   when "*" then 8 * arr[1]
#   end
# end

# def nine(arr=[9])
#   return [arr[0]] if arr.size == 1
#   case arr[0] 
#   when "+" then 9 + arr[1]
#   when "-" then 9 - arr[1]
#   when "/" then 9 / arr[1]
#   when "*" then 9 * arr[1]
#   end
# end

# def plus(arr)
#   ["+", arr[0]]
# end

# def minus(arr)
#   ["-", arr[0]]
# end

# def times(arr)
#   ["*", arr[0]]
# end

# def divided_by(arr)
#   ["/", arr[0]]
# end

# p one(["*", 2])




# requirement:
# given an array of integers an one int, return either an array containing a pair of ints
# or nil

# return value:
# 2nd argument is an integer indicating the sum that two elements from the given
# array must match.

# if there are no two elements that add upto the given sum, then return nil.

# if there is a pair, return the one that appears earlier. The entire pair
#   must appear before any other pairs. of the pair, the later half's index must be
#   lowest of all other pair's later half's index.

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *

# 2nd pair's later half's index is 4,
# 1st pair's later half's index is 5. therefore 2nd pair is returned

# return the two numbers in an array, sorted in the order of appearance in the
# given array.


# working solution:

# disregard any numbers that are larger or equal to the "sum" argument.

# also i can know for certain what number to look for, given the element.
# for the current number i'm inspecting, i can "sum" - current number = the correct
#   pair to look for.

# starting with the first eligible number (number that is less than the given sum)
# i find the correct pair, and look for the first instance of that in the given
# array. I must also make note of it's index. conversely, I can ask the array to give
# me the index of the first element of that value. using #index(number)
# #at(index) gives item at that index.

# if there is 0 to 1 number between the pair, than return. as this is the earliest
#   appearing pair

# if there are 2 or more numbers between the pair, I must check these for possible pairs
#  take first eligible number between, and check to see if correct pair appears within
#  the range between the first pair found.

# if there is one, that pair is the new earliest appearing pair, return. unless
#   there is 2 or more numbers between the pair again. 


# def pairs_slice(arr, sum)
#   arr.each_with_index do |num, indx|
#     pair_indx = arr[indx+1..-1].index(sum-num)
#     if pair_indx
#       pair_indx += indx + 1
#       return arr[indx..pair_indx]
#     end
#   end
#   nil
# end

# def sum_pairs(arr, sum)
#   slice_arr = pairs_slice(arr, sum)
#   if slice_arr
#     if pairs_slice(slice_arr[1...-1], sum) == nil
#       return [slice_arr.first, slice_arr.last]
#     end
#   end
#   while slice_arr && slice_arr.length > 3
#     slice_arr = pairs_slice(slice_arr[1...-1], sum)
#   end
#   slice_arr ? [slice_arr.first, slice_arr.last] : slice_arr
# end

# def sum_pairs2(arr, sum)
#   seen = {}
#   arr.each do |num|
#     return [sum-num, num] if seen[sum-num]
#     seen[num] = true
#   end
# end

# p sum_pairs2([1, -2, 3, 0, -6, 1], -6)

# p slice_arr = pairs_slice([1, 4, 8, 7, 3, 15], 8)




# requirement:
# given one string object, return a new string object

# return value:
# string object will be a list of positive numbers or empty

# each object will be a number. if you add the digits, its sum becomes the
# 'weight' of that number. return a new string list that sorts them by
# this 'weight'

# working solution:
# take the string and split using " " as delimiter
# get an array of string numbers
# iterate and inspect each string number
# use .chars to create chars array
# map thru chars array and convert each char to integer .to_i
# now i have an array of digits for ex [ 1, 8, 6 ]
# run .reduce(:+) to get the sums
# create a hash with string numbers as keys and sums as values
# i can sort_by the hash by values only. and use .keys to get array of keys only
# use join with " " to get final return value

# def order_weight(str)
#   weights_arr = []
#   str.split(" ").each do |str_num|
#     digit_num = str_num.chars.map { |ch| ch.to_i }
#     weight = digit_num.reduce(:+)
#     weights_arr << [str_num, weight]
#   end
#   weights_arr
#   weights_arr = weights_arr.sort_by { |arr| [arr[1], arr[0]] }
#   weights_arr.map { |arr| arr[0] }.join(" ")
# end

# p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123")




# requirement:
# take one string object, and return boolean value true/false 

# return value:
# inspect the given string object to determine if the parentheses are 
# paired and in order.

# working solution:
# start with 0, and +1 when ( is encountered and -1 when ) is encountered.
# take string object, and makes chars array, and iterate thru each char
# and match against regex /\(/ and /\)/ to find ( and ) respectively

# at the end of the iteration, if the total is 0, then all parentheses are paired
# and even

# if at any point, the number is negative during the iteration, than we have 
# an unpaired or out of order closing parens.


# def valid_parentheses(string)
#   pair_counter = 0
#   string.chars.each do |ch|
#     if ch =~ /\(/
#       pair_counter += 1
#     elsif ch =~ /\)/
#       pair_counter -= 1
#     end
#     break if pair_counter < 0
#   end
#   pair_counter == 0 ? true : false
# end

# p valid_parentheses("(())((()())())")
# p valid_parentheses("))))")
# p valid_parentheses("((((")




# requirement:
# given an array of integers (pos and neg), return one int

# return value: 
# find the sum of the
# subset of the given array that shows the continuous sequence of that array that give
# the highest sum.

# working solution:

# if all elements are positive, then sum of all elements
# if all elements are negative, then return 0
# if the given array is empty, return 0

# [-2, 1, -3, 4, -1, 2, 1, -5, 4]

# - how do i find out which sequences to sum up 
# - how many subsequences' sums do i need to test before find the largest sequence

# can i start from index 0, and create a subsequence of length 2, 3 and so forth until 
# the end of the given array.
# move to index 1, and continue.

# only need to test two or longer subsets, if array with one item is given, 

# 1 2 3 4 5 6
# 1 2
# 1 2 3
# 1 2 3 4
# 1 2 3 4 5
# 1 2 3 4 5 6
#   2 3
#   2 3 4 
#   2 3 4 5
#   2 3 4 5 6
#     3 4
#     3 4 5
#     3 4 5 6
#       4 5
#       4 5 6
#         5 6

# [0, 2] [0, arr.size]


# def max_sequence(arr)
#   max_sum = 0
#   return 0 if arr.empty?
#   return arr.reduce(:+) if arr.all? { |num| num > 0 }
#   0.upto(arr.size-1) do |indx|
#     1.upto(arr.size) do |end_indx|
#       subset = arr[indx, end_indx]
#       max_sum = subset.reduce(:+) if subset.reduce(:+) > max_sum
#     end
#   end
#   max_sum
# end

# p max_sequence([])




# requirement:
# given one int, return an array [int, int, boolean]

# return value:
# integer will either be a product of consecutive fibonacci sequence or not
# for example f(8) * f(9) = 714,  21*34 = 714
# return an array of the two fibonacci numbers and true when found
# productFib(714) = [21, 34, true]
# or return an array of the two smallest fibonacci numbers such that 
# F(m) * F(m+1) > prod 
# productFib(800) = [34, 55, false]


# working solution:
# create a helper function for finding a specific fibonnacci number in a sequence
# f(3) gives 3rd fibonacci number in the sequence

# how to approximate the two numbers to multiply to get close to the given number? 

# i can Math.sqrt the number and use this result to find the closest fib number 
# and check their products until they match the number given or not.

# 714, sqrt = 26.72---.to_i = 26

# fib(1) upto an upper limit fib(upper)
# stop when i find the first fib num that exceeds 26
# make note of the current sequence in fib num fib(9) = 34 
# i test the previous fib num * the current fib num 
# fib(8) * fib(9) and test it against the given number 714.

# if the result is a match, then return the two fib number and true in an array 
# if the result is lower than given, then take current fib, and next fib, and test it again
# if the result is higher than give, then stop. find the product that is lower and return false 

# in case the first result is higher than given, track back until result is matched 
# or lower.


# def fib(n)
#   first, last = [1, 1]
#   3.upto(n) do
#     first, last = [last, first+last]
#   end
#   last
# end

# def productFib(prod)
#   fib_seq = 0
#   approx_start = Math.sqrt(prod)
#   1.upto(15) do |num|
#     if fib(num) > approx_start
#       fib_seq = num
#       break
#     end
#   end
#   fib_seq -= 1
#   unless fib(fib_seq) * fib(fib_seq+1) > prod
#     if fib(fib_seq) * fib(fib_seq+1) == prod
#       return [fib(fib_seq), fib(fib_seq+1), true]
#     else 
#       fib_seq += 1   
#     end
#   end
#   [fib(fib_seq), fib(fib_seq+1), false]
# end

# p productFib(5895)

# def productFib(prod)
#   a, b = [1, 1]
#   while prod > a * b
#     a, b = [b, a+b]
#   end
#   [a, b, prod == (a*b)]
# end

# p productFib(5895)















