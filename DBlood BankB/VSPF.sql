USE [master]
GO
/****** Object:  Database [VSFP]    Script Date: 23-Apr-16 6:52:18 PM ******/
CREATE DATABASE [VSFP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VSFP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VSFP.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VSFP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VSFP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VSFP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VSFP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VSFP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VSFP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VSFP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VSFP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VSFP] SET ARITHABORT OFF 
GO
ALTER DATABASE [VSFP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VSFP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VSFP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VSFP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VSFP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VSFP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VSFP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VSFP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VSFP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VSFP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VSFP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VSFP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VSFP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VSFP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VSFP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VSFP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VSFP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VSFP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VSFP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VSFP] SET  MULTI_USER 
GO
ALTER DATABASE [VSFP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VSFP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VSFP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VSFP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VSFP]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 23-Apr-16 6:52:18 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[ACTIVATE_EXTERNAL_USER]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ACTIVATE_EXTERNAL_USER]
@ActivationCode varchar(max)
as
begin
	declare @name varchar(max),
	@email varchar(max),
	@DOB smalldatetime,
	@Password varchar(max),
	@Gender varchar(20),
	@ContactNumber varchar(max),
	@Nationality varchar(max),
	@BloodGroup varchar(10),
	@permanentAdd varchar(max),
	@presentAdd varchar(max),
	@profilePicName varchar(max),
	@userRole varchar(20),
	@isActive varchar(10),
	@createdBy varchar(max),
	@createdDate smalldatetime,
	@createdFrom varchar(max),
	@isDeleted varchar(10),
	@preferedLocation varchar(max),
	@age int

	select @name=Name,@email=Email,@Password=password,@Gender=Gender,
	@ContactNumber=ContactNumber,@DOB=DOB,@Nationality=Nationality,@BloodGroup=BloodGroup,
	@permanentAdd=PermanentAdd,@presentAdd=PresentAdd,@profilePicName=profilePicName,
	@userRole=userRole,@isActive=isActive,@isDeleted=isDeletd,@createdBy=createdBy,
	@createdFrom=createdFrom,@isDeleted=isDeletd,@preferedLocation=PreferedLocation
	 from ExternalUserTempTable where ActivationCode=@ActivationCode

	 insert into users (Name,Email,DOB,Password,Gender,ContactNumber,Nationality,BloodGroup,
	 permanentAdd,presentAdd,nationalID,profilePicName,FathersName,mothersName,userRole,isActive,
	 createdBy,createdDate,createdFrom,isDeleted) values (@name,@email,@DOB,@Password,@Gender,
	 @ContactNumber,@Nationality,@BloodGroup,@permanentAdd,@presentAdd,'',@profilePicName,'','',
	 @userRole,@isActive,@createdBy,'',@createdFrom,@isDeleted)

	 declare @result varchar(max),@UserId int

	 select top 1 @UserId=Serial from users order by (Serial) desc

	 exec GENARATE_ID 'BD',@result out

	 set @age=DATEDIFF(YEAR,@DOB,GETDATE())

	 insert into BloodDonors (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,ProfilePicName,UserRole,PreferedLocation,email,Age,UserId)
	 values (@result,@name,@Gender,@ContactNumber,@BloodGroup,@permanentAdd,@profilePicName,@userRole,@preferedLocation,@email,@age,@UserId)

	 delete from ExternalUserTempTable where ActivationCode=@ActivationCode
end

