--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

Select Count(*)
From film
Where length > (
Select AVG(length)
From film
)

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

Select Count(*)
From film
Where rental_rate = (
Select Max(rental_rate)
From film
)

--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

Select title
From film
Where rental_rate=(Select Min(rental_rate)
From film)
and
replacement_cost=(Select Min(replacement_cost)
From film)

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

Select *
From customer
Where customer_id= Any(
Select customer_id
From payment
Group by customer_id
Order By Count(customer_id) desc
Limit 5)
