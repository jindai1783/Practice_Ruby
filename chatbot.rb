def get_response(input)
  add_question = input.match('Add "(.+?)" with response "(.+?)"')
  if add_question
    question = add_question[1]
    answer = add_question[2]
    RESPONSES[question] = answer
    puts "questions and answer added"
  end

  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3}

end

def colorize(text, color_code)
	"\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I like (.*)' => 'Wow, I like %{c1} too',
              'Do you like (.*)?' => 'Of course I do!',
              'I like (.*), (.*) and (.*)' => '%{c1} is good, %{c2} is okay, %{c3} is terrible',
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}



def greeting
  puts red("Hello, what's your name?")
  name = gets.chomp
  puts red("Hello #{name}")
  print green(name) + green(': ')
end

def conversation
  while(true) do
  	input = gets.chomp
  	break if input == 'quit'
    puts red('Bot: ') + red(get_response(input))
  end
end

puts "This is Master"
greeting
conversation