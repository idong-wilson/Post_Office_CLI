require_relative 'package'

class PostOffice
  def initialize
    @packages = []
  end

  def run
    puts "Welcome to the Post Office!"
    loop do
      puts "What would you like to do?"
      puts "1. Track a package"
      puts "2. Add a new package"
      puts "3. Exit"
      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1
        track_package
      when 2
        add_package
      when 3
        exit
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def track_package
    puts "Enter tracking number:"
    tracking_number = gets.chomp
    package = @packages.find { |p| p.tracking_number == tracking_number }

    if package
      puts "Package found:"
      puts "Tracking Number: #{package.tracking_number}"
      puts "Destination: #{package.destination}"
      puts "Status: #{package.status}"
    else
      puts "Package not found."
    end
  end

  def add_package
    puts "Enter tracking number:"
    tracking_number = gets.chomp
    puts "Enter destination:"
    destination = gets.chomp

    package = Package.new(tracking_number, destination)
    @packages << package

    puts "Package added successfully!"
  end
end

# Run the CLI application
post_office = PostOffice.new
post_office.run if __FILE__ == $PROGRAM_NAME
