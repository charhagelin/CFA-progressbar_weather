require 'terminal-table'
require 'paint'

class Temperatur
  def initialize (questions)
    @questions = questions
  end
attr_accessor :questions

def ask(progress_bar)
  answers = []
  fahrens = []

  @questions.each do |question|
    system("clear")
    puts "#{progress_bar.title}: #{progress_bar.current_step}"
    puts question
    answer = gets.chomp.to_i
    fahren = answer *9 / 5 + 32
    #color logic kolla sen
    if answer <= 20
      answer = Paint[answer, :blue]
    else answer >= 20
      answer = Paint[answer, :red]
    end

if fahren <= 68
  fahren = Paint[fahren, :blue]
else fahren >= 68
  fahren = Paint[fahren, :red]
end

    answers << answer
    fahrens << fahren
    #puts answers.inspect
    progress_bar.current_step = progress_bar.current_step + 1
  end

  puts "This was the temperatur last week according to your answers:"
  answers.each do |answer|
  fahrens.each do |fahren|
  end
end


  rows = []
  rows << ['Monday', answers[0], fahrens[0]]
  rows << ['Tuesday', answers[1], fahrens[1]]
  rows << ['Wednesday', answers[2], fahrens[2]]
  rows << ['Thursday', answers[3], fahrens[3]]
  rows << ['Friday', answers[4], fahrens[4]]
  rows << ['Saturday', answers[5], fahrens[5]]
  rows << ['Sunday', answers[6], fahrens[6]]
table = Terminal::Table.new :headings => ['Days', 'Celcius', 'Fahrenheit'], :rows => rows

puts table


end
end

class ProgressBar
  def initialize(title)
    @current_step = 1
    @title = title
  end
  attr_accessor :current_step, :title

end
question_list = [
  "What was the temp on monday?",
  "What was the temp on Tuesday?",
  "What was the temp on Wednesday?",
  "What was the temp on Thursday?",
  "What was the temp on Friday?",
  "What was the temp on Saturday?",
  "What was the temp on Sunday?"
]

my_week = Temperatur.new(question_list)
progress_bar = ProgressBar.new("Question Progress")


my_week.ask(progress_bar)
