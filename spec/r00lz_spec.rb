# frozen_string_literal: true

RSpec.describe R00lz do
  it "has a version number" do
    expect(R00lz::VERSION).not_to be nil
  end

  # it 'returns_success' do
  #   env = { 'PATH_INFO' => '/', 'QUERY_STRING' => '' }
  #   expect(200).to equal(R00lz::App.new.call(env)[0])
  # end

  it 'can can path to a new controller' do
    class TedController < R00lz::Controller
      def think; "Whoah, man...."; end
    end

    env = { 'PATH_INFO' => '/ted/think', 'QUERY_STRING' => '' }
    expect(200).to equal(R00lz::App.new.call(env)[0])
  end
end
