# requirements:
# given a string (consisting only of a-zA-Z) return a new string
# returned value:
# string that has one of first letter, 2 of second, 3 of third, etc. delimited by -
# regardless of the argument's case, first letter of the repeating sequence is cap, rest is lower

# string.join('-') to join substrings
# each substring will take a letter from the argument string.
# also create a range upto the length of the argument.
# for each number of that range, append to a new array << 'letter' * repeating number

# counter = 1

# s.chars.each do |ch|
#     array << ch * counter
#     end

# def accum(s)
#   repeating_n = 1
#   substring_arr = []
#   s.chars.each do |ch|
#     substring_arr << (ch * repeating_n).capitalize
#     repeating_n += 1
#   end
#   substring_arr.join('-')
# end

# p accum('abcd')
# p accum('RqaEzty')




# requirement:
# given a string only of lowercase and white space, return an int 
# return value:
# int that is count of all vowels in argument string. 

# use string.count('aeiou')

# def getCount(inputStr)
#   inputStr.count('aeiou')
# end

# p getCount('old macdonald had a farm')




# requirement:
# given a word (letters with no space), return one or two chars
# return value:
# the middle char. if odd, the middle one, if even, the middle two.

# 012345
# ind 2, 3 in length of 6
# 6/2 - 1, 6/2

# 012 3 456 length 7
# length/2 if odd

# length/2-1 , length/2 if even

# take word, get length
# word.length
# if length is even
#   take word.chars[length/2-1] and word.chars[length/2]
# if odd
#   take word.chars[length/2]


# def get_middle(s)
#   if s.length.even?
#     s.chars[s.length/2-1] + s.chars[s.length/2]
#   else
#     s.chars[s.length/2]
#   end
# end


# p get_middle('middle')
# p get_middle('testing')



# requirement:
# given an array of integers, return one integer from that array
# returned value:
# an integer that appears an odd amount of times in the array.

# only one int in the array will have odd number of appearance.

# [1, 2, 3, 3, 3, 4, 4, 5, 5, 5, 5, 6, 7, 7] answer is 3, appearing 3 times

# test_arr = [3, 3, 3, 4, 4, 5, 5, 5, 5, 7, 7]
# # test_arr.each { |n| test_arr.count(n) }

# # if the count is .odd?, then save that number to outer scope variable, and break
# # return that variable.

# def find_it(seq)
#   result = 0
#   seq.each do |n|
#     if seq.count(n).odd?
#       result = n
#       break
#     end
#   end
#   result
# end

# p find_it(test_arr)



# requirement:
# given an positive integer, return one integer.
# return value:
# the number of times digits are multiplied until multiplicative persistence is reached

# - take all digits of the given int, and multiply them.
# - take this product and take its digits and multiply them
# - repeat until the product is a single digit.

# digit = 365
# digit.to_s.chars ['3', '6', '5']
# arr.map { |ch| ch.to_i }
# [3, 6, 5].reduce(:*)
# 90 %10 == 90
# if the num % 0 == the num itself, then it is single digit.
# stop the loop here and be sure to have an incrementing counter
# return the counter.




# def persistence(n)
#   return 0 if n % 10 == n
#   counter = 1
#   loop do
#     digits_arr = n.to_s.chars.map { |ch| ch.to_i }
#     product = digits_arr.reduce(:*)
#     break if product % 10 == product
#     counter += 1
#     n = product
#   end
#   counter
# end

# p persistence(999)
# p persistence(5)




# requirement:
# given an array of integers, return one integer
# return value:
# index of the given array at which the subset of the array to the left and right's 
# sums equal. find the lowest index at which this occurs (first occurence)

# [1,2,3,4,3,2,1] length = 7
# arr[0...3].reduce(:+) == arr[4..-1].reduce(:+)

# arr[0..index] compared to arr[index+1..-1]
# lowest index will be is 1 max will be length-2

# p [1,2,3,4,3,2,1][4..-1]

