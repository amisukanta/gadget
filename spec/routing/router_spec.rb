require "rails_helper"
require "spec_helper"

RSpec.describe "Routing of gadgets", :type => :routing do
  describe "GET #index" do
    it "responds when it can access to the index page" do
      


      expect( :get => "/gadgets/new").to route_to(
      :controller => "gadgets",
      :action => "new"
    )
      end

    it "renders the index template" do
              expect(:get => "/profiles").not_to be_routable
    end


   end
end