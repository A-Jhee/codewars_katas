# requirement:
# given a string object, return a new string object (same or new?)

# return value:
# take each word, rotate first letter to the end and append 'ay' to it, and return 
# this new string object

# punctuations are kept in place

# working solution:
# -rotating the first letter of each word to the end of the word
# -appending 'ay' to the end of the new word
# -recognizing puncutations and leaving it alone.

# split the sentence into tokens with split by a space.
# take each token words and make a chars array
# take chars array's first element with .shift, save to a variable, append to end of 
# array, also append 'ay'
# join chars array, place this word into a new empty array.

# if the current word token is a punctuation (def: anything other than alphabet)
# place into the result array. 

# def pig_it(text)
#   result = []
#   text.split(" ").map do |word|
#     if word =~ /[a-zA-Z]/
#       ch_arr = word.chars
#       first_letter = ch_arr.shift
#       if ch_arr.last =~ /[^a-zA-Z]/
#         punctuation = ch_arr.pop
#         ch_arr << first_letter << "ay" << punctuation
#         result << ch_arr.join
#       else
#         ch_arr << first_letter << "ay"
#         result << ch_arr.join
#       end
#     else
#       result << word
#     end
#   end
#   p result.join(" ")
# end

# pig_it("Pig latin is cool!")




# requirement:
# given two string objects, return boolean value true/false 

# return value:
# return true if the letters within string object 1 can be rearranged to form str obj 2
# return false if otherwise. all lowercase, no numbers, no punctuations.

# a letter is counted one-to-one, "lac" cannot spell "call" but "allc" can.
# disregard any extra letters found in the 1st str. return true as soon as 
# 2nd str object can be formed.

# working solution:
# all the letters found in 2nd str must be also found in 1st str

# idea 1:
# take 2nd str obj, take chars array, iterate through each ch
# use 1st str.count(ch) to see if it's greater than 0, if less than 0, than return false
# if greater than 0, then ...
# use .sub! to replace the very first occurence of the current char in the
# 1st str with a non-letter like "-". 


# def scramble(s1, s2)
#   s2.chars.each do |ch|
#     if s1.count(ch) > 0
#       s1 = s1.sub(ch, "-")
#     else
#       return false
#     end
#   end
#   true
# end

# p scramble('rkqodlw','world')





# requirement:
# given an int, return an array of int

# return value:
# return an array of integers that are prime and odd, between 0 to the given number

# working solution:
# -how do know it's a prime 
# -how do i know it's odd

# i can iterate through 0.upto(number) and inspect each int

# int.odd? will let me know if it's odd

# only divisible by 1 and itself.

# if i divided a number by all number from 1 to itself, and collect 
#   when the remainder of the division is 0

# so.. 1.upto(num) do each { |x| if num % x == 0 append x to array }

# if that array's length is greater than 2, then it is not prime.

# create helper function for prime

# and then if number is odd, check for prime and append to array 


# def isPrime?(num)
#   result = []
#   1.upto(num) do |i|
#     result << i if num % i == 0
#   end
#   result.size == 2 ? true : false
# end

# # p isPrime?(13)
# # p isPrime?(20)
# # p isPrime?(97)

# def oddprimes(num)
#   result = []
#   1.upto(num) do |i|
#     if i.odd?
#       if isPrime?(i)
#         result << i
#       end
#     end
#   end
#   p result
# end

# oddprimes(13)
# oddprimes(89)




# requirement:
# given a string obj, return a new string obj

# return value:
# given a string of words, return one word from the string that has the highest score 
# score is the combined total of each letter's score. based on position

# a 1 z 26

# working solution:
# -how do i evaluate the score for each letter
#  make a hash with letter as key and number as score. use string letters for keys
# -make an array of words, by using split(" ")
# iterate thru and inspect with word.
# set word score to 0
# make chars array with word.chars
# inspect each ch, find score from hash

# add it to word score

# after iteration thru chars are over, inspect word score
# to see if greater than highest score
# if so, returning word is now the current word

# next iteration thru words array

# ALPHABET_SCORE = Hash.new

# score = 1
# 'a'.upto('z') do |letter|
#   ALPHABET_SCORE[letter] = score
#   score += 1
# end

