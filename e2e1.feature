#test case flow
# Positive flow -E2E -creation of tactical plan and basic commitment, and then adding a receipt and completing the receipt and plan


Feature: Positive flow -E2E -creation of tactical plan and basic commitment, and then adding a receipt and completing the receipt and plan

Scenario: Login
When I visit sys
When I login as ops
Then I should see the Dashboard page

Scenario: Planning Summary page
When I click Planning
And I click Summary
Then I see Summary Page loads with a list of plans

Scenario: Create New Tactical plan
Given I am on Summary Page
When I click Create New
And I click Tactical Plan
Then I see the Tactical plan form

Scenario: Tactical Plan form -draft status
Given I see the Tactical plan form
Then I Verify the below
|fieldname  |Value|
|Status |Draft|
|Owner  |ops|

Scenario: Tactical Plan form -Fill the details
Given I see the Tactical plan form
Then I fill the details as below and click Save
|fieldname  |Value|
|Title  |Autotest Regression -E2E-1 <<todays date>>|
|Organisation   |   |
|Region |   |
|Sub Region |   |
|Activity Type  |   |
|Cost Type  |   |
|Start Date |   |
|End date   |   |
|Fund Type  |   |
|Cost   |   |
|Partner Activity   |   |
|Partner MDF    |   |
|Involvement Detail |   | 
|Business Unit |    |
|Product Segment    |   |
|Product Franchise  |   |
|Producty Type  |   |
|Product    |   |
|Functional Objective|  | 
|Focus  |   | 
|Comments   |   |
|Integrated Campaign Link| |
|Sub IC code    |   |
|Description|Autotest Regression Tactical plan <<todays date>> Positive flow -E2E -creation of tactical plan and basic commitment, and then adding a receipt and completing the receipt and plan
 |
Then I see the message Successfully Saved

Scenario: Tactical Plan - Request Approval
When I Click Request Approval
Then I see the message Successfully Requested Approval
And I see Status is Awaiting Approval

Scenario: Tactical Plan -Approve -auto approve as ops user
When I Click Approve
Then I see the message Successfully Approved
And I see Status is Approved

Scenario: Expand Financial Commitment subsection
When I Expand the Financial Commitment subsection
Then Create Commitment button is displayed

Scenario: Basic commitment-Creation
When I click Create Commitment button 
Then Commitment form displays at Draft status 
#//later left side panel as Submit, Delete, Add comment, Close//

Scenario: Commitment form -Verify the fields pre-populated from tactical plan
Then I Verify the below
|fieldname  |Value|
|Organisation   |-prefilled from plan|
|Region |-prefilled from plan|
|Sub Region |-prefilled |
|Start Date |-prefilled from plan |
|End date   |-prefilled from plan |
|Currency   |-prefilled from plan|
|Commitment ID  | #//capture the value and store it and display to output|

Scenario: Commitment form -Fill the details
When I Fill in the details for the below 
|fieldname  |Value|
|Description    |   |
|Purchase order |   |
|Owner  |   |
|Company    |   |
|Description|   |

# // Later - Region -populated//
# // Later - Plan name -populated//



Scenario: Commitment form -cost allocation pop-up
When I Fill in the details for the below fields and click Split by Month
|fieldname  |Value|
|Amount to split    |800    |
Then Verify Money is allocated to the months. ex: 400, 400
And Verify line item is created for each month

Scenario: Commitment -submit approval
When I Click Submit
Then I see the message Successfully Submited
And Status shows as Approved

Scenario: Add Invoice
When Under Receipting subsection, on line item click Receipt amount field
And In the pop-up displayed, I Fill in the details for the below fields and I click Add Invoice button
|fieldname  |Value|
|Invoice Amount |   |
|Description    |   |
Then I see A row is added in the pop-up
#ex : 300

Scenario: Verify Invoice on commitment form
When Click Close in the pop-up
Then I see Invoice amount is displayed in the Receipt Amount column

# //Advance commitment-Creation
# //form is same except the way the cost and how the lineitem is added. 
# //Here we have to search the plan name-so could be complex??
# //So do in a different test 

Scenario: Confirm Last Receipt
Given Invoice and Receipt Amounts noted
And Plan cost is noted
When I Click Confirm Last Receipt button
And I Click - Confirm Last Receipt button In the Confirmation pop up displayed 
Then I see Total Amount gets updated to Total Receipt.
#ex: 550, 550
And I see Status is Completed 

When I Click Close on the commitment form
And I Click Go back to <<plan name >>
Then on the plan form Verify Cost value updated to  the Total Receipt value
#ex: 750
And I see Status is Completed 









