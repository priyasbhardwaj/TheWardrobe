-- reccomend a top that matches blue jeans -  red shirts go really well with jeans
select c.clothID,c.cloth_type,c.color,b.brand_name
from clothes c, user u, brand b
where c.cloth_type='t-shirt' and c.color='red' and c.top_size=u.bodyShape;

-- show all medium tops in color red size M
select c.cloth_type, b.brand_name, c.color, c.top_size
from clothes c join brand b on c.brandID=b.brandID
where c.color='blue' and c.top_size='M'
order by b.brand_name;

-- season top rated tops for winter season
select c.clothID, s.season_name, c.cloth_type as 'type', c.color
from clothes c join ratings r on c.clothID = r.clothID
join season s on s.clothID = c.clothID
where s.season_name = "winter" and r.rating>4 or c.cloth_type='sweater' or c.cloth_type='jacket' or c.cloth_type='coat' or c.cloth_type='scarf';

-- no. of users with size xs group by gender female
select count(userID), gender
from user
where bodyShape="XS" and gender="F";

-- average age of people who wear sweatpants
select round(avg(datediff(curdate(),dob))/365,0) as 'average age', u.gender
from user u join clothes c on c.userID=u.userID
where c.cloth_type="sweatpants"
group by gender
order by gender desc;

-- top rated brands
select brand_name
from brand b join clothes c on b.clothID=c.clothID
join ratings r on r.clothID=c.clothID
where rating > '4'
order by b.clothID;

-- store in 100km radius of client
select storeID
from store s
where s.distanceFromClient<100;

-- giveaway gift to 999th customer
select u.userID,u.firstName,u.lastName,u.email
from user u
where u.userID=999;

-- no. of articles by clothing season
select s.season_name, count(s.season_name) as 'count'
from season s
group by season_name;

-- dresses available
select c.clothID,cloth_type, b.brand_name
from clothes c, brand b
where b.brandID=c.brandID and c.cloth_type='dress';

-- parental approval
select u.userID,u.firstName,u.lastName,u.DOB as 'date of birth',u.email
from user u
where datediff(curdate(),dob)/365<16;