# (1..length-2).each do |ind|
#   return ind if arr[0..ind].reduce(:+) == arr[ind+1..-1].reduce(:+)
# end
# -1

# def find_even_index(arr)
#   return 0 if arr[1..-1].reduce(:+) == 0 || arr.all? { |n| n == 0 } || arr.length == 1
#   (1..arr.length-2).each do |ind|
#     return ind if arr[0...ind].reduce(:+) == arr[ind+1..-1].reduce(:+)
#   end
#   return arr.length-1 if arr[0..-2].reduce(:+) == 0
#   -1
# end


# p find_even_index([-13, 16, -16, 12, 18, -25, 17, -8, 4, 13, 16, -19, 4, 18, -4, 12, -13, 17, -16, -6, 2])


# p [16, -16, 12, 18, -25, 17, -8, 4, 13, 16, -19, 4, 18, -4, 12, -13, 17, -16, -6, 2].reduce(:+)



#-----------#CATHERINE'S PROBLEM-------------------------------------------------
#---------
#---------
#---------
#---------
# Write a method that takes in a number and returns a string, placing
# a dash in between odd digits.


# requirement:
# given an integer, return a string delimited by -
# return value:
# the given integer with - betweeh all odd numbers.

# detect two consecutive odd numbers in the integer sequence

# 1) make an array of digits
# 2) iterating through, and use a true/false flag to find 2 consecutive odds
# 3) create subset of the digits array using the indexes i found
# 4) join each of the array ['2' '0' '1'].join -> 201
# 5) then join all the subsets of array with .join('-')
#   (2 0 1) (1 0 6)
#   map to array after joining elements into single integer
#   [201 106].join('-')
#   201-106
#   make to change to string. with .to_s
  
  

# n -> n.to_s.chars - ['2', '1', '1', '2']

# found_first_odd? = false
# marker = []
# arr.each_with_index do |ch, ind|
#   if ch.to_i.odd?
#     if found_first_odd?
#       make note of index to add a - beforehand
#       marker << ind
#     else
#       found_first_odd? = true
#     end
#   end
# end

# %w(2, 0, 1, 1, 0, 5, 7, 4, 2)
#    0  1  2  3  4  5  6
# = >[3, 6] 
# [ ind1, ind 2]
# arr[0...3] arr[3...6] arr[6...9] arr[9..-1]
# arr[0...ind1] arr[ind1...ind2] [ind2..-1]

# def dasherizer(int)
#   digits_chars_arr = int.to_s.chars
#   found_first_odd = false
#   index_marker = []
#   subsets_arr = []
#   digits_chars_arr.each_with_index do |ch, ind|
#     if ch.to_i.odd?
#       if found_first_odd
#         index_marker << ind
#         found_first_odd = false
#       else
#         found_first_odd = true
#       end
#     end
#   end
#   if index_marker.length == 1
#     subsets_arr << digits_chars_arr[0...index_marker[0]]
#     subsets_arr << digits_chars_arr[index_marker[0]..-1]
#   else
#     subsets_arr << digits_chars_arr[0...index_marker[0]]
#     index_marker.each_index do |ind|
#       unless ind == index_marker.length-1
#         subsets_arr << digits_chars_arr[index_marker[ind]...index_marker[ind+1]]
#       end
#     end
#     subsets_arr << digits_chars_arr[index_marker[-1]..-1]
#   end
#   subsets_arr.map { |sub_arr| sub_arr.join }.join('-')
# end



# def dasherizer(int)
#   dash_char_arr = []
#   int.to_s.chars.each do |ch|
#     if ch.to_i.odd?
#       if dash_char_arr[-1].to_i.odd?
#         dash_char_arr << '-'
#       end
#     end
#     dash_char_arr << ch
#   end
#   dash_char_arr.join
# end


# p dasherizer(2112) #== '21-12'
# p dasherizer(201105742) #== '201-105-742'
# p dasherizer(123456789) #== '123456789'
# p dasherizer(21121) #== '21-121'





