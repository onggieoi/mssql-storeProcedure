-- Câu 10. Thêm độc giả trẻ em:

-- Tên: sp_ThemTreEm

-- Nội dung: thêm thông tin mới vào bảng dữ liệu trẻ em và bảng dữ liệu độc giả trong hệ thống.

-- Bước thực hiện:
--   [1] Xác định mã độc giả sẽ cấp cho độc giả trẻ em này thỏa quy định QĐ-2.
--   [2] Thêm một bộ dữ liệu vào bảng độc giả.
--   [3] Đếm số trẻ em của độc giả người lớn bảo lãnh trẻ em mới này.
--   [4] Kiểm tra, nếu không thỏa quy định QĐ-3 thì:
--     [4.1] Thông báo lỗi.
--     [4.2] Chấm dứt stored procedure.
--   [5] Nếu thỏa quy định QĐ-3 thì: Thêm một bộ dữ liệu vào bảng trẻ em.

create proc sp_ThemTreEm
							@ho nvarchar(15),
							@tenlot nvarchar(1),
							@ten nvarchar(15) ,
							@NgaySinh nvarchar(10),
							@ma_docgia_nguoilon int
as
begin
	if (select count(*)
      from TreEm te 
      where te.ma_docgia_nguoilon = 1
      ) < 2
		
		begin
		DECLARE @ma_docgia smallint
		set @ma_docgia = ( select MAX(dg.ma_docgia) + 1 from DocGia dg )

		insert into DocGia values (@ma_docgia, @ho, @tenlot, @ten, @NgaySinh)
		
		insert into TreEm values (@ma_docgia, @ma_docgia_nguoilon)
		end
	else
		print 'u got too much children dude?'
end