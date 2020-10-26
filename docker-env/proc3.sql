-- Câu 3. Liệt kê những độc giả người lớn đang mượn sách:
-- Tên: sp_ThongtinNguoilonDangmuon
-- Nội dung: Liệt kê những thông tin của tất cả độc giả đang mượn sách của thư
-- viện.

create proc sp_ThongtinNguoilonDangmuon
as
begin
		select dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan
		from DocGia dg, Muon m, NguoiLon nl
		where dg.ma_docgia = m.ma_docgia
			and dg.ma_docgia = nl.ma_docgia
		GROUP by dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan
end


exec sp_ThongtinNguoilonDangmuon
