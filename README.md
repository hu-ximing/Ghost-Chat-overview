# Ghost Chat

## Components

| Component            | Developer    | Technologies                       | License | Link                                       |
| -------------------- | ------------ | ---------------------------------- | ------- | ------------------------------------------ |
| Backend server       | Ximing Hu    | Java, Spring Boot, Spring Security | AGPL    | <https://github.com/hu-ximing/chat-server> |
| Frontend interaction | Jiacheng Li  | Vue, TypeScript, JavaScript, html  |         | <https://github.com/LJC0414/GhostChat>     |
| Frontend design      | August Zheng | html, css                          |         | <https://github.com/Zheng-August/html>     |

## Inspiration

123

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

### Building web page

```shell
git clone https://github.com/LJC0414/GhostChat.git
cd GhostChat/
# resolve dependencies
npm install
# start the live server
npm run dev
# build static html and javascript in dist/
npm run build
```

### Building backend service

Run the application

```shell
git clone https://github.com/hu-ximing/chat-server.git
cd chat-server/
./mvnw spring-boot:run
```

Package to jar file

```shell
./mvnw install
```

## Challenges we ran into

Spring Boot has a steep learning curve.

Vue has a steep learning curve.

Designing the look, interaction and logic of the website is challenging.

## Accomplishments that we're proud of

123

## What we learned

Beside the technologies listed in the table above, we learned to use git to manage our projects and collaborate effectively.

## What's next for Ghost Chat

- Searching users
  
  通过 id 或 name 搜索陌生用户，列出搜索结果
  点击搜索结果，展示该用户的详细界面
  可以申请添加好友

- Group chat
  
  群组按照与好友相同的方式在最近好友中展示，但是名字显示组名。
  对话框中显示所有组员的消息记录
  用户点击创建群组的选项后，展示群组创建界面，该界面列出该用户所有好友及对应的checkbox，打勾表示新群组中包括此成员
  输入新群组名称，完成按钮

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
