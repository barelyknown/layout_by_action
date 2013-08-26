require "spec_helper"

# stand ins for Rails application controller
# it is extended by the railtie

class ApplicationController
  include LayoutByAction::Able
  def self.layout(method); end
end

class YourController < ApplicationController; end

module LayoutByAction
  describe YourController do
    let!(:layout_by_action) { { new: "alt_one", [:show, :index] => "alt_two" } }
    let!(:default) { nil }

    before { described_class.layout_by_action default, layout_by_action }

    it "should add layout_by_action to subclasses of application controller" do
      expect(described_class).to respond_to(:layout_by_action)
    end

    it "should provide the specified layout when a single action is used" do
      expect(subject.layout_by_action(:new)).to eq "alt_one"
    end

    it "should provide the right layout when an array of actions are used" do
      [:show, :index].each do |action|
        expect(subject.layout_by_action(action)).to eq "alt_two"
      end
    end

    context "when a default is provided" do
      let!(:default) { "default" }

      it "should use the default layout for an action not specified" do
        expect(subject.layout_by_action(:default)).to eq "default"
      end
    end
  end
end