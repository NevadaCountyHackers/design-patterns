class TicketSystemFactory
  def create_ticket(title, description)
    raise NotImplementedError, "#{self.class.name} does not implement create_ticket()"
  end
end

class AbstractTicket
  attr_accessor :title, :description

  def initialize(title, description)
    self.title = title
    self.description = description
  end

  def submit
    raise NotImplementedError, "#{self.class.name} does not implement submit()"
  end
end

class JiraTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return JiraTicket.new title, description
  end
end

class JiraTicket < AbstractTicket
  def submit
    'Submitting Jira ticket'
  end
end

class GitHubTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return GitHubIssue.new(title, description)
  end
end

class GitHubIssue < AbstractTicket
  def submit
    'Submitting GitHub issue'
  end
end

class PivotalTicketFactory < TicketSystemFactory
  def create_ticket(title, description)
    return PivotalTicket.new(title, description)
  end
end

class PivotalTicket < AbstractTicket
  def submit
    'Submitting a PivotalTracker ticket'
  end
end

class Application
  attr_accessor :ticket_system

  def initialize(ticket_system)
    self.ticket_system = ticket_system
  end

  def create_ticket(title, description)
    ticket_system.create_ticket(title, description)
  end
end

