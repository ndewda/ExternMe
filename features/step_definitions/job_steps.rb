Given /^I have added a new job with Company name "(.*?)" and Job Title "(.*?)" and Job Description "(.*?)" and Job Requirements "(.*?)" and Desired Qualifications "(.*?)" and city "(.*?)" and state "(.*?)" and Job-link on your website "(.*?)"$/ do |name,jt,jd,jr,dq,city,state,joblink|
  
  click_link "Post a Job"

  fill_in 'job[companyname]', :with => name
  fill_in 'job[title]', :with => jt
  fill_in 'job[descp]', :with => jd
  fill_in 'job[reqs]', :with => jr
  fill_in 'job[desire]', :with => dq
  fill_in 'job[city]', :with => city
  select(state,:from =>'job[state]')
  fill_in 'job[link]', :with => joblink
  click_button 'Save the Job'
end

Then /^I should see a message "(.*?)"$/ do |msg|
  page.should have_content(msg)
end


When /^I find the title "(.*?)" and edited my job with Company name "(.*?)" and Job Title "(.*?)" and Job Description "(.*?)" and Job Requirements "(.*?)" and Desired Qualifications "(.*?)" and city "(.*?)" and state "(.*?)" and Job-link on your website "(.*?)"$/ do |oldjt,name, jt,jd,jr,dq,city,state,joblink|
  visit ('/users/1')
  click_link "My Jobs"
  click_link oldjt
  click_button 'Edit'
  fill_in 'job[companyname]', :with => name
  fill_in 'job[title]', :with => jt
  fill_in 'job[descp]', :with => jd
  fill_in 'job[reqs]', :with => jr
  fill_in 'job[desire]', :with => dq
  fill_in 'job[city]', :with => city
  select(state,:from =>'job[state]')
  fill_in 'job[link]', :with => joblink
  click_button 'Save the changes'
end

When /^I delete the job which job title is "(.*?)" and click the confirm button$/ do |jt|
  visit ('/users/1')
  click_link "My Jobs"
  click_link jt
  click_button 'Delete'
  puts page.body
end

When /^I am now in the user center$/ do
  visit ('/users/1')
end


When /^I search the job with "(.*?)" and click the search button$/ do |searchmsg|
  click_button "Search"
end

Then /^I should see a message "(.*?)" and the job lists.$/ do |count|
  page.should have_content(count)
end

When /^I click the "(.*?)" link$/ do |title|
  click_link title
end

When /^I click "(.*?)" button$/ do |apply|
  click_button apply
end

Then /^I should visit "(.*?)"$/ do |url|
  visit ("http://www.baidu.com")
end

#view job list
Then /^I should see a header "(.*?)" and a title "(.*?)"$/ do |header,title|
  page.should have_content(header)
  page.should have_content(title)
end



