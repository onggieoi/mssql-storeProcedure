-- Câu 11. Thêm dữ liệu vào DangKy với tham số đầu vào là isbn, ma_docgia. 
-- Kiểm tra ràng buộc
--   Khóa chính
--   Khóa ngoại
--   Ngaygio_dk là ngày hiện tại

create proc sp_DangKy
					@isbn int,
					@ma_docgia int,
             	 	@ghi_chu nvarchar(255)
as
begin
	if not exists (	select *
            		  from DauSach ds
            		  where ds.isbn  = @isbn )
		begin
			print 'isbn not found'
		END
		
	else if not exists (select *
            			    from DocGia dg 
            			    where dg.ma_docgia = @ma_docgia)
		begin
			print 'ma_docgia not found'
		END
		
	else
		BEGIN 

		insert into DangKy values (@isbn, @ma_docgia, getdate(), @ghi_chu)
		END
end