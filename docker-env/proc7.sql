
-- Câu 7. Thêm tựa sách mới:

-- Tên: sp_ThemTuaSach

-- Nội dung: Thêm tựa sách vào hệ thống với điều kiện là bộ 3 thuộc tính tựa sách,
--   tác giả, tóm tắt phải khác với các bộ trong bảng tựa sách đã có.Và phải bảo đảm quy
--   định QĐ-1 được tuân thủ.

-- Bước thực hiện:
-- [1] Xác định mã tựa sách sẽ cấp cho tựa sách này thỏa quy định QĐ-1.
-- [2] Kiểm tra phải có ít nhất 1 trong 3 thuộc tính tựa sách, tác giả, tóm tắt khác với các bộ trong bảng tựa sách đã có.
-- [3] Nếu thỏa điều kiện này thì:
--    [3.1] Thêm vào tựa sách.
-- [4] Nếu không thỏa điều kiện thì:
--    [4.1] Thông báo lỗi.
--    [4.2] Chấm dứt stored procedure.

create proc sp_ThemTuaSach
						@TuaSach nvarchar(63),
						@tacgia nvarchar(31),
						@tomtat varchar(222)
as
begin
	if not exists(select * from TuaSach ts where ts.TuaSach = @TuaSach 
												or ts.tacgia = @tacgia)
		begin 								
		DECLARE @id int
		set @id = ( select MAX(ma_tuasach) + 1 from TuaSach )
		
		insert into TuaSach(ma_tuasach, TuaSach,tacgia, tomtat ) values (@id, @TuaSach, @tacgia, @tomtat)
		end

	else
		print 'Invalid input value'
end

exec sp_ThemTuaSach 'Test 2', 'Test 2', 'blabala'


