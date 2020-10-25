import { Resolver, Query, Ctx } from "type-graphql";

import { MyContext } from "../../types";
import { TestRespone } from "./Types";

@Resolver()
export class TestResolver {
  @Query(() => [TestRespone])
  async tests(
    @Ctx() { connection }: MyContext
  ): Promise<TestRespone[]> {
    const test = await connection.query('select * from test');
    // console.log(test.map(({ id, title }: TestRespone) => ({ id, title })));

    return test.map(({ id, title }: TestRespone) => ({ id, title }));
  }
}