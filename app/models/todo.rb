class Todo < ActiveRecord::Base
  #belongs_to :user

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today).order("id")
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
  def self.show_list
    puts "\nMy Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
  end
end
