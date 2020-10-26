export default `
query Proc1 {
  proc1(id: "1") {
    hotenNL
    hotenTreEm
    ma_docgia
    ho
    tenlot
    ten
    NgaySinh
    han_sd
    sonha
    duong
    quan
    ma_docgia_nguoilon
  }
}

query Proc2 {
  proc2(id: "2") {
    isbn
    ma_tuasach
    nnngu
    bia
    trangthai
    TuaSach
    tacgia
    tomtat
  }
}

query Proc3 {
  proc3 {
    ma_docgia
    tenlot
    ten
    sonha
    duong
    quan
  }
}

query Proc4 {
  proc4 {
    ma_docgia
    tenlot
    ten
    sonha
    duong
    quan
    han_sd
  }
}

query Proc5 {
  proc5 {
    ma_docgia
    tenlot
    ten
    sonha
    duong
    quan
  }
}

query Proc6 {
  proc6(id: "1") 
}

query Proc7 {
  proc7(tuaSach: "Test3", tacGia: "Test3", tomTat: "blablabal")
}

query Proc8 {
  proc8(isbn: "1")
}


`;