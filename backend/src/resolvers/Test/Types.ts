import { Field, InputType, Int, ObjectType } from "type-graphql";

@InputType()
export class QueryOptions {
  @Field(() => Int, { nullable: true })
  limit: number;

  @Field(() => Int, { nullable: true })
  cursor: number;
}

@ObjectType()
export class TestRespone {
  @Field(() => String, { nullable: true })
  id?: string;

  @Field(() => String, { nullable: true })
  title?: string;
}

