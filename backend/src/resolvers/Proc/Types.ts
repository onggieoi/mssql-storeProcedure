import { Field, Int, ObjectType } from "type-graphql";

@ObjectType()
export class Proc1Respone {
  @Field(() => Int, { nullable: true })
  ma_docgia?: number;

  @Field(() => String, { nullable: true })
  ho?: string;

  @Field(() => String, { nullable: true })
  tenlot?: string;

  @Field(() => String, { nullable: true })
  ten?: string;

  @Field(() => Date, { nullable: true })
  NgaySinh?: Date;

  @Field(() => String, { nullable: true })
  hotenNL?: string;

  @Field(() => String, { nullable: true })
  hotenTreEm?: string;

  @Field(() => String, { nullable: true })
  sonha?: string;

  @Field(() => String, { nullable: true })
  duong?: string;

  @Field(() => String, { nullable: true })
  quan?: string;

  @Field(() => String, { nullable: true })
  dienthoai?: string;

  @Field(() => Date, { nullable: true })
  han_sd?: Date;

  @Field(() => String, { nullable: true })
  ma_docgia_nguoilon?: string;
}

