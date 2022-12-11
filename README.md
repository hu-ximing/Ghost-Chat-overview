# Ghost Chat

## Components

| Component                                                    | Developer    | Technologies                                       | License |
| ------------------------------------------------------------ | ------------ | -------------------------------------------------- | ------- |
| [Backend server](https://github.com/hu-ximing/chat-server)   | Ximing Hu    | Java, Spring Boot, Spring Security, MySQL Database | AGPL    |
| [Frontend interaction](https://github.com/LJC0414/GhostChat) | Jiacheng Li  | Vue, TypeScript, JavaScript, html                  |         |
| [Frontend design](https://github.com/Zheng-August/html)      | August Zheng | html, css                                          |         |

## Installation

Ghost Chat installation script can be found [here](https://github.com/hu-ximing/ghost-chat-installation-script).

## Inspiration

1. To make a free chat software that respects user's freedom to inspect and modify the source code.

2. To learn and apply programming knowledge.

3. To exercise our group members' teamwork, communication, and problem-solving skills.

## What it does

- Sign up
  
  New user can submit their username (unique email), password, first name, last name, and display name. A user account will be provided.

- Login
  
  User can submit username and password. The server authenticates against that user.

- Logout
  
  Clear authentication status and show the login page again.

- Main page
  
  The main page is shown after the user has logged in.
  
  - Friend list

    Display a list of friends. The list is displayed in order: the closer the interaction time is, the higher the friend will be displayed in the list. When clicking an entry, initiate a dialog with that friend.
  
  - Dialog box

    Used to display the message history. Messages are listed as message boxes comprised of their content and timestamp. User can enter text in the input field at the bottom. Click the send button to send message.

- Messaging
  
  Users can send text to their friends in the dialog box. Messaging history will be saved on the application server.
  
  If A send a message to B while B is not in the dialog with A, the message is considered unread. In B's friend list, the entry of friend A displays a badge, representing the number of unread messages;

- Friend requests
  
  Users can send friend requests to other users. A friend request includes the friend user id and sender's self introduction.
  
  Users can view received friend requests from other users and optionally accept or reject friend requests.

## How we built it

### Frontend: Vue

`TODO`: Frontend developers will complete this section.

### Backend: Spring Boot

This program is built with the advanced enterprise-level Java framework [`Spring Boot`](https://spring.io/) and its security framework [`Spring Security`](https://spring.io/projects/spring-security). `Spring Boot` is a new technology that was first released in [2014](https://github.com/spring-projects/spring-boot/releases/tag/v1.0.0.RELEASE), and has become very popular nowadays.

In our application, `Spring Boot` is used to create Rest APIs that allow clients to send http requests to communicate with the server, getting or sending information. `Spring Security` is used to provide authentication against the username and password, allowing only the authenticated (logged-in) user to get their own information and they can only send requests on their behalf.

## Challenges we ran into

Spring Boot has a steep learning curve.

Vue has a steep learning curve.

Designing the look, interaction and logic of the website is challenging.

Configuring the server requires extensive knowledge.

## Accomplishments that we're proud of

It works.

## What we learned

This complex project challenges our abilities to operate as a team, communicate effectively, and incorporate what we have learnt into our work.

We learned to design the program's structure, create study plans, and research to solve problems.

We learned how to clarify the requirements and how to break down a large project into small and specific jobs.

We respect each member's decisions since everyone is essential in our team.

Beside the technologies listed in the table above, we learned to use git to manage our projects and use it as a tool for team cooperation.

## What's next for Ghost Chat

- Searching users
  
  Search for unknown users by id or username and list the search results.
  
  Click on the search result to show the summaries of that user.
  
  Click on "Add friend" to send that user a  friend request.

- Group chat
  
  Groups are displayed in the friends list in the same way as users, but the name shows the group name.
  
  The dialog section shows the message history of all group members.
  
  When the user clicks on the button to create a group, the group creation interface is displayed, which lists all the friends of the user and the corresponding checkbox. Checked checkbox indicates that the new group includes this user.
  
  Enter the new group name and click the Done button.

- Sending pictures and files

- End-to-end encryption using asymmetric key pairs

## Screenshots

Login page

![Login page screenshot](./images/frontend/login.png)

Chat page

![Chat page screenshot](./images/frontend/chat.png)

API documentation (OpenAPI generated)

![OpenAPI documentation screenshot](./images/backend/api.png)

IDE

![IDE screenshot](./images/backend/ide.png)
