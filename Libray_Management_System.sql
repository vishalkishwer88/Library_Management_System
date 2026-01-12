Create Database Library_Management_System
GO
use Library_Management_System
GO
Create TABLE Branch(
Branch_id int Primary Key,
Manager_id varchar(5),
Branch_Address varchar(100),
Contact_No Varchar(12)
)
GO
Create Table Employees(
Employee_id int identity(1,1),
Emp_Name varchar(25) NOT NULL,
Position Varchar(15),
Salary int Check (Salary > 0),
Branch_id  int
Primary Key (Employee_id),
Constraint  Fk_branch_id
Foreign Key (Branch_id) references Branch(Branch_id )
)
GO
Create Table Members(
Member_id Varchar(20) Primary Key,
MemberName varchar(50) NOT NULL,
MemberAddress Varchar(100) NOT NULL,
RegistrationDate  Date NOT NULL
)
GO
Create Table Books(
ISBN Varchar(20) Primary Key,
BookTitle Varchar(100) NOT NULL,
Category Varchar(20),
RentalPrice Float Check (RentalPrice >= 0),
Status Varchar(15),
Author Varchar(50),
Publisher Varchar(50)
)
GO
Create  Table Issued_Status(
Issued_Id int,
IssuedMemberId Varchar(20),
IssuedBookName Varchar(80),
IssuedDate Date,
IssuedBookISBN Varchar(20),
IssuedEmpID int,
Primary  KEY (Issued_Id),
Constraint fk_Issued_Member Foreign Key (IssuedMemberId) References Members(Member_id),
Constraint fk_Issued_Book Foreign Key (IssuedBookISBN) References Books(ISBN),
Constraint fk_Issued_Employee Foreign Key (IssuedEmpID) References Employees(Employee_id),
)
GO
Create Table Return_Status(
Return_ID varchar(10) Primary Key,
Issued_ID int,
ReturnBookName Varchar(100),
ReturnDate Date,
ReturnBook_ISBN varchar(20)
Constraint fk_Return_Issued Foreign Key (Issued_ID) References Issued_Status(Issued_Id),
Constraint fk_Return_Books Foreign Key (ReturnBook_ISBN) References Books(ISBN),
)
GO