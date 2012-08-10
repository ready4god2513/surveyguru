I needed a survey builder for Rails.  I searched everywhere.  What I found was either out of
date, or had 3m dependencies that I just didn't want to use in my project.  So I am building
SurveyGuru.

**SurveyGuru is still a WIP**

Let's Start with the **DSL** for creating a survey

## DSL

	survey "Kitchen Sink", :version => 1 do
	
		page do
			question "What is this?", :type => :radio, :required => true, :id => :what-is-this do
				hint "Please fill out the below form so we can spam you."
				
				answer "A survey"
				answer "A cat"
				answer "A dog"
			end
			
			whilst :previous => {:is => "A survey"} do
				question "Why do you say that?", :type => :select do
					option "guessed", :label => "Because I guessed"  # Label and field value are, by default the same.  Passing in :label overrides the label
					option "smart"
					option "I didn't mean to"
					option "Other"
				end
				
				whilst :previous => {:is => "I didn't mean to"} do
					question "Tell us 5 reasons why we should believe you", :type => :textfield do
						input "Reason One"
						input "Reason Two"
						input "Reason Three"
						input "Reason Four"
						input "Reason Five"
					end
				end
			end
			
			whilst :previous => {:not => "A survey"} do
				complete do
					redirect :to => :home, :message => "Thanks, but your input is going to be worthless"
				end
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
			
			question "What is your favorite color", :type => :checkbox, :required => {:min => 1, :max => 2, :or => :textbox} do
				answer "Blue"
				answer "Green"
				answer "Red"
				answer "Other", :type => :textbox, :placeholder => "other"
			end
			
			whilst :what-is-this => {:is => "A Cat"} do
				question "Why did you answer \"A Cat\"?" do
					answer "I was messing around"
					answer "I can't read.  What is this?"
					answer "Because it is"
				end
			end
		end
		
		page do
			question "Sort these things by your favorite", :type => :sortable do
				hint "You are almost done, hang in there!"
				answer :bites, :label => "whilst the dog bites"
				answer :stings, :label => "whilst the bee stings"
				answer :sad, :label => "whilst I'm feeling sad"
				answer :none, :label => "I don't like any of these things"
			end
			
			complete do # Optional.  Will 
				redirect :to => :results, :message => "Thanks for taking the survey"
			end
		end
	
	end
	
	
## Storing and retrieving surveys and answers

#### SurveyGuru will generate a few models in your app-

1. Surveys
2. Questions
3. Answers
4. Results

#### Database Tables

1. surveys (name, version, rules [store])
3. questions (survey_id, name, type [enum], hint, rules [store])
4. answers (question_id, type [enum], rules [store])
5. results (answer_id, user_id, value [store])

Surveys have many questions, while questions have many answers.  You can also get a listing of all of
the answers for a survey via the `has_many :through` connection.

Surveys are versioned (defaults to timestamp) in order to allow for updates to the surveys.

Surveys can be retrieved from the database by using the following

	@survey = Survey.find({:name => name, :version => version})
	# friendly_id is used under the hood to parameterize the survey
	# If you do not pass in a version, the most recent version of the survey will be returned
	

## Requirements

SurveyGuru depends on `Rails >= 3.2`, `friendly_id >= 4.0.0`, `simple_form` (for default form rendering),
and a `current_user` method (pointing to class of `User`) to be made available in the controller and views (default in devise).

SurveyGuru will aim to support both postgres and mysql, however most of the testing is done with postgres
as the primary driver.  If you find a bug, or can offer a patch to support another driver, please submit
a pull request.