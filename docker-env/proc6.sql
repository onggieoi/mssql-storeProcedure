-- Câu 6. Cập nhật trạng thái của đầu sách:

-- Tên: sp_CapnhatTrangthaiDausach

-- Nội dung: Cập nhật trạng thái của một đầu sách cụ thể tương ứng với isbn:
--   nếu đầu sách không còn cuốn sách nào trong thư viện thì tình trạng là no; 
--   nếu đầu sách còn một quyển sách trở lên thì tình trạng là ‘Y’.

-- Bước thực hiện:
-- [1] Xác định số cuốn sách hiện giờ còn trong thư viện của đầu sách có isbn.
-- [2] Nếu không còn quyển nào:
-- [2.1] Cập nhật tình trạng đầu sách là no.
-- [3] Nếu còn ít nhất 1 quyển thì:
-- [3.1] Cập nhật tình trạng đầu sách là yes.

create proc sp_CapnhatTrangthaiDausach
								@isbn int
as
begin
	if exists(select * from CuonSach cs where cs.isbn = @isbn and cs.TinhTrang = 'N')
		UPDATE DauSach 
		SET trangthai = 'Y'
		WHERE isbn = @isbn 
	else
		UPDATE DauSach 
		SET trangthai = 'N'
		WHERE isbn = @isbn 
end

exec sp_CapnhatTrangthaiDausach 1
