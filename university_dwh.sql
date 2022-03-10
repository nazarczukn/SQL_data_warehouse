CREATE TABLE "Course" (
"course_ID" int NOT NULL,
"course_name" nvarchar(40) NOT NULL,
"department_name" nvarchar(40) NOT NULL,
"type" nvarchar(40) NOT NULL,
 PRIMARY KEY ("course_ID")
 )

 CREATE TABLE "Teacher" (
"teacher_ID" int NOT NULL,
"department_name" nvarchar(40) NOT NULL, 
"name" nvarchar(40) NOT NULL,
"surname" nvarchar(40) NOT NULL,
"address" nvarchar(40) NOT NULL, 
"phone" int NOT NULL,
"email" nvarchar(40) NOT NULL,
 PRIMARY KEY ("teacher_ID")
 )

CREATE TABLE "Student" (
"student_ID" int NOT NULL,
"department_name" nvarchar(40) NOT NULL,
"name" nvarchar(40) NOT NULL,
"surname" nvarchar(40) NOT NULL,
"address" nvarchar(40) NOT NULL, 
"phone" int NOT NULL,
"email" nvarchar(40) NOT NULL,
 PRIMARY KEY("student_ID")
)

CREATE TABLE "Transcript_fact" (
"student_ID" int NOT NULL,
"course_ID" int NOT NULL, 
"year" int NOT NULL,
"grade" int NOT NULL, 
"teacher_ID" int NOT NULL,
PRIMARY KEY ("student_ID", "course_ID"),
FOREIGN KEY ("course_ID") references "Course"("course_ID"),
FOREIGN KEY ("student_ID") references "Student"("student_ID"),
FOREIGN KEY ("teacher_ID") references "Teacher"("teacher_ID")
)

insert into Course select c.course_ID, c.course_name, d."name", c."type" 
from University.dbo.Course c join University.dbo.Department d on c.department_ID=d.department_ID;

insert into Teacher select t.teacher_ID, d."name", t."name", t.surname, t."address", t.phone, t.email
from University.dbo.Teacher t join University.dbo.Department d on t.department_ID=d.department_ID

insert into Student select s.student_ID, d."name", s."name", s.surname, s."address", s.phone, s.email
from University.dbo.Student s join University.dbo.Department d on s.department_ID=d.department_ID


insert into Transcript_fact select th.student_ID, cl.course_ID, cl."year", th.grade, h.teacher_ID
from University.dbo.Taken_History th 
join University.dbo.Class cl on cl.class_ID=th.class_ID
join University.dbo.Teach_History h on h.class_ID=cl.class_ID

