-- Câu 4. Liệt kê những độc giả người lớn đang mượn sách quá hạn:
-- Tên: sp_ThongtinNguoilonQuahan
-- Nội dung: Liệt kê những thông tin của tất cả độc giả đang mượn sách của thư
-- viện đang trong tình trạng mượn quá hạn 14 ngày.

create proc sp_ThongtinNguoilonQuahan
as
begin
		select dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan, nl.han_sd
		from DocGia dg, NguoiLon nl
		where dg.ma_docgia = nl.ma_docgia
      and nl.han_sd < getdate()
		GROUP by dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan, nl.han_sd
end

exec sp_ThongtinNguoilonQuahan