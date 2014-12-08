def get_response(input)
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

puts red("Hello, what's your name?")
name = gets.chomp
puts red("Hello #{name}")
while(true) do
	print green(name) + green(': ')
	input = gets.chomp
	if input == 'quit'
		break
	end
  puts red('Bot: ') + red(get_response(input))
end