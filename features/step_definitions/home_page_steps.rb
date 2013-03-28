def path_to(page_name)
  case page_name
  when "the Home Page"
    "/"
  when "the Applications Page"
    "/applications"    
  end  
end

def mock_applications_filter
  mock.instance_of(HomeController).protect_applications { true }
end

def mock_successful_singly_auth
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:singly, { 
    :uid => '12345',
    :credentials => { :token => 'ABC123' }
    })
end

def mock_unsuccessful_singly_auth
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:singly, { :error => 'failed' })
end

Then /^I am at the application download page$/ do
  page.current_path.should == "/applications" 
end

Then /^I am on the Home Page$/ do
  page.current_path.should == "/"
end

Given /^I am (?:a|an) (.+)$/ do |user|
  if user == 'unknown volunteer'
    # not signed in, so do nothing
  elsif user == 'volunteer tester'
    mock_applications_filter
    visit '/applications'
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end

When /^I click on disconnect from (.+)$/ do |service_name|
  click_on('disconnect from ' + service_name)
end

Then /^I connect with (.+)$/ do |service_name|
  mock_successful_singly_auth
  page.should have_content service_name
  page.find_link(service_name)
  click_on(service_name)
end

  
Then /^I fail to connect with (.+)$/ do |service_name|
  mock_unsuccessful_singly_auth
end

