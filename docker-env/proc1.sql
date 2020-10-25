create proc sp_XemThongTinDocGia
								@madg int
as
begin
	if exists(select * from DocGia where ma_docgia=@madg)
		if exists(select * from NguoiLon where ma_docgia=@madg)
			select ho+' '+ten as hotenNL, *
			from NguoiLon inner join DocGia on NguoiLon.ma_docgia=DocGia.ma_docgia
			where DocGia.ma_docgia=@madg
		else
			select ho+' '+ten as hotenTreEm, *
			from TreEm inner join DocGia on TreEm.ma_docgia=DocGia.ma_docgia
			where DocGia.ma_docgia=@madg
	else
		print 'khong ton tai doc gia ' + cast(@madg as char(10))
end

exec sp_XemThongTinDocGia 2
 