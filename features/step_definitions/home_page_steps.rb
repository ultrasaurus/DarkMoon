def path_to(page_name)
  case page_name
  when "the Home Page"
    "/"
  end
end

Given /^I am (.+)$/ do |user|
  if user == 'unknown volunteer'
    # not signed in, so do nothing
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end