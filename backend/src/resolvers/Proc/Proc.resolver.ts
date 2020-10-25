import { Resolver, Query, Ctx, Arg } from "type-graphql";

import { MyContext } from "../../types";
import { Proc1Respone } from "./Types";

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
}