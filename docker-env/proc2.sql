--Câu 2. Thông tin đầu sách:
--Tên: sp_ThongtinDausach
--Nội dung: Liệt kê những thông tin của đầu sách, thông tin tựa sách và số lượng
--sách hiện chưa được mượn của một đầu sách cụ thể (ISBN).


create proc sp_ThongtinDausach
							@isbn int
as
begin
	if exists(select * from DauSach where isbn = @isbn)
		select DauSach.isbn, DauSach.ma_tuasach, nnngu, bia, trangthai, TuaSach,tacgia, tomtat
		from DauSach 
		inner join TuaSach on DauSach.ma_tuasach = TuaSach.ma_tuasach 
		inner join CuonSach on DauSach.isbn = CuonSach.isbn 
		where DauSach.isbn = 1 and CuonSach.TinhTrang = 'N'
end


exec sp_ThongtinDausach 2
