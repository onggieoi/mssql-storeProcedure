import { Resolver, Query, Ctx, Arg } from "type-graphql";

import { MyContext } from "../../types";
import { Proc1Respone, Proc2Respone, Proc3Respone, Proc4Respone } from "./Types";

@Resolver()
export class ProcResolver {
  @Query(() => [Proc1Respone] || String)
  async proc1(
    @Ctx() { connection }: MyContext,
    @Arg('id') id: string
  ): Promise<Proc1Respone[] | string> {
    const proc1 = await connection.query(`exec sp_XemThongTinDocGia ${id}`);
    // console.log(proc1);

    return proc1.map((proc: any) => ({
      ...proc,
      ma_docgia: proc.ma_docgia[0],
    }));
  }

  @Query(() => [Proc2Respone] || String)
  async proc2(
    @Ctx() { connection }: MyContext,
    @Arg('id') id: string
  ): Promise<Proc2Respone[] | string> {

    return await connection.query(`exec sp_ThongtinDausach ${id}`);
  }

  @Query(() => [Proc3Respone] || String)
  async proc3(
    @Ctx() { connection }: MyContext,
  ): Promise<Proc3Respone[] | string> {

    return await connection.query('exec sp_ThongtinNguoilonDangmuon');
  }

  @Query(() => [Proc4Respone] || String)
  async proc4(
    @Ctx() { connection }: MyContext,
  ): Promise<Proc4Respone[] | string> {

    return await connection.query('exec sp_ThongtinNguoilonQuahan');
  }

  @Query(() => [Proc3Respone] || String)
  async proc5(
    @Ctx() { connection }: MyContext,
  ): Promise<Proc3Respone[] | string> {

    return await connection.query('exec sp_DocGiaCoTreEmMuon');
  }

  @Query(() => String)
  async proc6(
    @Ctx() { connection }: MyContext,
    @Arg('id') id: string,
  ): Promise<string> {
    try {
      await connection.query(`exec sp_CapnhatTrangthaiDausach ${id}`);
    } catch (error) {
      if (error) return 'something wrong'
    }

    return 'successfull update DauSach';
  }

  @Query(() => String)
  async proc7(
    @Ctx() { connection }: MyContext,
    @Arg('tuaSach') tuaSach: string,
    @Arg('tacGia') tacGia: string,
    @Arg('tomTat') tomTat: string,
  ): Promise<string> {

    try {
      await connection.query(`exec sp_ThemTuaSach '${tuaSach}', '${tacGia}', '${tomTat}'`);
    } catch (error) {
      if (error) return 'something wrong';
    }

    return 'successfull create new TuaSach';
  }

  @Query(() => String)
  async proc8(
    @Ctx() { connection }: MyContext,
    @Arg('isbn') isbn: string,
  ): Promise<string> {

    try {
      await connection.query(`exec sp_ThemCuonSach ${isbn}`);
    } catch (error) {
      if (error) return 'something wrong';
    }

    return 'successfull create new CuonSach';
  }

  @Query(() => String)
  async proc9(
    @Ctx() { connection }: MyContext,
    @Arg('ho') ho: string,
    @Arg('tenlot') tenlot: string,
    @Arg('ten') ten: string,
    @Arg('NgaySinh') ngaySinh: string,
    @Arg('sonha') sonha: string,
    @Arg('duong') duong: string,
    @Arg('quan') quan: string,
    @Arg('dienthoai') dienthoai: string
  ): Promise<string> {
    try {
      await connection.query(`exec sp_ThemNguoilon ${ho} ${tenlot} ${ten} ${ngaySinh} ${sonha} ${duong} ${quan} ${dienthoai}`);
    } catch (error) {
      if (error) return 'something wrong';
    }

    return 'successfull create new Doc gia nguoi lon';
  }

  @Query(() => String)
  async proc10(
    @Ctx() { connection }: MyContext,
    @Arg('ho') ho: string,
    @Arg('tenlot') tenlot: string,
    @Arg('ten') ten: string,
    @Arg('NgaySinh') ngaySinh: string,
    @Arg('nguoiLonId') nguoilonId: string,
  ): Promise<string> {
    try {
      await connection.query(`exec sp_ThemTreEm ${ho} ${tenlot} ${ten} ${ngaySinh} ${nguoilonId}`);
    } catch (error) {
      if (error) return 'something wrong';
    }

    return 'successfull create new Doc Gia Tre em';
  }

  @Query(() => String)
  async proc11(
    @Ctx() { connection }: MyContext,
    @Arg('isbn') isbn: string,
    @Arg('madocgia') madocgia: string,
    @Arg('ghichu') ghichu: string,
  ): Promise<string> {
    try {
      await connection.query(`exec sp_DangKy ${isbn} ${madocgia} '${ghichu}'`);
    } catch (error) {
      if (error) return 'something wrong';
    }

    return 'successfull create new Dang Ky';
  }
}