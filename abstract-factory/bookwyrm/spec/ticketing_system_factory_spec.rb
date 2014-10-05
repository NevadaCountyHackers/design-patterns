require 'spec_helper'

describe TicketSystemFactory do
  it "#create_ticket raises error" do
    factory = TicketSystemFactory.new
    expect {
      factory.create_ticket('title', 'description')
    }.to raise_error(NotImplementedError, /does not implement create_ticket/)
  end
end

describe AbstractTicket do
 it "#submit raises error" do
   ticket = AbstractTicket.new('title', 'description')
   expect {
     ticket.submit
   }.to raise_error(NotImplementedError, /does not implement submit/)
 end
end

describe JiraTicketFactory do
  it "creates Jira tickets" do
    factory =  JiraTicketFactory.new
    ticket = factory.create_ticket('title', 'description')
    expect(ticket.class.name).to eq('JiraTicket')
  end
end


describe Application do
  let(:title) { 'Ticket title' }
  let(:description) { 'Ticket description' }

  context "with a JiraTicketFactory" do
    let(:application) { Application.new(JiraTicketFactory.new) }

    it "creates Jira tickets" do
      expect(application.create_ticket(title, description).class.name).to eq('JiraTicket')
    end

    it "creates tickets that can submit" do
      ticket = application.create_ticket(title, description)
      expect(ticket.submit).to eq('Submitting Jira ticket')
    end
  end

  context "with a GitHubTicketFactory" do
    let(:application) { Application.new(GitHubTicketFactory.new) }

    it "creates GitHub issues" do
      expect(application.create_ticket(title, description).class.name).to eq('GitHubIssue')
    end

    it "creates tickets that can submit" do
      ticket = application.create_ticket(title, description)
      expect(ticket.submit).to eq('Submitting GitHub issue')
    end
  end

  context "with a PivotalTicketFactory" do
    let(:application) { Application.new(PivotalTicketFactory.new) }

    it "creates Pivotal tickets" do
      expect(application.create_ticket(title, description).class.name).to eq('PivotalTicket')
    end

    it "creates tickets that can submit" do
      ticket = application.create_ticket(title, description)
      expect(ticket.submit).to eq('Submitting a PivotalTracker ticket')
    end

  end
end
