
<h1>ksw-stats</h1>
My graduation project for Java Developer course by Coders Lab Online.
Application with great potential to develop. It's about KSW (European/Poland greatest mma organisation). The project was born out of desire to have a webapp that collects events, fightcards, fighters with their personals. Whats more, user have an opportunity to menage his account, favorite fighters list, own comments and its likes. 

Application connect to Polsat Sport rss about combat sports and show news to everyone. Also everyone can read about events, fights, contact etc. or use free api endpoints that appears on website. 


<h3>Installation</h3>
ksw-stats is written with Spring Boot with bootstrap template. To run:

compile it with maven and execute jar file
add your username and password for database in application.properties


<h3>Technologies</h3>
Java<br>
Spring Boot<br>
Polsat Sport rss<br>
Spring DataJpa, SpringSecurity<br>
Hibernate<br>
MySql<br>
views: JSP, HTML, JavaScript, CSS

<h3>Usage</h3>
Register and Sign in. Get a view of rss news, events, fights, fighters and comments. Get to user panel, change your personals and picture. Add fighters to favourities. If your role is admin, you can block/unblock users, change their roles, add and upload events, fights, fighters and categories.


<h3>Views</h3>
Access: everyone

![Screenshot from 2021-12-17 12-45-49](https://user-images.githubusercontent.com/90089220/146548319-d5b7de06-cf25-42e9-9df9-577e3d6f1cd9.png)
![Screenshot from 2021-12-17 12-46-14](https://user-images.githubusercontent.com/90089220/146548324-66ba16ed-02c1-4c3c-96e6-9c7a91bb8e5a.png)
![Screenshot from 2021-12-17 12-46-19](https://user-images.githubusercontent.com/90089220/146548328-1ae95e1c-ebf8-4a67-b556-615b1f8cac97.png)
![Screenshot from 2021-12-17 12-46-27](https://user-images.githubusercontent.com/90089220/146548331-02c0f0f1-d024-40c5-88c4-fa709793e82d.png)
![Screenshot from 2021-12-17 12-46-34](https://user-images.githubusercontent.com/90089220/146548335-1146b01d-a86c-4a0e-b0b2-5b0c717f98bb.png)
![Screenshot from 2021-12-17 12-46-48](https://user-images.githubusercontent.com/90089220/146548346-35e05894-94ef-4a91-8257-36a9e9d220f5.png)
![Screenshot from 2021-12-17 12-46-54](https://user-images.githubusercontent.com/90089220/146548347-ace67aed-1161-4ca0-8f9f-5074ca911458.png)
![Screenshot from 2021-12-17 12-48-17](https://user-images.githubusercontent.com/90089220/146548568-31671e4c-0a4b-4d7b-9b1f-fe0c34abd7f5.png)
![Screenshot from 2021-12-17 12-48-22](https://user-images.githubusercontent.com/90089220/146548571-5491ee06-e9f5-4b98-8ebc-416f186b53c6.png)

<details>  
<summary>Api endpoints</summary>  
<p>EVENT<br>
Method			URL			        Action(JSON)<br><br>
GET        /api/event			      Find All<br>
GET        /api/event/{id}			Find by id<br>
POST       /api/event			      Create<br>
PUT        /api/event/{id}			Update with id<br>
DELETE     /api/event/{id}			Delete by id</p><br>
<p>FIGHTER<br>
Method			URL			        Action(JSON)<br><br>
GET        /api/fighter			      Find All<br>
GET        /api/fighter/{id}			Find by id<br>
POST       /api/fighter			      Create<br>
PUT        /api/fighter/{id}			Update with id<br>
DELETE     /api/fighter/{id}			Delete by id</p><br>
<p>FIGHT<br>
Method			URL			        Action(JSON)<br><br>
GET        /api/fight			      Find All<br>
GET        /api/fight/{id}			Find by id<br>
POST       /api/fight			      Create<br>
PUT        /api/fight/{id}			Update with id<br>
DELETE     /api/fight/{id}			Delete by id</p><br>
<p>FIGHTER<br>
Method			URL			        Action(JSON)<br><br>
GET        /api/fighter			      Find All<br>
GET        /api/fighter/{id}			Find by id<br>
POST       /api/fighter			      Create<br>
PUT        /api/fighter/{id}			Update with id<br>
DELETE     /api/fighter/{id}			Delete by id</p><br>
<p>CATEGORY<br>
Method			URL			        Action(JSON)<br><br>
GET        /api/category			      Find All
</p><br>
</details> 


Access: users

![Screenshot from 2021-12-17 12-47-03](https://user-images.githubusercontent.com/90089220/146549135-8888091c-a08c-4b37-9be1-92085e53ae81.png)
![Screenshot from 2021-12-17 12-47-13](https://user-images.githubusercontent.com/90089220/146549137-8bcf3075-842b-4d39-ae31-bfc1f2406605.png)


Access: admins

![Screenshot from 2021-12-17 12-47-23](https://user-images.githubusercontent.com/90089220/146548654-3f687cab-5f9b-4558-bd5c-7fd294716172.png)
![Screenshot from 2021-12-17 12-47-52](https://user-images.githubusercontent.com/90089220/146548662-9a9c90ce-4207-4013-ac60-ad462b8d5b69.png)
![Screenshot from 2021-12-17 12-47-57](https://user-images.githubusercontent.com/90089220/146548665-bfa1f178-330c-44c0-acb2-3abc7be39b10.png)
![Screenshot from 2021-12-17 12-48-02](https://user-images.githubusercontent.com/90089220/146548667-5893cd42-f074-4f5f-8b50-5f4a8e6f0a84.png)


<small>Please add suggestions or contact me if you like my project</small>


