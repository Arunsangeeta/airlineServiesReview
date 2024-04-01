select * from airline_review;

select  review_date,  
 str_to_date(review_date, '%d/%m/%Y')
 from airline_review;
 
 update airline_review
 set review_date = str_to_date(review_date, '%d/%m/%Y');
 
 SELECT MAX(review_date)-MIN(Review_date) as total_year_data
  from airline_review;
  
  # reviewing 10 year airline services from 2016 to 2026
  
  select * from airline_review;

#which flight is mostly busy during 10 years which is verified as true
  
  
  
  SELECT airline, COUNT(year) AS most_busyflight
  from (SELECT airline, year from airline_review
  where verified !=  'FALSE') as true_value
  GROUP BY airline  
  ORDER BY most_busyflight desc
  ;
  #from above conclusion is qatar airway has most flights during 10 years, than turkish and than emirates
  

# which airline has most positive airline review
select * from airline_review;

select  airline, count(review_type) as Positive_review
from (SELECT airline, review_type from airline_review where review_type = 'Positive') as reviewCount
group by airline
order by Positive_review desc;
#Qatar airways as most positive review



select  airline, count(review_type) as Negative_review
from (SELECT airline, review_type from airline_review where review_type = 'Negative') as reviewCount
group by airline
order by Negative_review desc;
;
#turkish airline has most negative review


SELECT airline, COUNT(overall_rating) AS maxrating_count
  from (SELECT airline, overall_rating from airline_review
  where overall_rating >= 6) as maxvaluecount
  GROUP BY airline
  ORDER BY maxrating_count desc
 ;
 #qatar airway has maximum rating above 6
 
 SELECT airline, COUNT(overall_rating) AS lowrating_count
  from (SELECT airline, overall_rating from airline_review
  where overall_rating <=3) as lowvaluecount
  GROUP BY airline 
  order by  lowrating_count desc
 ;
# turkish airline has maximum ow rating

select * from airline_review;

select airline, 
case
when overall_rating >=8 then 'High_rating'
when overall_rating > 5 and overall_rating <8  then 'Medium_rating'
else 'low_rating'
end Rating_of_flight 
from airline_review;


#which class travel more

SELECT class, count(*)
from airline_review
GROUP BY class;
#Economy class travels more

select * from airline_review;
select type_of_traveller, count(*)
from airline_review
GROUP BY type_of_traveller;
#solo travellers travels more


#which class has most positive review given
 

SELECT class, COUNT(review_type) AS PositiveReview
  from (SELECT class, review_type from airline_review
  where review_type ='Positive') as PN
  GROUP BY class
 ;
 
 #which class people travel more in different airline
 SELECT * from airline_review;
 
 select airline, class, count(*) as class_typenumber
 from airline_review
 group by airline, class
 order by airline;
 
 select airline, type_of_traveller, count(*) as traveller_typenumber
 from airline_review
 group by airline, type_of_traveller
 order by airline;
 
 
#which airline has most good services?
SELECT * from airline_review;

SELECT airline, COUNT(seat_comfort) AS seatComfort
  from (SELECT airline, seat_comfort from airline_review
  where seat_comfort = 5 ) as PN
  GROUP BY airline
   order by seat_comfort desc
 ;
 SELECT airline, COUNT(staff_service) AS staff_service
  from (SELECT airline, staff_service from airline_review
  where staff_service = 5 ) as PN
  GROUP BY airline
   order by staff_service desc
 ;
 SELECT airline, COUNT(food) AS food
  from (SELECT airline, food from airline_review
  where food = 5 ) as PN
  GROUP BY airline
  order by food desc
 ;
 
 SELECT airline, COUNT(worth_money) AS worth_money
  from (SELECT airline, worth_money from airline_review
  where worth_money = 5 ) as PN
  GROUP BY airline
  order by worth_money desc;
 ;
 

#overall ratng for airline

select airline, count(*)
from airline_review
GROUP BY airline
order by airline
;