# requirement:
# take an array of 3 ints or floats, and another int => return an array of tribonnaci upto the
# int argument.
# returned value:
# is an array of length "another int" 4th is previous 3 numbers' sum, and so forth
# 0   1  2  3  5
# [1, 1, 1], 3, 5
# 4th: 1 + 1 + 1 = 3
# 5th: 1 + 1 + 3 = 5

# 1) return [], seed[0], seed[1], seed[2] when the given 'n' is 0, 1, 2, 3 respectively
# 2) from 'n' of 4 or more, create function that adds the previous 3 numbers
# and add to a new array to be returned
# 3) make a copy of the seed array by using .map { |element| element }
# 4) starting with 4, upto the nth number (4..n) iterate passing each number as index
# 5) use the passed index as means to recall the previous 3 elements in the result array
# nth sequence if the tribonnacci = ( result[n-4] + result[n-3] + result[n-2] )
# 6) append the above sum into the result array
# 7) return to next iteration
# 8) use case statement: when n is 0, 1, 2, 3, > 3
# 9) when > 3, (4..n).times


# def tribonacci(signature, n)
#   case
#   when n == 0
#     result = []
#   when n == 1
#     result = signature[0..0]
#   when n == 2
#     result = signature[0..1]
#   when n == 3
#     result = signature[0..2]
#   when n > 3
#     result = signature.map { |element| element }
#     (4..n).each do |num|
#       result << ( result[num-4] + result[num-3] + result[num-2] )
#     end
#   end
#   result
# end


# p tribonacci([1, 1, 1], 10)


# requirement:
# given a positive integer and another positive int, return a positive int or -1
# return value:
# determines whether there is a special number that meets specific mathmatic req.
# if there is none, return -1
# if there is one, return that special number

# 2nd number given is the starting exponent for the left most digit of the first number
# and each digit after is powered by increment of 1 from the one before.

# 1) split the n into collection of digits, use n.to_s.chars.map { |n| n.to_i }
#   confirm I have array of integer digits
# 2) [a, b, c, d], a**p, b**p+1 c**p+2
# create a sum variable initalized at 0
# add each digit's product value into it.
# 3) digits arr.each do |digits|
#   digit ** p
#   sum += digit
#   p += 1
# end
# 4) sum % n == 0, then special number found, return sum / n
# else return -1



# def dig_pow(n, p)
#   digits_arr = n.to_s.chars.map { |num| num.to_i }
#   sum = 0
#   digits_arr.each do |digit|
#     sum += digit ** p
#     p += 1
#   end
#   if sum % n == 0
#     sum / n 
#   else
#     -1
#   end
# end



# p dig_pow(695, 2)




# requirement:
# given a string, return a sorted string.
# return value:
# the given string will contains words with a number mixed in.
# these numbers denote the order to sort by
# returned string is the words sorted by the number contained in the word.

# split the string into word tokens
#   - words.split
# sort the tokens based on numbers within 
#   take each token, split into chars array, and sort the array
#   numbers will always be at the front
#   use the sorted_array[0] first element as "index" to be placed into 
#   a new array in order
#   the number -1 will be the index
# join delimited by space and return this new string 
#   - sorted_tokens_arr.join(' ')


# create a new array, length of the tokens array. element does not matter '-'
# replace each index placement with a new token with its number -1 as the index.


# def order(words)
#   tokens_arr = words.split
#   result_arr = Array.new(tokens_arr.length, '-')
#   tokens_arr.each do |token|
#     ind = token.chars.sort[0].to_i - 1
#     result_arr[ind] = token
#   end
#   result_arr.join(' ')
# end

# p order("is2 Thi1s T4est 3a")




# requirement:
# given a string containing only alphabetnumerics (no white space), 
# return an integer
# return value:
# number of case-insensitive letters or numbers that appear more than once in the string