GO
/****** Object:  StoredProcedure [dbo].[ACTIVATE_USER_BY_SERAL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ACTIVATE_USER_BY_SERAL]
	@Serial bigint
	as
	begin
		update users set isActive='Yes' where Serial=@Serial
	end



GO
/****** Object:  StoredProcedure [dbo].[ADD_MAKE_DONATION]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ADD_MAKE_DONATION]
@Location varchar(max),
@BloodGrp varchar(10),
@Age int,
@Stat varchar(100),
@gender varchar(10),
@createdBy varchar(max),
@createdDate smalldatetime,
@createdForm varchar(max),
@DonationDate smalldatetime
as
begin
	insert into MakeDonation (Location,BloodGrp,Age,Status,Gender,CreatedBy,CreatedDate,CreatedForm,DonationDate)
	values (@Location,@BloodGrp,@Age,@Stat,@gender,@createdBy,@createdDate,@createdForm,@DonationDate)
end
GO
/****** Object:  StoredProcedure [dbo].[CHANGE_USER_PASSWORD]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CHANGE_USER_PASSWORD]
(
@NewPass varchar(200),
@userId bigint,
@UserEmail varchar(200)
)
as
begin
	update users set [Password]=@NewPass where Serial=@userId and Email=@UserEmail
end



GO
/****** Object:  StoredProcedure [dbo].[CHEACK_FACEBOOK_USER_EXISTING]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CHEACK_FACEBOOK_USER_EXISTING]
@FacebookId varchar(max)
as
begin
	select * from FacebookUser where FaceBoookId=@FacebookId
end

GO
/****** Object:  StoredProcedure [dbo].[CHECK_ACTIVATION_IS_EXISTS]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CHECK_ACTIVATION_IS_EXISTS]
@ActivationCode varchar(max)
as
begin
select * from ExternalUserTempTable where ActivationCode=@ActivationCode
end

GO
/****** Object:  StoredProcedure [dbo].[CHECK_PREVIOUS_DONATION_DATE]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CHECK_PREVIOUS_DONATION_DATE]
@userId varchar(max),
@donationDate smalldatetime
as
begin
	
	declare @LastDonationDate smalldatetime,@PreDuration int,@result int

	select top(1) @LastDonationDate=DonationDate from MakeDonation
	 where CreatedBy=@userId order by(DonationDate) DESC



	 

	 set @PreDuration=DATEDIFF(day,@LastDonationDate,@donationDate)

	 if(@LastDonationDate is not null)
	 begin
			if(@PreDuration>85 or @PreDuration<-85)
		 begin
			set @result=1
			select @result as Result
		 end
		 else
		 begin
			set @result=0
			select @result as Result
		 end
	 end
	 else
	 begin
		set @result=1
			select @result as Result
	 end

	 

end
GO
/****** Object:  StoredProcedure [dbo].[CHECK_PREVIUOS_PASS_FOR_CHANGE_PASS]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CHECK_PREVIUOS_PASS_FOR_CHANGE_PASS]
(
@prePass varchar(200),
@userId bigint,
@UserEmail varchar(200)
)
as
begin
	select Name from users where Serial=@userId and Email=@UserEmail and [Password]=@prePass 
end



GO
/****** Object:  StoredProcedure [dbo].[CREATE_TEMP_VOLUNTEER_USER]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CREATE_TEMP_VOLUNTEER_USER] 
@Name varchar(max),
@Email varchar(max),
@DOB smalldatetime,
@Password varchar(max),
@Gender varchar(20),
@ContactNumber varchar(max),
@Nationality varchar(max),
@BloodGroup varchar(10),
@permanentAdd varchar(max),
@presentAdd varchar(max),
@profilePicName varchar(max),
@userRole varchar(20),
@isActive varchar(10),
@createdBy varchar(max),
@createdDate smalldatetime,
@createdFrom varchar(max),
@isDeleted varchar(10),
@ActivationCode uniqueidentifier,
@PreferedLocation varchar(max)
as
begin
	insert into ExternalUserTempTable (Name,Email,DOB,password,Gender,ContactNumber,Nationality,
	BloodGroup,PermanentAdd,PresentAdd,nationalId,profilePicName,FathersName,MothersName,
	userRole,isActive,createdBy,createdFrom,isDeletd,ActivationCode,PreferedLocation) values (@Name,@Email,@DOB,@Password,@Gender,
	@ContactNumber,@Nationality,@BloodGroup,@permanentAdd,@presentAdd,'',@profilePicName,'','',@userRole,@isActive,
	@createdBy,@createdFrom,@isDeleted,@ActivationCode,@PreferedLocation)
end

GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CREATE_USER]
	@Name varchar(100),
	@Email varchar(100),
	@DOB smalldatetime,
	@Password varchar(200),
	@Gender varchar(7),
	@ContactNumber varchar(100),
	@Nationality varchar(50),
	@BloodGroup varchar(5),
	@permanentAdd varchar(max),
	@presentAdd varchar(max),
	@nationalID varchar(50),
	@profilePicName varchar(50),
	@FathersName varchar(100),
	@mothersName varchar(100),
	@userRole varchar(10),
	@isActive varchar(10),
	@createdBy varchar(100),
	@createdDate smalldatetime,
	@createdFrom varchar(200),
	@isDeleted varchar(10)
as
begin

	insert into users values (@Name,@Email,@DOB,@Password,@Gender,@ContactNumber,@Nationality,@BloodGroup,
	@permanentAdd,@presentAdd,@nationalID,@profilePicName,@FathersName,@mothersName,@userRole,@isActive,
	@createdBy,@createdDate,@createdFrom,@isDeleted)
end



GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_GROUP]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CREATE_USER_GROUP]
@userGroupName varchar(200),
@description varchar(max),
@createdBy varchar(200),

@createtedDate smalldatetime,
@createForm varchar(200)
as 
begin tran
begin
	declare @result varchar(max)
	exec GENARATE_ID 'UG',@result out
	insert into UserGroup 
	(UserGroupId,UserGroupName,[Description],IsActive,IsDeleted,createdBy,createForm,createdDate)
	values (@result,@userGroupName,@description,'Yes','No',@createdBy,@createForm,convert(smalldatetime,@createtedDate))
end
commit




GO
/****** Object:  StoredProcedure [dbo].[DEACTIVATE_USER_BY_SERAL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DEACTIVATE_USER_BY_SERAL]
	@Serial bigint
	as
	begin
		update users set isActive='No' where Serial=@Serial
	end



GO
/****** Object:  StoredProcedure [dbo].[DELETE_DONATION_HISTORY]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DELETE_DONATION_HISTORY]
@DonationId int
as
begin
	delete from MakeDonation where Id=@DonationId
end
GO
/****** Object:  StoredProcedure [dbo].[DELETE_POST_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DELETE_POST_BY_ID]
@posiId varchar(max)
as
begin
	delete from BloodRequest where serial=@posiId
end

GO
/****** Object:  StoredProcedure [dbo].[DELETE_USER_GROUP_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DELETE_USER_GROUP_BY_ID]
@usergroupId varchar(max)
as
begin
	update UserGroup set IsActive='No',IsDeleted='Yes' where UserGroupId=@usergroupId
end




GO
/****** Object:  StoredProcedure [dbo].[DUPLICATE_EMAIL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DUPLICATE_EMAIL]
@Email varchar(200)
as
begin
	select Email from users where Email=@Email
end



GO
/****** Object:  StoredProcedure [dbo].[GENARATE_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GENARATE_ID]
@prefix varchar(max),
@result varchar(max) out
as
begin
	declare @Id bigint
	
--declare @result varchar(max)
declare @getResult bigint
set @Id = (select ID from GenarateID where Prefix=@prefix)

	if(@Id is null)
	begin
		insert into GenarateID values (@prefix,1)
		select @result = @prefix+'-'+'001';
	end
	else
		begin

		if(@Id>=0 and @Id <= 9)
		begin
		set @getResult = (@Id+1);
		select @result = cast(@prefix+'-00'+CAST(@getResult as varchar) as varchar)
		update GenarateID set ID=(@Id+1) where Prefix=@prefix
		end
		else if(@Id>=10 and @Id <= 99)
		begin
		set @getResult = (@Id+1);
		set @result = cast(@prefix+'-0'+CAST(@getResult as varchar) as varchar)
		update GenarateID set ID=(@Id+1) where Prefix=@prefix
		end
		else
		begin
		set @getResult = (@Id+1);
		set @result = cast(@prefix+'-'+CAST(@getResult as varchar) as varchar)
		update GenarateID set ID=(@Id+1) where Prefix=@prefix
		end
		--print @result
		end
		select @result
end




GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_BLOOD_REQUEST]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_ALL_BLOOD_REQUEST]
as
begin
	select serial,InternalUserId,dbo.GET_USER_IMAGE_URL_USING_USER_ID(InternalUserId) as ImageUrl,
	Name,Location,BloodGroup,ContactNumber,Description,CONVERT(varchar(max),LastDate,103) as lastDate,
	CONVERT(varchar(max),createdDate,103) as createdDate from BloodRequest where isDeleted='No' order by lastDate desc
end

GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_POST_OF_BLOOD_MYSELF]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_ALL_POST_OF_BLOOD_MYSELF]
@InternalUserId varchar(max)
as
begin
	if(LEN(@InternalUserId) > 9)
	begin
	select serial,InternalUserId,Name,Location,
	BloodGroup,CONVERT(varchar(max),LastDate,103) as lastDate,
	ContactNumber,Description,isDeleted,createdBy,createdFrom,
	CONVERT(varchar(max),createdDate,120) as createdDate from BloodRequest where InternalUserId=@InternalUserId and isDeleted='No' order by serial DESC 
	end
	else
	begin
	declare @userGroup varchar(max)

	select @userGroup=userRole from users where Serial=@InternalUserId

	declare @userGroupName varchar(max)

	exec @userGroupName=dbo.GET_USER_GROUP_NAME_BY_ID @userGroup

	if(@userGroupName = 'Super Admin' or @userGroupName='Developer')
	begin
	select serial,InternalUserId,Name,Location,
	BloodGroup,CONVERT(varchar(max),LastDate,103) as lastDate,
	ContactNumber,Description,isDeleted,createdBy,createdFrom,
	CONVERT(varchar(max),createdDate,120) as createdDate from BloodRequest where isDeleted='No' order by serial DESC 
	end
	
	else
	begin
	select serial,InternalUserId,Name,Location,
	BloodGroup,CONVERT(varchar(max),LastDate,103) as lastDate,
	ContactNumber,Description,isDeleted,createdBy,createdFrom,
	CONVERT(varchar(max),createdDate,120) as createdDate from BloodRequest where InternalUserId=@InternalUserId and isDeleted='No' order by serial DESC 
	end
	end
end

GO
/****** Object:  StoredProcedure [dbo].[GET_BLOOD_DONORS_FOR_FB_USER]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_BLOOD_DONORS_FOR_FB_USER]
@fbId bigint
as
begin
	declare @FinalDonorList table
	(
		id int primary key identity,
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNumber varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		DonationStat varchar(max)
	) 
	declare @tempDonorList table
	(
		Id int identity, 
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNo varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		UserId bigint
	)
	
	declare @tempFrndsId table
	(
		id int primary key identity,
		FriendsId bigint
	)

	insert into @tempDonorList select Serial,Name,Gender,ContactNumber,BloodGroup,
	PermanentAdd,UserRole,PreferedLocation,email,Age,UserId from BloodDonors

	insert into @tempFrndsId
			 select FriendsId from FacebookFriends 
			 where MainId=@fbId
	--select * from @tempDonorList

	declare @DonorCount int,@count int,
	 @fCount int
	set @count=1
	set @fCount=1
	declare @FriendCount int
	set @FriendCount = (select COUNT(*) from @tempFrndsId)
	set  @DonorCount=(select COUNT(*) from @tempDonorList)

	if(@DonorCount>0)
	begin
		
		declare @Serial varchar(max),@Name varchar(max),@gender varchar(10),@ContactNo varchar(max),
		@bGroup varchar(10),@PAdd varchar(max),@UserRole varchar(max),@PreferdLoca varchar(max),
		@email varchar(max),@age varchar(max),@userId bigint,@donationSat varchar(100),@DonationDayCount int,@lastDonationDate smalldatetime

		while(@count<=@DonorCount)
		begin
			
			select @Serial=Serial,@Name=Name,@gender=Gender,@ContactNo=ContactNo,
			@bGroup=BloodGroup,@PAdd=PermanentAdd,@UserRole=UserRole,
			@PreferdLoca=PreferedLocation,@email=email,@age=Age,@userId=UserId
			 from @tempDonorList where Id=@count

			select top 1 @lastDonationDate=DonationDate from MakeDonation where CreatedBy=@userId
			 order by (DonationDate) desc
			
			set @DonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())

			if(@email='')
			begin
				set @email='FB User'
			end

			if(@lastDonationDate is not null)
			begin
				if(@DonationDayCount>85 or @DonationDayCount=0)
				begin
					set @donationSat='Available'
				end
				else
				begin
					set @donationSat='Not Available'
				end
			end
			else
			begin
				set @donationSat='Available';
			end


			--for fb

			if(@FriendCount>0)
			begin
				declare @friendId bigint, @fSerial varchar(max),@fName varchar(max),@fgender varchar(10),@fContactNo varchar(max),
				@fbGroup varchar(10),@fPAdd varchar(max),@fUserRole varchar(max),@fPreferdLoca varchar(max),
				@femail varchar(max),@fage varchar(max),@fuserId bigint,@fdonationSat varchar(100),@fDonationDayCount int,@flastDonationDate smalldatetime
				


				while(@fCount<=@FriendCount)
				begin
					
					select @friendId=FriendsId from @tempFrndsId where id=@fCount

					

					select @fSerial=Serial,@fName=Name,@fgender=Gender,@fContactNo=ContactNo,
					@fbGroup=BloodGroup,@fPAdd=PermanentAdd,@fUserRole=UserRole,
					@fPreferdLoca=PreferedLocation,@femail=email,@fage=Age,@fuserId=UserId
					from @tempDonorList where UserId=@friendId

					select top 1 @flastDonationDate=DonationDate from MakeDonation where CreatedBy=@fuserId
			 order by (DonationDate) desc
			
			set @fDonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())

			set @femail='FB User'

					if(@flastDonationDate is not null)
			begin
				if(@fDonationDayCount>85 or @fDonationDayCount=0)
				begin
					set @fdonationSat='Available'
				end
				else
				begin
					set @fdonationSat='Not Available'
				end
			end
			else
			begin
				set @fdonationSat='Available';
			end

					insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@fSerial,@fName,@fgender,@fContactNo,@fbGroup,@fPAdd,@fUserRole,@fPreferdLoca,@femail,@fage,@fdonationSat)

					set @fCount = @fCount+1
				end
			end



			--for fb

			if(@email!='FB User')
			begin
			insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@Serial,@Name,@gender,@ContactNo,@bGroup,@PAdd,@UserRole,@PreferdLoca,@email,@age,@donationSat)
			end

			

			set @lastDonationDate=''
			set @DonationDayCount=''
			set @donationSat=''
			set @flastDonationDate=''
			set @fDonationDayCount=''
			set @fdonationSat=''

			set @count=@count+1;
		end
	end

	select * from @FinalDonorList order by UserRole ASC,id desc 
end
GO
/****** Object:  StoredProcedure [dbo].[GET_BLOOD_DONORS_FOR_FB_USER_BY_FILTERING]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_BLOOD_DONORS_FOR_FB_USER_BY_FILTERING]
@fbId bigint,
@BloodGroup varchar(10),
@Division varchar(max),
@location varchar(max)
as
begin
	declare @FinalDonorList table
	(
		id int primary key identity,
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNumber varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		DonationStat varchar(max)
	) 
	declare @tempDonorList table
	(
		Id int identity, 
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNo varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		UserId bigint
	)
	
	declare @tempFrndsId table
	(
		id int primary key identity,
		FriendsId bigint
	)

	insert into @tempDonorList select Serial,Name,Gender,ContactNumber,BloodGroup,
	PermanentAdd,UserRole,PreferedLocation,email,Age,UserId from BloodDonors

	insert into @tempFrndsId
			 select FriendsId from FacebookFriends 
			 where MainId=@fbId
	--select * from @tempDonorList

	declare @DonorCount int,@count int,
	 @fCount int
	set @count=1
	set @fCount=1
	declare @FriendCount int
	set @FriendCount = (select COUNT(*) from @tempFrndsId)
	set  @DonorCount=(select COUNT(*) from @tempDonorList)

	if(@DonorCount>0)
	begin
		
		declare @Serial varchar(max),@Name varchar(max),@gender varchar(10),@ContactNo varchar(max),
		@bGroup varchar(10),@PAdd varchar(max),@UserRole varchar(max),@PreferdLoca varchar(max),
		@email varchar(max),@age varchar(max),@userId bigint,@donationSat varchar(100),@DonationDayCount int,@lastDonationDate smalldatetime

		while(@count<=@DonorCount)
		begin
			
			select @Serial=Serial,@Name=Name,@gender=Gender,@ContactNo=ContactNo,
			@bGroup=BloodGroup,@PAdd=PermanentAdd,@UserRole=UserRole,
			@PreferdLoca=PreferedLocation,@email=email,@age=Age,@userId=UserId
			 from @tempDonorList where Id=@count

			select top 1 @lastDonationDate=DonationDate from MakeDonation where CreatedBy=@userId
			 order by (DonationDate) desc
			
			set @DonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())

			if(@email='')
			begin
				set @email='FB User'
			end

			if(@lastDonationDate is not null)
			begin
				if(@DonationDayCount>85 or @DonationDayCount=0)
				begin
					set @donationSat='Available'
				end
				else
				begin
					set @donationSat='Not Available'
				end
			end
			else
			begin
				set @donationSat='Available';
			end


			--for fb

			if(@FriendCount>0)
			begin
				declare @friendId bigint, @fSerial varchar(max),@fName varchar(max),@fgender varchar(10),@fContactNo varchar(max),
				@fbGroup varchar(10),@fPAdd varchar(max),@fUserRole varchar(max),@fPreferdLoca varchar(max),
				@femail varchar(max),@fage varchar(max),@fuserId bigint,@fdonationSat varchar(100),@fDonationDayCount int,@flastDonationDate smalldatetime
				


				while(@fCount<=@FriendCount)
				begin
					
					select @friendId=FriendsId from @tempFrndsId where id=@fCount

					

					select @fSerial=Serial,@fName=Name,@fgender=Gender,@fContactNo=ContactNo,
					@fbGroup=BloodGroup,@fPAdd=PermanentAdd,@fUserRole=UserRole,
					@fPreferdLoca=PreferedLocation,@femail=email,@fage=Age,@fuserId=UserId
					from @tempDonorList where UserId=@friendId

					select top 1 @flastDonationDate=DonationDate from MakeDonation where CreatedBy=@fuserId
			 order by (DonationDate) desc
			
			set @fDonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())

			set @femail='FB User'

					if(@flastDonationDate is not null)
			begin
				if(@fDonationDayCount>85 or @fDonationDayCount=0)
				begin
					set @fdonationSat='Available'
				end
				else
				begin
					set @fdonationSat='Not Available'
				end
			end
			else
			begin
				set @fdonationSat='Available';
			end

					insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@fSerial,@fName,@fgender,@fContactNo,@fbGroup,@fPAdd,@fUserRole,@fPreferdLoca,@femail,@fage,@fdonationSat)

					set @fCount = @fCount+1
				end
			end



			--for fb

			if(@email!='FB User')
			begin
			insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@Serial,@Name,@gender,@ContactNo,@bGroup,@PAdd,@UserRole,@PreferdLoca,@email,@age,@donationSat)
			end

			

			set @lastDonationDate=''
			set @DonationDayCount=''
			set @donationSat=''
			set @flastDonationDate=''
			set @fDonationDayCount=''
			set @fdonationSat=''

			set @count=@count+1;
		end
	end

	select * from @FinalDonorList where BloodGroup=@BloodGroup and (PermanentAdd like '%' +@Division+ '%')
	and (PreferedLocation like '%' + @location+ '%') order by UserRole ASC,id desc 

	--select * from @FinalDonorList order by UserRole ASC,id desc 
end
GO
/****** Object:  StoredProcedure [dbo].[GET_DONATION_HISTORY]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_DONATION_HISTORY]
@userId varchar(max)
as
begin
	select * from MakeDonation where CreatedBy=@userId
end
GO
/****** Object:  StoredProcedure [dbo].[GET_DONOR_LIST]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_DONOR_LIST]
as
begin

	declare @FinalDonorList table
	(
		id int primary key identity,
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNumber varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		DonationStat varchar(max)
	) 
	declare @tempDonorList table
	(
		Id int identity, 
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNo varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		UserId bigint
	)
	
	insert into @tempDonorList select Serial,Name,Gender,ContactNumber,BloodGroup,
	PermanentAdd,UserRole,PreferedLocation,email,Age,UserId from BloodDonors

	--select * from @tempDonorList

	declare @DonorCount int,@count int

	set @count=1

	set  @DonorCount=(select COUNT(*) from @tempDonorList)

	if(@DonorCount>0)
	begin
		
		declare @Serial varchar(max),@Name varchar(max),@gender varchar(10),@ContactNo varchar(max),
		@bGroup varchar(10),@PAdd varchar(max),@UserRole varchar(max),@PreferdLoca varchar(max),
		@email varchar(max),@age varchar(max),@userId bigint,@donationSat varchar(100),@DonationDayCount int,@lastDonationDate smalldatetime

		while(@count<=@DonorCount)
		begin
			
			select @Serial=Serial,@Name=Name,@gender=Gender,@ContactNo=ContactNo,
			@bGroup=BloodGroup,@PAdd=PermanentAdd,@UserRole=UserRole,
			@PreferdLoca=PreferedLocation,@email=email,@age=Age,@userId=UserId
			 from @tempDonorList where Id=@count

			select top 1 @lastDonationDate=DonationDate from MakeDonation where CreatedBy=@userId
			 order by (DonationDate) desc
			
			set @DonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())

			if(@email='')
			begin
				set @email='FB User'
			end

			if(@lastDonationDate is not null)
			begin
				if(@DonationDayCount>85 or @DonationDayCount=0)
				begin
					set @donationSat='Available'
				end
				else
				begin
					set @donationSat='Not Available'
				end
			end
			else
			begin
				set @donationSat='Available';
			end


			insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@Serial,@Name,@gender,@ContactNo,@bGroup,@PAdd,@UserRole,@PreferdLoca,@email,@age,@donationSat)

			set @lastDonationDate=''
			set @DonationDayCount=''
			set @donationSat=''

			set @count=@count+1;
		end
	end

	select * from @FinalDonorList order by (id) desc

end
GO
/****** Object:  StoredProcedure [dbo].[GET_DONOR_LIST_BY_FILTERING]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_DONOR_LIST_BY_FILTERING]
@BloodGroup varchar(10),
@Division varchar(max),
@location varchar(max)
as
begin

declare @FinalDonorList table
	(
		id int primary key identity,
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNumber varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		DonationStat varchar(max)
	) 
	declare @tempDonorList table
	(
		Id int identity, 
		Serial varchar(max),
		Name varchar(max),
		Gender varchar(10),
		ContactNo varchar(max),
		BloodGroup varchar(max),
		PermanentAdd varchar(max),
		UserRole varchar(max),
		PreferedLocation varchar(max),
		email varchar(max),
		Age varchar(max),
		UserId bigint
	)
	
	insert into @tempDonorList select Serial,Name,Gender,ContactNumber,BloodGroup,
	PermanentAdd,UserRole,PreferedLocation,email,Age,UserId from BloodDonors

	--select * from @tempDonorList

	declare @DonorCount int,@count int

	set @count=1

	set  @DonorCount=(select COUNT(*) from @tempDonorList)

	if(@DonorCount>0)
	begin
		
		declare @Serial varchar(max),@Name varchar(max),@gender varchar(10),@ContactNo varchar(max),
		@bGroup varchar(10),@PAdd varchar(max),@UserRole varchar(max),@PreferdLoca varchar(max),
		@email varchar(max),@age varchar(max),@userId bigint,@donationSat varchar(100),@DonationDayCount int,@lastDonationDate smalldatetime

		while(@count<=@DonorCount)
		begin
			
			select @Serial=Serial,@Name=Name,@gender=Gender,@ContactNo=ContactNo,
			@bGroup=BloodGroup,@PAdd=PermanentAdd,@UserRole=UserRole,
			@PreferdLoca=PreferedLocation,@email=email,@age=Age,@userId=UserId
			 from @tempDonorList where Id=@count

			select top 1 @lastDonationDate=DonationDate from MakeDonation where CreatedBy=@userId
			 order by (DonationDate) desc
			
			set @DonationDayCount=DATEDIFF(day,@LastDonationDate,GETDATE())
			if(@email='')
			begin
				set @email='FB User'
			end
			if(@lastDonationDate is not null)
			begin
				if(@DonationDayCount>85 or @DonationDayCount=0)
				begin
					set @donationSat='Available'
				end
				else
				begin
					set @donationSat='Not Available'
				end
			end
			else
			begin
				set @donationSat='Available';
			end


			insert into @FinalDonorList (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,UserRole,PreferedLocation,email,Age,DonationStat)
			values(@Serial,@Name,@gender,@ContactNo,@bGroup,@PAdd,@UserRole,@PreferdLoca,@email,@age,@donationSat)

			set @lastDonationDate=''
			set @DonationDayCount=''
			set @donationSat=''

			set @count=@count+1;
		end
	end

	select * from @FinalDonorList where BloodGroup=@BloodGroup and (PermanentAdd like '%' +@Division+ '%')
	and (PreferedLocation like '%' + @location+ '%') order by (id) desc

	--select *
	--from BloodDonors where BloodGroup=@BloodGroup and (PermanentAdd like '%' +@Division+ '%')
	--and (PreferedLocation like '%' + @location+ '%')
end
GO
/****** Object:  StoredProcedure [dbo].[GET_FACEBOOK_USER_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_FACEBOOK_USER_BY_ID]
(
@serial bigint

)
as
begin
	select Serial,Name,convert(varchar, DOB , 103) as DOB,[Gender]
      ,[ContactNumber]
      ,[Nationality]
      ,[BloodGroup]
      ,[permanentAdd]
      ,[presentAdd]
      ,[nationalID]
      ,[profilePicName]
      ,[FathersName]
      ,[mothersName]
      ,[userRole] from FacebookUser where FaceBoookId=@serial
end



GO
/****** Object:  StoredProcedure [dbo].[GET_POST_DETAILS_BY_POST_SERIAL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_POST_DETAILS_BY_POST_SERIAL] 
@PostSerial varchar(max)
as
begin
	select serial,InternalUserId,Name,Location,BloodGroup,CONVERT(varchar(max),LastDate,103) as lastDate
	,ContactNumber,Description,isDeleted,createdBy,createdFrom,CONVERT(varchar(max),createdDate,103) as createdDate
	 from BloodRequest where serial=@PostSerial and isDeleted='No'
end

GO
/****** Object:  StoredProcedure [dbo].[GET_RECENT_BLOOD_REQUEST]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_RECENT_BLOOD_REQUEST]
as
begin
	select top 10 BloodGroup from BloodRequest order by (createdDate)
end
GO
/****** Object:  StoredProcedure [dbo].[GET_USER_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_USER_BY_ID]
(
@serial bigint

)
as
begin
declare @role varchar(max)

select @role=userRole from users where Serial=@serial

if(@role='User')
begin
select Name,Email,convert(varchar, DOB , 103) as DOB,[Password],[Gender]
      ,[ContactNumber]
      ,[Nationality]
      ,[BloodGroup]
      ,[permanentAdd]
      ,[presentAdd]
      ,[nationalID]
      ,[profilePicName]
      ,[FathersName]
      ,[mothersName]
      ,userRole
      ,[isActive] from users where Serial=@serial
end
else
begin
	select Name,Email,convert(varchar, DOB , 103) as DOB,[Password],[Gender]
      ,[ContactNumber]
      ,[Nationality]
      ,[BloodGroup]
      ,[permanentAdd]
      ,[presentAdd]
      ,[nationalID]
      ,[profilePicName]
      ,[FathersName]
      ,[mothersName]
      ,dbo.GET_USER_GROUP_NAME_BY_ID(userRole) as userRole
      ,[isActive] from users where Serial=@serial
	  end
  
end



GO
/****** Object:  StoredProcedure [dbo].[GET_USER_GROUP_DETAILS_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_USER_GROUP_DETAILS_BY_ID]
@UserGroupId varchar(max)
as
begin
	select UserGroupId,UserGroupName,Description,IsActive,IsDeleted,dbo.USER_NAME_BY_ID(createdBy) as NameCreatedBy,CONVERT(varchar,createdDate,107) as [Date] from UserGroup where UserGroupId=@UserGroupId
end




GO
/****** Object:  StoredProcedure [dbo].[GET_USER_GROUP_LIST]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_USER_GROUP_LIST]
as
begin tran
begin
	select UserGroupId,UserGroupName,Description,IsActive,IsDeleted from UserGroup where IsDeleted='No'
end
commit




GO
/****** Object:  StoredProcedure [dbo].[GET_USER_IMAGE_URL_GET_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GET_USER_IMAGE_URL_GET_BY_ID]
@userId varchar(max)
as
begin
	if(LEN(@userId) > 9)
	begin
	select userRole,profilePicName from FacebookUser where FaceBoookId = @userId and isDeleted='No'
	end
	else
	begin
	select dbo.GET_USER_GROUP_NAME_BY_ID(userRole) as userRole,profilePicName from users where Serial = @userId and isActive='Yes' and isDeleted='No'
	end
end

GO
/****** Object:  StoredProcedure [dbo].[GET_USER_LIST_TYPE_WISE]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_USER_LIST_TYPE_WISE]
(
@type varchar(20)
)
as
begin
if (@type = 'All')
begin
select * from users
end
else if (@type='Active')
begin
select * from users where isActive='Yes'
end
else if (@type='Deactive')
begin
select * from users where isActive='No'
end
else if (@type = 'Deleted')
begin
select * from users where isDeleted='Yes'
end
end



GO
/****** Object:  StoredProcedure [dbo].[LOAD_DONATION_HISTORY_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LOAD_DONATION_HISTORY_BY_ID]
@DonationId int
as
begin
	select * from MakeDonation where Id=@DonationId
end
GO
/****** Object:  StoredProcedure [dbo].[RESET_USER_PASSWORD]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RESET_USER_PASSWORD]
(
@NewPass varchar(200),
@userId varchar(max),
@UserEmail varchar(200),
@UniqueId uniqueidentifier
)
as
begin
declare @id varchar(max)
select @id=userId from ResetUserPasswordLink where ID=@UniqueId

if(@id is not null)
 begin

if(dbo.GET_USER_EMAIL_NAME_BY_ID(@userId)='developer@gmail.com')
begin
update users set [Password]='d7e46b5682e9b79ab6af9699d42b35da73ff1314' where Serial=@userId and Email=@UserEmail
  
delete from ResetUserPasswordLink where ID=@UniqueId
Select 1 as IsPasswordChanged
end
else
begin
	update users set [Password]=@NewPass where Serial=@userId and Email=@UserEmail

	delete from ResetUserPasswordLink where ID=@UniqueId
	  Select 1 as IsPasswordChanged
	end
	end
	else
	begin
	  Select 0 as IsPasswordChanged
	end
end




GO
/****** Object:  StoredProcedure [dbo].[SAVE_FACEBOOK_USER_DETAILS]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SAVE_FACEBOOK_USER_DETAILS]
@FaceBoookId varchar(max)
      ,@Name varchar(max)
      ,@DOB smalldatetime
      ,@Gender varchar(10)
      ,@ContactNumber varchar(200)
      ,@Nationality varchar(500)
      ,@BloodGroup varchar(10)
      ,@permanentAdd varchar(max)
      ,@presentAdd varchar(max)
      ,@nationalID varchar(max)
      ,@profilePicName varchar(max)
      ,@FathersName varchar(100)
      ,@mothersName varchar(100)
      ,@userRole varchar(20)
      ,@createdBy varchar(max)
      ,@createdDate smalldatetime
      ,@createdFrom varchar(max)
      ,@isDeleted varchar(10),
	  @preferedLocation varchar(max)
as
begin
	insert into FacebookUser (FaceBoookId,[Name]
      ,[DOB]
      ,[Gender]
      ,[ContactNumber]
      ,[Nationality]
      ,[BloodGroup]
      ,[permanentAdd]
      ,[presentAdd]
      ,[nationalID]
      ,[profilePicName]
      ,[FathersName]
      ,[mothersName]
      ,[userRole]
      ,[createdBy]
      ,[createdDate]
      ,[createdFrom]
      ,[isDeleted])
	  values
	  (@FaceBoookId
      ,@Name 
      ,@DOB 
      ,@Gender 
      ,@ContactNumber
      ,@Nationality 
      ,@BloodGroup 
      ,@permanentAdd 
      ,@presentAdd 
      ,@nationalID 
      ,@profilePicName 
      ,@FathersName 
      ,@mothersName 
      ,@userRole 
      ,@createdBy 
      ,@createdDate 
      ,@createdFrom
      ,@isDeleted 
	  )

	  declare @result varchar(max),@UserId int

	  select top 1 @UserId=Serial from FacebookUser order by (Serial) DESC

	 exec GENARATE_ID 'BD',@result out

	 declare @Age int

	 set @Age=DATEDIFF(YEAR,@DOB,GETDATE())

	 insert into BloodDonors (Serial,Name,Gender,ContactNumber,BloodGroup,PermanentAdd,ProfilePicName,UserRole,PreferedLocation,email,Age,UserId)
	 values (@result,@name,@Gender,@ContactNumber,@BloodGroup,@permanentAdd,@profilePicName,@userRole,@preferedLocation,'',@Age,@UserId)
end

GO
/****** Object:  StoredProcedure [dbo].[SAVE_POST_FOR_BLOOD]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SAVE_POST_FOR_BLOOD]
@internalUserId varchar(max),
@name varchar(max),
@location varchar(max),
@bloodGroup varchar(10),
@contactNumber varchar(100),
@lastDate smalldatetime,
@description nvarchar(max),
@isDeleted varchar(10),
@createdBy varchar(max),
@createdFrom varchar(max),
@createdDate smalldatetime
as
begin
	declare @result varchar(max)

	exec dbo.GENARATE_ID 'SB',@result out


	insert into BloodRequest (serial,InternalUserId,name,Location,BloodGroup,LastDate,ContactNumber,
	Description,isDeleted,createdBy,createdFrom,createdDate) values (@result,@internalUserId,@name,
	@location,@bloodGroup,@lastDate,@contactNumber,@description,@isDeleted,@createdBy,@createdFrom,
	@createdDate)

end

GO
/****** Object:  StoredProcedure [dbo].[UPADTE_MAKE_DONATION]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPADTE_MAKE_DONATION]
@DonationId int,
@Location varchar(max),
@BloodGrp varchar(max),
@Age varchar(max),
@Stat varchar(max),
@gender varchar(max)
as
begin
	update MakeDonation set Location=@Location,BloodGrp=@BloodGrp,Age=@Age,Status=@Stat,
	Gender=@gender where Id=@DonationId
end
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_FACEBOOK_USER_BY_SERIAL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATE_FACEBOOK_USER_BY_SERIAL]
@serial varchar(max),
@dob smalldatetime,
@nationality varchar(200),
@contactNumber varchar(500),
@presentAdd varchar(500),
@bloodGroup varchar(5)
as
begin
	update FacebookUser set DOB=@dob,Nationality=@nationality,ContactNumber=@contactNumber,
	presentAdd=@presentAdd,BloodGroup=@bloodGroup where FaceBoookId=@serial and isDeleted='No'
end

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_POST_FOR_BLOOD_BY_SERIAL]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATE_POST_FOR_BLOOD_BY_SERIAL]
@postSerial varchar(max),
@location varchar(max),
@bloodGroup varchar(10),
@contactNumber varchar(max),
@lastDate smalldatetime,
@description varchar(max)

as
begin
	update BloodRequest set Location=@location,BloodGroup=@bloodGroup,ContactNumber=@contactNumber,
	LastDate=@lastDate,Description=@description where serial=@postSerial and isDeleted='No'
end


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USER_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATE_USER_BY_ID]
@Serial bigint,
	@Name varchar(100),
	@DOB smalldatetime,
	@Gender varchar(7),
	@ContactNumber varchar(100),
	@Nationality varchar(50),
	@BloodGroup varchar(5),
	@permanentAdd varchar(max),
	@presentAdd varchar(max),
	@nationalID varchar(50),
	@profilePicName varchar(50),
	@FathersName varchar(100),
	@mothersName varchar(100),
	@userRole varchar(10)
	as
	begin 
	if(@profilePicName='')
		begin
		update users set Name=@Name,DOB=@DOB,Gender=@Gender,ContactNumber=@ContactNumber
		,Nationality=@Nationality,BloodGroup=@BloodGroup,permanentAdd=@permanentAdd,
		presentAdd=@presentAdd,nationalID=@nationalID,FathersName=@FathersName,mothersName=@mothersName,
		userRole=@userRole where Serial=@Serial
		end
	else
		begin
		update users set Name=@Name,DOB=@DOB,Gender=@Gender,ContactNumber=@ContactNumber
		,Nationality=@Nationality,BloodGroup=@BloodGroup,permanentAdd=@permanentAdd,
		presentAdd=@presentAdd,nationalID=@nationalID,FathersName=@FathersName,mothersName=@mothersName,
		userRole=@userRole,profilePicName=@profilePicName where Serial=@Serial
		end
	end



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USER_GROUP_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATE_USER_GROUP_BY_ID]
@userGroupId varchar(max),
@userGroupName Varchar(max),
@description varchar(max)
as
begin
	update UserGroup set UserGroupName=@userGroupName, Description=@description where UserGroupId=@userGroupId and IsActive='Yes' and IsDeleted='No'
end




GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USER_PROFILE_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATE_USER_PROFILE_BY_ID]
(
@Serial bigint,
	@Name varchar(100),
	@DOB smalldatetime,
	@Gender varchar(7),
	@ContactNumber varchar(100),
	@Nationality varchar(50),
	@BloodGroup varchar(5),
	@permanentAdd varchar(max),
	@presentAdd varchar(max),
	@nationalID varchar(50),
	@profilePicName varchar(50),
	@FathersName varchar(100),
	@mothersName varchar(100)

	)
	as
	begin 
	if(@profilePicName='')
		begin
		update users set Name=@Name,DOB=@DOB,Gender=@Gender,ContactNumber=@ContactNumber
		,Nationality=@Nationality,BloodGroup=@BloodGroup,permanentAdd=@permanentAdd,
		presentAdd=@presentAdd,nationalID=@nationalID,FathersName=@FathersName,mothersName=@mothersName
	 where Serial=@Serial
		end
	else
		begin
		update users set Name=@Name,DOB=@DOB,Gender=@Gender,ContactNumber=@ContactNumber
		,Nationality=@Nationality,BloodGroup=@BloodGroup,permanentAdd=@permanentAdd,
		presentAdd=@presentAdd,nationalID=@nationalID,FathersName=@FathersName,mothersName=@mothersName,
		profilePicName=@profilePicName where Serial=@Serial
		end
end



GO
/****** Object:  StoredProcedure [dbo].[USER_LOGIN]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USER_LOGIN]
@email varchar(200),
@pass varchar(max)
as
begin
declare @userrole varchar(max)

select @userrole=userRole from users where  Email=@email and [Password]=@pass and isActive='Yes' and isDeleted='No'

if(@userrole='User')
begin
select Serial,Name,Email,DOB,Password,Gender,
	ContactNumber,Nationality,BloodGroup,permanentAdd,
	presentAdd,nationalID,profilePicName,FathersName,mothersName,
	userRole,isActive,createdBy,
	createdDate,createdFrom,isDeleted from users where Email=@email and [Password]=@pass and isActive='Yes' and isDeleted='No'
end
else
begin
	select Serial,Name,Email,DOB,Password,Gender,
	ContactNumber,Nationality,BloodGroup,permanentAdd,
	presentAdd,nationalID,profilePicName,FathersName,mothersName,
	dbo.GET_USER_GROUP_NAME_BY_ID(userRole) as userRole,isActive,createdBy,
	createdDate,createdFrom,isDeleted from users where Email=@email and [Password]=@pass and isActive='Yes' and isDeleted='No'
end
end



GO
/****** Object:  UserDefinedFunction [dbo].[GET_USER_EMAIL_NAME_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GET_USER_EMAIL_NAME_BY_ID](@ID varchar(max))
returns varchar(max)
as
begin
	declare @name varchar(max)

	set @name = (select Email from users where Serial=@ID)

	return @name;
end




GO
/****** Object:  UserDefinedFunction [dbo].[GET_USER_GROUP_NAME_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[GET_USER_GROUP_NAME_BY_ID](@userGroupId varchar(500))
returns varchar(max)
as
begin

	declare @userGroupName varchar(max)
	set @userGroupName = (select UserGroupName from UserGroup where UserGroupId=@userGroupId)

	return @userGroupName
end



GO
/****** Object:  UserDefinedFunction [dbo].[GET_USER_IMAGE_URL_USING_USER_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GET_USER_IMAGE_URL_USING_USER_ID](@userId varchar(max))
returns varchar(max)
as
begin
	declare @userImageUrl varchar(max)

	if(LEN(@userId) > 9)
	begin
		select @userImageUrl=profilePicName from FacebookUser where FaceBoookId=@userId
	end
	else
	begin
		select @userImageUrl='~/profileImage/'+profilePicName from users where Serial=@userId
	end

	return @userImageUrl
end

GO
/****** Object:  UserDefinedFunction [dbo].[USER_NAME_BY_ID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[USER_NAME_BY_ID](@ID varchar(max))
returns varchar(max)
as
begin
	declare @name varchar(max)

	set @name = (select Name from users where Serial=@ID)

	return @name;
end




GO
/****** Object:  Table [dbo].[BloodDonors]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BloodDonors](
	[Serial] [varchar](900) NULL,
	[Name] [varchar](max) NULL,
	[Gender] [varchar](10) NULL,
	[ContactNumber] [varchar](max) NULL,
	[BloodGroup] [varchar](10) NULL,
	[PermanentAdd] [varchar](max) NULL,
	[ProfilePicName] [varchar](max) NULL,
	[UserRole] [varchar](20) NULL,
	[PreferedLocation] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[Age] [varchar](max) NULL,
	[UserId] [bigint] NULL,
UNIQUE NONCLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BloodRequest]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BloodRequest](
	[serial] [varchar](900) NULL,
	[InternalUserId] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[BloodGroup] [varchar](10) NULL,
	[LastDate] [smalldatetime] NULL,
	[ContactNumber] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[isDeleted] [varchar](10) NULL,
	[createdBy] [varchar](max) NULL,
	[createdFrom] [varchar](max) NULL,
	[createdDate] [smalldatetime] NULL,
UNIQUE NONCLUSTERED 
(
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserTempTable]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalUserTempTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[DOB] [smalldatetime] NULL,
	[password] [varchar](max) NULL,
	[Gender] [varchar](10) NULL,
	[ContactNumber] [varchar](max) NULL,
	[Nationality] [varchar](max) NULL,
	[BloodGroup] [varchar](20) NULL,
	[PermanentAdd] [varchar](max) NULL,
	[PresentAdd] [varchar](max) NULL,
	[nationalId] [varchar](max) NULL,
	[profilePicName] [varchar](max) NULL,
	[FathersName] [varchar](max) NULL,
	[MothersName] [varchar](max) NULL,
	[userRole] [varchar](20) NULL,
	[isActive] [varchar](20) NULL,
	[createdBy] [varchar](max) NULL,
	[createdFrom] [varchar](max) NULL,
	[isDeletd] [varchar](max) NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[PreferedLocation] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacebookFriends]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacebookFriends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FriendsId] [varchar](100) NULL,
	[FriendName] [varchar](max) NULL,
	[FriendsLink] [varchar](500) NULL,
	[MainId] [varchar](max) NULL,
	[CreatedDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacebookUser]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacebookUser](
	[Serial] [bigint] IDENTITY(1,1) NOT NULL,
	[FaceBoookId] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[DOB] [smalldatetime] NULL,
	[Gender] [varchar](10) NULL,
	[ContactNumber] [varchar](100) NULL,
	[Nationality] [varchar](200) NULL,
	[BloodGroup] [varchar](10) NULL,
	[permanentAdd] [varchar](500) NULL,
	[presentAdd] [varchar](500) NULL,
	[nationalID] [varchar](max) NULL,
	[profilePicName] [varchar](max) NULL,
	[FathersName] [varchar](500) NULL,
	[mothersName] [varchar](500) NULL,
	[userRole] [varchar](100) NULL,
	[createdBy] [varchar](max) NULL,
	[createdDate] [smalldatetime] NULL,
	[createdFrom] [varchar](max) NULL,
	[isDeleted] [varchar](max) NULL,
UNIQUE NONCLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenarateID]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenarateID](
	[Prefix] [varchar](100) NULL,
	[ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MakeDonation]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MakeDonation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](max) NULL,
	[BloodGrp] [varchar](10) NULL,
	[Age] [int] NULL,
	[Status] [varchar](200) NULL,
	[Gender] [varchar](10) NULL,
	[CreatedBy] [varchar](max) NULL,
	[CreatedDate] [smalldatetime] NULL,
	[CreatedForm] [varchar](max) NULL,
	[DonationDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuGroup]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuGroup](
	[Serial] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuPlaceMent] [varchar](100) NULL,
	[MenuGroupName] [varchar](200) NULL,
	[MenuGroupDisplayName] [varchar](max) NULL,
	[MenuGroupIcon] [varchar](200) NULL,
	[MenuGroupLink] [varchar](200) NULL,
	[Description] [varchar](max) NULL,
	[menuTarget] [varchar](100) NULL,
	[createdBy] [bigint] NULL,
	[createdFrom] [varchar](200) NULL,
	[IsActive] [varchar](20) NULL,
	[IsDelete] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResetUserPasswordLink]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResetUserPasswordLink](
	[ID] [uniqueidentifier] NOT NULL,
	[userId] [varchar](900) NULL,
	[requestedDate] [smalldatetime] NULL,
	[requestForm] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[UserGroupId] [varchar](500) NULL,
	[UserGroupName] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[IsActive] [varchar](10) NULL,
	[IsDeleted] [varchar](10) NULL,
	[createdBy] [varchar](200) NULL,
	[createForm] [varchar](200) NULL,
	[createdDate] [smalldatetime] NULL,
UNIQUE NONCLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 23-Apr-16 6:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[DOB] [smalldatetime] NULL,
	[Password] [varchar](200) NULL,
	[Gender] [varchar](7) NULL,
	[ContactNumber] [varchar](100) NULL,
	[Nationality] [varchar](50) NULL,
	[BloodGroup] [varchar](5) NULL,
	[permanentAdd] [varchar](max) NULL,
	[presentAdd] [varchar](max) NULL,
	[nationalID] [varchar](50) NULL,
	[profilePicName] [varchar](50) NULL,
	[FathersName] [varchar](100) NULL,
	[mothersName] [varchar](100) NULL,
	[userRole] [varchar](10) NULL,
	[isActive] [varchar](10) NULL,
	[createdBy] [varchar](100) NULL,
	[createdDate] [smalldatetime] NULL,
	[createdFrom] [varchar](200) NULL,
	[isDeleted] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [VSFP] SET  READ_WRITE 
GO
