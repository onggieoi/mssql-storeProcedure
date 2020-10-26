-- Câu 8. Thêm cuốn sách mới:

-- Tên: sp_ThemCuonSach

-- Nội dung: Thêm cuốn sách vào hệ thống với điều kiện phải bảo đảm quy định QĐ-2
-- được tuân thủ. Và phải cập nhật trạng thái của đầu sách.

--   Bước thực hiện:
--   [1] Kiểm tra mã isbn nếu không tồn tại thì thông báo & return.
--   [2] Xác định mã cuốn sách sẽ cấp cho cuốn sách này thỏa quy định QĐ-2.
--   [3] Thêm cuốn sách mới với mã cuốn sách đã xác định và tình trạng là yes.
--   [4] Thay đổi trạng thái của đầu sách là yes

create proc sp_ThemCuonSach
						              @isbn int
as
begin
	if exists(select * from DauSach where DauSach.isbn = @isbn)
		begin 						
		DECLARE @Ma_CuonSach smallint
		set @Ma_CuonSach = ( select MAX(cs.Ma_CuonSach ) + 1 from CuonSach cs )
		insert into CuonSach values (@isbn, @Ma_CuonSach, 'Y')
		UPDATE DauSach 
		SET trangthai = 'Y'
		WHERE isbn = @isbn  
		end
	else
		print 'Invalid input value'
end

exec sp_ThemCuonSach 1 