I needed a survey builder for Rails.  I searched everywhere.  What I found was either out of
date, or had 3m dependencies that I just didn't want to use in my project.  So I am building
surveyguru.

Let's Start with the **DSL**

## DSL

	survey "Kitchen Sink" do
	
		page do
			question "What is this?", :type => :radio, :required => true do
				hint "Please fill out the below form so we can spam you."
				
				answer "A survey" do

					question "Why do you say that?", :type => :select do
						option "Because I guessed"
						option "Because I am smart"
						option "I didn't mean to" do

							question "Tell us 5 reasons why we should believe you", :type => :textfield do
								input "Reason One"
								input "Reason Two"
								input "Reason Three"
								input "Reason Four"
								input "Reason Five"
							end

						end
						option "Other"
					end

				end
				answer "A cat"
				answer "A dog"
			end
		end
		
		page do
			question "Who are you?", :type => :textbox do
				hint "Another hint for the user"
				input "Tell us all about yourself", :required => true
			end

			question "What is this not?", :type => :checkbox, :required => {:min => 1, :max => 2} do
				answer "A survey"
				answer "A cat"
				answer "A dog"
			end
		end
		
		page do
			question "Sort these things by your favorite", :type => :sortable do
				hint "You are almost done, hang in there!"
				answer "When the dog bites"
				answer "When the bee stings"
				answer "When I'm feeling sad"
				answer "I don't like any of these things"
			end
		end
	
	end