# def highestscore(str)
#   highest_score_word = ""
#   highest_score = 0
#   str.split(" ").each do |word|
#     word_score = 0
#     word.chars.each do |ch|
#       word_score += ALPHABET_SCORE[ch.downcase]
#     end
#     if word_score > highest_score
#       highest_score = word_score
#       highest_score_word = word
#     end
#   end
#   highest_score_word
# end

# p highestscore("Sphinx of black quartz judge my vow")




# requirement:
# given one integer, return a string object

# return value:
# given an multi digit integer, return a string object of those same
# digits with a dash inserted between the odd numbers.

# working solution:
# make an empty array
# take int, turn into string with .to_s
# make chars array with .chars
# check if current ch to_i is odd int, then 
# check to see if the last item on the created array is an odd int
# if so, append - to array
# push letter into a new array

# otherwise do nothing



# def dasherizer(num)
#   result = []
#   num.to_s.chars.each do |ch|
#     if ch.to_i.odd?
#       if result.last.to_i.odd?
#         result << "-"
#       end
#     end
#     result << ch
#   end
#   p result.join()
# end

# dasherizer(201105742)





# requirement:
# given an array of names, and an integer, return a name in string

# return value:
# the given integer will indicate the nth person to drink from the vending machine
# and find the nth person's name and return it

# the first element of the names array, will rotate to back twice (doubles)

# working solution:
# -find a way to simulate the queue,
# queue:
# take first name, place it at the end, but do it twice.
# queue starts at 1 and increments by 1 each time person takes a turn

# way to loop until the number is reached.

# terminate loop and return the last name it looped on.

# first = ""
# queue = 0

# while queue < upper limit

# first = arr.shift
# arr << first << first

# queue += 1


# return first



# def who_is_next(names, r)
#   person_in_turn = ""
#   can_number = 0
#   while can_number < r
#     person_in_turn = names.shift
#     names << person_in_turn << person_in_turn
#     can_number += 1
#   end
#   person_in_turn
# end

# names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

# p who_is_next(names, 52)





# requirement:
# given an array, return a sorted new array

# return value:
# given array will contain integers in no particular order,
# returned array will have only the odd numbers in ascending order, but
# not disturbing the even numbers.

# working solution:
# iterate thru the given array,
# if the current element is odd, map as "-" to a new array
#   and take the odd number and placed it into another array
# if even, map as is

# will give an array with all odds replaced with "-"
# and array with just the odds

# i can sort the odd numbers array.

# and replaced each "-" in order with the numbers from the odd numbers array.


# def sort_array(source_array)
#   dash_arr = []
#   odds_arr = []
#   source_array.each do |num|
#     if num.odd?
#       dash_arr << "-"
#       odds_arr << num
#     else
#       dash_arr << num
#     end
#   end
#   odds_arr.sort!
#   dash_arr = dash_arr.map do |num|
#     if num == "-"
#       odds_arr.shift
#     else
#       num
#     end
#   end
#   dash_arr
# end

# sort_array([5, 3, 2, 8, 1, 4])



# This is a test!
#  h s i _ _ e t 
# T i _ s a t s !


# requirement:
# given a string object and an integer, return a new string object 

# return value:
# concatenate every 2nd char from the string (does not matter if it's a letter or 
#   a space or a punct), then, concatenate the rest, i.e. starting with 1st letter,
#   ever other letter from there 

# 1234567

# 246135

# given integer will indicate how many times this process is repeated

# working solution:
# make a helper method for shuffling the string
# for example method called shuffle(text) 
# then in the main function = mainshuffle(text, n)
# use 1.upto(n) do shuffle(text)

# should repeat the right amount

# shuffle method will use .chars to get char array
# each_with_index, append into a new array if index is odd,
# then each_with_index again, append into new array if index is even

# for unshuffle, i need to make chars array and 
#   halve the array. if array.size is odd, take 0 index to size / 2 (int division)
#     0..size/2
#   if even, 0 to size/2 non inclusive
#     0...size/2

# create an array of '_' the same size as the input string.
# iterate thru 0 upto size, if index is odd, take from second half array use shift
# if index is even, take from first half, use shift