# make the argument lowercase, make chars array
# iterate through each chars, and count them from the array
# chars_array.count(char) if more than 1, then it has duplicates
# have a variable that increments by 1 whenever count is greater than 1
# return the variable

# create a hash with ch as key, count as value
# take the new hash, go with each, |k, v|.
# if v > 1, then += 1 to result


# def duplicate_count(text)
#   result = 0
#   count_hash = Hash.new
#   text.downcase.chars.each do |ch|
#     count_hash[ch] = text.downcase.count(ch)
#   end
#   count_hash.each do |k, v|
#     result += 1 if v > 1
#   end
#   result
# end

# p duplicate_count("aabBcdeEE")



# requirement:
# given an array of characters denoting cardinal direction, return true or false
# return value:
# given that for each direction given, one min is consumed
# and the given array must show 10 min walk for it to be true
# also, you must return to the starting point. directions must return to beginning

# if both are true, true, else false

# 1) determine if it's going to take 10 min
# 2) determine if it returns to beginning

# since each direction is 1 min, array.length == 10, then 10 min 

# directions north and south cancel each other north +1, south -1
# west and east, west +1, east -1

# make a hash with direction as key and numbers as values
# call upon the value while iterating through the given array's element as 
# hash keys. add these to a collector to test against 0 later.

# if the directions all add to 0, then returned to center

# when both are tested to be true, return true

# def isValidWalk(walk)
#   total = 0
#   if walk.length == 10
#     if walk.count('n') == walk.count('s')
#       if walk.count('w') == walk.count('e')
#         return true
#       end
#     end
#   end
#   false
# end

# p isValidWalk(['n','s','n','s','e','w','n','s','n','s'])
# p isValidWalk(%w(s e w n n s e w n w))




# requirement:
# given a string of all uppercase letters, no space, containing a sentence interlaced with WUB
# return the string without WUB

# return value:
# string with WUBs removed. WUB can appear at the beginning, at least once between words,
# and may appear at the end.

# the sentence must be seperated by space.

# use .gsub to replace all WUB occurences with a white space.

# and then strip the starting and trailing white space.

# problem: if WUB appears multiple times between a word, it will have
# multiple spaces.

# split delimited by whitespace, and join again delimited by space


# def song_decoder(dubstep)
#   result = dubstep.gsub('WUB', ' ').split(/\s/)
#   result.delete('')
#   p result
# end

# song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")




# requirement:
# given a string, return a new string consisting only of ( and )
# return value:
# ( replaces all characters that appear once, including white space 
# ) replaces all characters that appear more than once 

# return string should have no white space. and only consist of two characters


# create a new empty array = result
# take the word, split into chars array
# use word.count(ch) to see if it is more than one. 
# if greater than 1, append to the empty array )
# else append (

# join the result array with no space 
# return this string.


# def duplicate_encode(word)
#   result_arr = []
#   word.downcase.chars.each do |ch|
#     word.count(ch) > 1 ? result_arr << ')' : result_arr << '('
#   end
#   result_arr.join('')
# end

# duplicate_encode("din")
# duplicate_encode("recede")
# duplicate_encode("(( @")



# requirement:
# given a string object, return an integer.
# return value:
# integer indicates the position of the answer within the string
# given string will be numbers delimited by space. 
# starting from left, 1, 2, 3, and so forth. return the one
# number's position that is different in eveness from the rest.

# 2 possible outcome:
# one number is even, while others are all odd

# one number is ODD, while others are all even.


# possible solution:
# create an array of numbers from the string.
# - string.split(' ') ['2', '4', '5']
# .each do char.to_i

# integer_arr, pass each to check for even or odd.

# tally up whether the number is even or odd. 
# -creating a hash, keys are even and odd,
# {even: count of numbers that are even, odd: count of #s that are odd}
# if hash[even] == 1, then the different number is the even one
#   hash[odd] ==1, then different number is the odd one

# when looking for the even one, 
#   iterate through the integer_arr again, this time with index
#   test integer.even? if true, then return the index + 1 as the answer


