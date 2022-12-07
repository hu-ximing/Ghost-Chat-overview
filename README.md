# Ghost Chat

## Components

| Component            | Developer    | Technologies                       | License | Link                                     |
| -------------------- | ------------ | ---------------------------------- | ------- | ---------------------------------------- |
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
  
  主界面，用户登陆后展示
  
  - 好友列表
  
    展示最近发送消息的好友列表
    列表按照顺序展示：互动时间越近，则展示越靠前
    点击列出的某个好友后，启动与那个好友的对话框
    详细信息按钮，点击后进入好友或群组的详细界面
  
  - 对话框
  
    大部分用于展示历史记录，以消息框的形式列出
    消息编辑功能，可以输入文字或上传图片，发送功能

- Messaging

  对话框中可以给好友发送文字或图片信息。（只包含文字或只包含图片）
  发送消息后记录信息：发送时时间戳
  如果新发送的消息与上一条给该好友发送的消息时间差异大于10分钟，则展示时间戳
  服务器端保留历史记录
  B收到A消息后，在B的最近好友中A会排名最前；
  如果B收到消息时没有打开和A的对话框，则认为目前该消息未读，在B客户端最近好友列表中，好友A的条目展示数字标识，代表未读消息数量；
  如果B收到消息时处于与A的对话框中，立即弹出A发送的新消息

- Friend requests
  
  用户可以给其他用户发送好友请求（以及自我介绍）；也可以接受或拒绝来自其他用户的好友请求。用户可以查看接收到的好友请求。

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
