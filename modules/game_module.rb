module GameModule
    def capture_input(request_text)
        print "#{request_text}: "
        gets.chomp
    end
end