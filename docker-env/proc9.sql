-- Câu 9. Thêm độc giả người lớn:

-- Tên: sp_ThemNguoilon

-- Nội dung: thêm thông tin mới vào bảng dữ liệu người lớn và bảng dữ liệu độc giả của hệ thống.

-- Bước thực hiện:
--   [1] Xác định mã độc giả sẽ cấp cho độc giả người lớn này thỏa quy định QĐ-2.
--   [2] Thêm một bộ dữ liệu vào bảng độc giả.
--   [3] Kiểm tra tuổi của độc giả này có đủ 18 tuổi.
--   [4] Nếu không đủ tuổi :
  --   [4.1] Thông báo lỗi.
  --   [4.2] Chấm dứt stored procedure.
--   [5] Nếu đủ tuổi thì:
--      [5.1] Thêm một bộ dữ liệu vào bảng người lớn.

create proc sp_ThemNguoilon
							@ho nvarchar(15),
							@tenlot nvarchar(1),
							@ten nvarchar(15) ,
							@NgaySinh nvarchar(10),
							@sonha nvarchar(15) ,
							@duong nvarchar(63),
							@quan nvarchar(2) ,
							@dienthoai nvarchar(13)
as
begin
	if DATEDIFF(year, @NgaySinh, getdate()) > 18
		begin
		DECLARE @ma_docgia smallint
		set @ma_docgia = ( select MAX(dg.ma_docgia) + 1 from DocGia dg )

		insert into DocGia values (@ma_docgia, @ho, @tenlot, @ten, @NgaySinh)
		insert into NguoiLon values (@ma_docgia, @sonha, @duong, @quan, @dienthoai, '2030/12/12' )
		end
	else
		print 'ure not bigger 18'
end