# def shuffle(text)
#   first_half = []
#   second_half = []
#   text.chars.each_with_index do |ch, indx|
#     if indx.odd?
#       first_half << ch
#     else
#       second_half << ch
#     end
#   end
#   whole = first_half + second_half
#   whole.join()
# end

# def unshuffle(text)
#   result = Array.new(text.size, "_")
#   first_half = text.chars[0...text.size/2]
#   second_half = text.chars[text.size/2..-1]
#   0.upto(text.size-1) do |indx|
#     if indx.odd?
#       result[indx] = first_half.shift
#     else
#       result[indx] = second_half.shift
#     end
#   end
#   result.join()
# end

# def encrypt(text, n)
#   return "" if text.empty?
#   return text if n <= 0
#   1.upto(n) do
#     text = shuffle(text)
#   end
#   text
# end

# def decrypt(encrypted_text, n)
#   return "" if encrypted_text.empty?
#   return text if n <= 0
#   1.upto(n) do
#     encrypted_text = unshuffle(encrypted_text)
#   end
#   encrypted_text
# end

# p decrypt("hsi  etTi sats!", 1)
# p decrypt("s eT ashi tist!", 2)




# requirement:
# given an array of 10 integers, return a string object

# return value:
# use the integers in the array in order to create a phone number string object
# in the format "(xxx) xxx-xxxx"


# working solution:
# since "special" characters will always appear in the indentical place in the string
# make an array template:
# ["(", "x", "x", "x", ")", " ", "x", "x", "x", "-", "x", "x", "x", "x"]

#        1    2    3              6    7    8         10  11    12   13

# take item from array in order, take into string and replace all other spaces


# def createPhoneNumber(numbers)
#   result_arr = ["(", "x", "x", "x", ")", " ", "x", "x", "x", "-", "x", "x", "x", "x"]
#   replacing_indx = [1, 2, 3, 6, 7, 8, 10, 11, 12, 13]
#   numbers_dup = numbers.dup
#   replacing_indx.each do |indx|
#     result_arr[indx] = numbers_dup.shift
#   end
#   result_arr.join
# end

# num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
# createPhoneNumber(num)




# requirement:
# given an array of integers, and number N, return a new array

# return value:
# number N will indicate the max number of appearance allowed for each unique number
# within the given array. for every occurence of that number past N times, remove from
# the array.

# after this process is repeated for all numbers, return that array

# will be a different array? yes

# working solution:
# create a hash that will store unique number as keys and value will be appearance
# count

# iterate thru the given array, check to see if int is a key in hash,
# if key in hash, 
#   check if value = N.
#     discard
#   but if value is less than N 
#     increment the value by 1 (which is the count)
#     place number into result array 
# if key is not in hash
#   then create a new one hash[key] = 1, initial value at 1
#   append number into result array


# def delete_nth(order, max_e)
#   count_hsh = Hash.new
#   result = []
#   order.each do |num|
#     if count_hsh.has_key?(num)
#       if count_hsh[num] < max_e
#         count_hsh[num] += 1
#         result << num
#       end
#     else
#       count_hsh[num] = 1
#       result << num
#     end
#   end
#   result
# end

# delete_nth([1,2,3,1,2,1,2,3], 2)


# hsh = {"a" => 2, "b" => 4, "c" => 5}

# p hsh["d"] ? "true" : "false"

# Write a method that takes one argument, an array of arrays, where each sub-array
# contains an unsorted range of integers.

# The method should compute the average of each sub-array, and return the number that is in the middle, 
# numerically, from the resulting range of averages.

# [[6, 8], [2, 4], [14, 16], [10, 12], [18, 20]] -> [7, 3, 15, 11, 19] -> 11

# If there is no middle number in the range, then return an array of the two numbers closest to the middle of the range.

# Examples:

# p middle_number([[6, 8], [2, 4], [14, 16], [10, 12], [18, 20]]) == 11
# p middle_number([[9, 17, 4, 13, 27], [4, 8], [4, 9, 5]]) == 6
# p middle_number([[4, 8, 5, 2, 6]]) == 5
# p middle_number([[-5, -9], [2, -7, -1, 6, -3], [1], [4, 6, 2]]) == [-1, 1]

# The tests above should print "true".


[11, 12, 13, 14, 15]

15
[11, 12, 13, 14]