# def iq_test(numbers)
#   int_arr = numbers.split(' ').map { |num| num.to_i }
#   even_odd_tally_hsh = { even: 0, odd: 0 }
#   int_arr.each do |int|
#     int.even? ? even_odd_tally_hsh[:even] += 1 : even_odd_tally_hsh[:odd] += 1
#   end
#   if even_odd_tally_hsh[:even] == 1
#     int_arr.each_with_index do |int, ind|
#       return ind+1 if int.even? 
#     end
#   else
#     int_arr.each_with_index do |int, ind|
#       return ind+1 if int.odd?
#     end
#   end
# end

# p iq_test('2 4 7 8 10')




# likes [] // must be "no one likes this"
# likes ["Peter"] // must be "Peter likes this"
# likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
# likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
# likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

# requirement:
# given an array of names, return a string that displays a description
# return value:
# depending on the number of likes, the returned description will change
# 0 "no one"  + likeS this 
# 1 "Name" + likeS this
# 2 "Name1 and Name 2" + like this
# 3 "Name1, Name2, and Name3" + like this 
# n  "Name1, Name2 and (n-2) others" + like this 

# case name_arr.length
# when 0
# when 1
# when 2
# when 3
# else 4 or more (n)
#   name_arr[0] + ", " + name_arr[1] + " and " + n-2 + " others like this"
# end


# def likes(names)
#   case names.length
#   when 0 then "no one likes this"
#   when 1 then names[0] + " likes this"
#   when 2 then names[0] + " and " + names[1] + " like this"
#   when 3 then names[0] + ", " + names[1] + " and " + names[2] + " like this"
#   else
#     names[0] + ", " + names[1] + " and " + (names.length-2).to_s + " others like this"
#   end
# end

# likes([])
# likes(["Peter"])
# likes(["Jacob", "Alex"])
# likes(["Max", "John", "Mark"])
# likes(["Alex", "Jacob", "Mark", "Max", '2', '3'])




# requirement:
# given a string, return a new string
# return value:
# given string will contain letters and non-letters, replace all letters
# with their position in the alphabet.
# the numbers/positions will be delimited by one space for each letter.

# create a hash with letter as key position as value
# take the string.
# remove all space with string.delete(' ')
# take this string and make char array. 

# match them against letters.
# if ch =~ /[a-zA-Z]/, then hash[ch] is mapped to a new array.
# else nothing happens to new array

# join new array with ' ' and return that value

# ALPHABET_POSITION = Hash.new

# ('a'..'z').to_a.each_with_index do |letter, ind|
#   ALPHABET_POSITION[letter] = ind+1
# end

# def alphabet_position(text)
#   char_arr = text.downcase.delete(' ').chars
#   result_arr = []
#   char_arr.map do |ch|
#      result_arr << ALPHABET_POSITION[ch] if ch =~ /[a-zA-Z]/
#   end
#   result_arr.join(' ')
# end

# p alphabet_position("The sunset sets at twelve o' clock.")

class Vehicle
  attr_accessor :color, :model, :speed 
  attr_reader :year
  
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    self.color = c
    self.model = m 
    self.speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallon, mile)
    puts "#{mile / gallon} mpg"
  end

  def display_speed
    puts "Speed: #{speed}"
  end

  def speedup(s)
    self.speed += s
    self.display_speed
  end

  def brake(s)
    self.speed -= s 
    self.display_speed
  end 

  def shutoff
    self.speed = 0
    puts "It's off."
  end

  def spray_paint(color)
    self.color = color 
  end

end

class MyTruck < Vehicle
  DIFF = "It has a truck bed."
end

class MyCar < Vehicle
  
  DIFF = "It seats 4 people and has no truck bed."

  def to_s
    puts "This car is a #{color} #{model}."
  end

end


buick = MyCar.new(1995, "Teal", "Buick")
buick.speedup(45)
buick.brake(10)
buick.shutoff
buick.spray_paint("Black")
puts buick.color










