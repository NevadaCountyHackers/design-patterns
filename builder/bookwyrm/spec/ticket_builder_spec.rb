require 'spec_helper'

describe Application do
  let(:application) { Application.new }

  context "with a feature ticket builder" do
    let(:builder) { FeatureTicketBuilder.new }

    it "creates a feature ticket" do
      ticket = application.create_ticket(builder)
      expect(ticket.type).to eq('feature')
    end
  end

  context "with a bug ticket builder" do
    let(:builder) { BugTicketBuilder.new }

    it "creates a bug ticket" do
      ticket = application.create_ticket(builder)
      expect(ticket.type).to eq('bug')
    end
  end
end
