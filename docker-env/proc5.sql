-- Câu 5. Liệt kê những độc giả người lớn đang mượn sách có trẻ em cũng đang mượn sách:
-- Tên: sp_DocGiaCoTreEmMuon
-- Nội dung: Liệt kê những những độc giả đang trong tình trạng mượn sách và những trẻ em độc giả này đang bảo 
--      lãnh cũng đang trong tình trạng mượn sách.


create proc sp_DocGiaCoTreEmMuon
as
begin
		select dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan
		from DocGia dg, NguoiLon nl, Muon m
		where m.ma_docgia = dg.ma_docgia
			and dg.ma_docgia = nl.ma_docgia
			and EXISTS (select te.ma_docgia_nguoilon 
								from DocGia dg, TreEm te, Muon m
								where m.ma_docgia = dg.ma_docgia
									and dg.ma_docgia = te.ma_docgia)
		GROUP by dg.ma_docgia, dg.tenlot, dg.ten, nl.sonha , nl.duong, nl.quan
end

exec sp_DocGiaCoTreEmMuon