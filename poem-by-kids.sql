---1--
select * 
from Grade;
--2--
select * 
from Emotion;

--3--
select Count(*)
from poem ;
--4--
select * 
from Author a
where a.id  <= 76
ORDER BY Name ASC;

---5--
select *  
from Author a
join Grade g on a.GradeId = g.Id;


select *
from Author;

--6--
select * 
from  Author a
JOIN Gender g on a.GenderId = g.Id;
---7--
select Count(*) WordCount
from Poem;
---8--
select * 
from poem p
ORDER BY CharCount;
--9--
select Count(*) as 'third grade'
from Author a 
JOIN Grade g on a.GradeId = g.Id
where g.Name = '3rd Grade'; --2344--

---10--
select Count(*) as 'first to third grade'
from Author a
JOIN Grade g on a.GradeId = g.Id
where g.Name <= '3rd grade';  --4404--

---11--
select Count(*) as ' no of poems written by 4th grade'
from  Poem p 
JOIN Author a on p.AuthorId = p .Id
JOIN grade g on  a.GradeId = a.Id
where g.Name = '4th grade';  ---8--

--12--
select Count(*) 'poems per Grade'
from Poem p 
JOIN Author a on p.AuthorId = p.Id
JOIN grade g on a.GradeId = g.Id
Group BY G.Name;

--13--
select count(*) 'Authors per Grade'
from Author a
JOIN grade g on a.GradeId = g.Id
GROUP BY  g.id ;

--14--
select  p.title,p.WordCount
from poem p
order by p.WordCount DESC;

--15--
select Top 3 count(*) 'author/poem',a.Name 
from poem p
JOIN Author a on p.AuthorId = a.Id
group by a.Name, a.id
order by [author/poem] desc;

--16--


select count(*) as 'Total count'
from PoemEmotion
where EmotionId = 3;

select count(*),  'no poem that have emotion of sadness'
from poem p
JOIN PoemEmotion pe on p.Id = pe.PoemId
JOIN Emotion e on pe.EmotionId = e.Id
where e.Name = 'sadness'   --14570--

--17--
select count(*) 'no poem with no emotion'
from PoemEmotion pe
right JOIN Poem p on pe.PoemId = p.Id
where EmotionId is null;


--18--
select count(*) 'emotins/poem'
from PoemEmotion 
group by EmotionId
order by  [emotins/poem];

--19--
select Top 1  G.name, count(poem.id) as 'count'
from Poem 
join Author a on poem.AuthorId = a.Id
join Grade g on g.id = a.GradeId
join PoemEmotion pe on pe.PoemId = Poem.Id
join Emotion e on pe.EmotionId = e.Id
where e.Name = 'joy'
group by g.Name
order by count(poem.id) desc;
