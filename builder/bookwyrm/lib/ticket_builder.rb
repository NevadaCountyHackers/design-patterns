class TicketBuilder
  attr_reader :url, :description, :browser, :type

  def set_url url
    @url = url
  end

  def set_description description
    @description = description
  end

  def set_browser browser
    @browser = browser
  end

  def get_ticket
    Ticket.new(url, description, browser, type)
  end
end

class BugTicketBuilder < TicketBuilder
  def initialize
    @type = 'bug'
  end
end

class FeatureTicketBuilder < TicketBuilder
  def initialize
    @type = 'feature'
  end
end

class Ticket
  attr_reader :url, :description, :browser, :type
  attr_reader :created_at

  def initialize(url, description, browser, type)
    @url = url
    @description = description
    @browser = browser
    @type = type
    @created_at = Time.now
  end
end

class Application
  def create_ticket builder
    #builder = builder.new
    builder.set_url('http://www.example.com')
    builder.set_description('typo on line 2')
    builder.set_browser('MSIE')
    builder.get_ticket
  end
end
