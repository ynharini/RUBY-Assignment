def find_shortest_transformation
		start_word = get_starting_word
		end_word = get_ending_word(start_word.size)
		words = get_array_of_words(start_word.size)		
		resulted_words = [start_word]
		words << end_word
		find_path(words, resulted_words)
end


def get_starting_word
	p "Please Enter starting word"
	start_word = gets.chomp
	start_word_size = start_word.size
	error_message = if start_word_size < 1 
						"Starting word length should be greater 1"
					elsif start_word_size > 5
						"Starting word length should not be greater 5"
					end
	raise error_message if error_message
	start_word
end

def get_ending_word(start_word_size)
	p "Please Enter ending word"
	end_word = gets.chomp
	end_word_size = end_word.size
	if end_word_size != start_word_size
		error_message = "Ending word length should be equal to start word size i.e; #{start_word_size}"
	end
	raise error_message if error_message
	end_word
end

def get_array_of_words(start_word_size)
	p "Please Enter array of words seperated by space"
	words = gets.chomp.split(' ')		
	error_message = if words.size == 0 
						"Array length should not be empty"
					elsif words.size < 2 
						"Array length should be  greater than or equal to 2" 
					elsif words.size > 600
						"Array length should be  less than or equal to 600"
					end
	raise error_message if error_message
	
	unless (words.all? {|word| word.length == start_word_size})
		raise "Please enter values in equal length of start word i.e; #{start_word_size}"
	end
	words
end

def words_matched?(word1, word2, resulted_words)
	unmatched_letter_count = 0
	word1.size.times do |i|
		unmatched_letter_count += 1  if (word1[i] != word2[i])
		if (i == 2) 
			if (unmatched_letter_count == 1)
				resulted_words << word2.join() 
				return true
			else
				return false
			end
		end
	end
end

def find_path(words, resulted_words)
	matched = true
	words.each do |word|
		if matched == false
			matched = true
			next 
		end
		word1 = resulted_words.last.split("").to_a
		word2 = word.split("").to_a
		matched = words_matched?(word1, word2, resulted_words)
	end
	resulted_words.length
end

#To find the shortest path
path = find_shortest_transformation
puts "Shortest path is #{path}"
