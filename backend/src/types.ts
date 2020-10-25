import { Request, Response } from "express";
import { EntityManager, Connection } from "typeorm";

export type MyContext = {
  req: Request;
  res: Response;
  connection: Connection;
};
