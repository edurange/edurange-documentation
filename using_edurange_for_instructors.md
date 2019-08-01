% EDURange Instructor’s Manual
%
% March 6, 2017

Using Instructor’s Manual
--------------------------------------

The Scenarios section of this manual is identical to what is included in
the Student’s Manual. Since this is a publicly available document, we
have not included extra information for you here. Once you have an
EDURange Insturctor’s account, a more in-depth manual can be found with
specifics of the scenarios. There you can find solutions, hints, file
locations, and other particulars to the scenarios that we want to keep
hidden from your students.

Using EDURange
============================

As an instructor, when you login to https://cloud.edurange.org, you will
be able to run scenarios, view student data, and monitor scoring events.
Once you have a registration code, you can create your account and the
EDURange team can designate it as an instructor account.

We suggest making your own student account and testing the process below
before using EDURange in the classroom. You can use a private browser to
login with a second account at the same time.

Managing Students
---------------------------------------------

### Registering Students

In order for students to sign up at cloud.edurange.org, they need a
registration code. You can find your code on the home tab under the
heading, "Registration Code:" (It is located below AWS Settings and
above User Information, it should be an alphanumeric string like
'23a6e9k2a5'). Give this code to your students and have them sign up at
cloud.edurange.org. Students will need to provide the registration code
and a name, email, and password.

As you will be managing the students based on the name they sign up
with, you might want to designate a format for them to use. Only
numbers, letters and underscore can be used in their names. (E.g.
Jane\_Smith, smithj\_cs101)

### Creating Student Groups

Student groups are used to add students to each scenario. For basic use,
create a group per class. Groups can also be used to create teams that
work together which is necessary for some scenarios.

On the home tab, scroll down to the Student Groups section and click the
‘create student group’ button on the right. Your new group will be added
below the default group 'All'. Once students have registered, they will
be automatically added to the ‘All’ group. You can then select them from
this group and add them to your new group, via the button at the footer
of the ‘All’ group, or add them individually with the ‘add to student
group’ button

Running Scenarios
---------------------------------------------

### Creating Scenario

Select the 'Scenario' tab at the top of the page. Once your scenarios
have been created, they will be listed here. Click the 'Load New
Scenario' button. Find the scenario you want to use under 'Production
Scenarios' and click the associated ‘Create’ button. You will be
redirected to a new page for the scenario you just created. From here
you can explore the structure of the scenario, but unless you are making
a custom scenario, the only sub-tabs you need to pay attention to are
‘Users’ and ‘Scoring’.

### Adding Students

It is **important** that you have added all the students to a student
group before continuing here. Students can be added from the ‘Users’
sub-tab. You will find multiple teams here, including an Instructor team
with admin access and login credentials already provided for you. Click
the drop down menu next to the group you would like to add students to
and select ‘Add Student Group’. From here you can select the Student
Group you want to add. (The ‘Add Player’ option will create a user and
password that can be used to login to the scenario, but it won’t be
attached to any student’s account!)

### Booting Scenario

It is **important** that you add your student group from the previous
step before you boot your scenario. If you have already booted the
scenario, unboot it, add the student group, and then boot it again.
Students can’t currently be added once booted.

At the top of the scenario page, click the 'Boot' button on the left.
The full booting process can take anywhere from five minutes on smaller
scenarios, to fifteen minutes on the larger scenarios. Once the scenario
is booted and fully initialized, your students should be able to use
their scenario-specific credentials (which they can see once logged into
cloud.edurange.edu), to ssh into the newly booted scenario. You can see
the credentials for the students and for the instructor under the users
tab for the scenario.

**Please unboot scenarios when they are not being used.** For example,
if you are trying out a scenario to prepare for class, you should unboot
at the end of a session.

Custom Scenarios
------------------------------

UNDER CONSTRUCTION

Currently, you can modify a scenario, for example changing the host IP
addresses by using Load New Scenario tab and then the Clone tab from
there. A new scenario will be created and you can edit it subject to the
resource limitations of the account.

Scoring
-----------------------------------

Some scenarios have questions that utilize our built-in scoring system.
Students, once added to a scenario, can answer them from their accounts.
Their answers can be found in the ‘Scoring’ sub-tab of a scenario’s
page.

The built-in scoring system is used to monitor student’s progress on the
simpler scenarios. They are questions that are simple and objective such
as - “What is the IP address of the Mars Aerospace Port?”, “How many
possible hosts does the subnet 10.0.192.0/18 cover?”, or “What is the
decrypted string of the file 'final\_flag'?”

Some of the scenarios are more complex and therefore don’t utilize this
scoring system, though we have still provided many Assignment Questions
and Discussion Questions which can be found in this and the Student’s
Manual.

Analytics
-----------------------

UNDER CONSTRUCTION
