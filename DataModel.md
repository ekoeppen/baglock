# System Description #

Terms are defined [here](http://www.scrumalliance.org/articles/39-glossary-of-scrum-terms).

The system maintains a **product backlog**. The backlog describes desired functionality and all other **items** which are needed to produce a 'done' product. The source of the items is the **product owner**. The items on the product backlog are **prioritized**. The items also have an estimated **effort**. Units of effort are not further specified, but can be complexity, functionality or time based.

Work is timeboxed in **sprints**. Each item on the backlog must fit into one sprint. Backlog items are split into **tasks**. Each task should take no longer than two to three days to complete. Tasks are picked by **team members** in the **sprint planning meeting**. Splitting backlog items into tasks should to occur before the sprint planning meeting to streamline the meeting. Splitting is done as **research** during a sprint, and this research time has to be available to team members. The tasks which are picked by the team members in the sprint planning meeting make up the **sprint backlog**.

Sprint tasks are worked on during a sprint, and their completion is recorded in the sprint backlog. A task can be **assigned**, **started**, and **completed**. The number of completed tasks over time makes up the **burndown chart**. At the end of a sprint, the produced functionality is demonstrated to the product owner in a **sprint review** meeting.

# Concepts #

  * Product Backlog
  * Product Owner
  * Product Backlog Item
  * Priority
  * Effort
  * Sprint
  * Task
  * Team
  * Team Member
  * Sprint Planning
  * Sprint Review
  * Status
  * Assigned
  * Started
  * Completed

# Model (Not Normalized) #

  * Item: ID, Title, Description, Priority, Effort, Status, Sprint, Tasks, Notes, References, Dependencies
  * Task: ID, Title, Description, Team Member, Effort, Status, Sprint, Dependencies
  * Sprint: ID, Start, End, Items

# Tables #

  * items
  * tasks
  * sprints
  * developers