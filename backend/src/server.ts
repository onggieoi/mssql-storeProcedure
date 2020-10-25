import 'reflect-metadata';
import { ConnectionManager, getConnectionManager, getConnection } from 'typeorm';
import express, { Response } from 'express';
import cors from 'cors';
import { ApolloServer } from 'apollo-server-express';
import { buildSchema } from 'type-graphql';
import path from 'path';
// import * as sql from 'mssql';

import { port } from './config';
import DbConnectionOptions from './dbConfig';
import { playground } from './playground';
import { MyContext } from './types';

(async () => {
  // setup database
  const connectionManager = getConnectionManager();
  const connection = connectionManager.create(DbConnectionOptions);
  await connection.connect();

  // const entityManager = getConnection().manager;

  // const test = await connection.query('select * from test');
  // console.log('testtttttttttttt-----------------', test);

  // const pool = new sql.ConnectionPool({
  //   user: 'sa',
  //   password: 'Onggieoi_123456',
  //   server: 'localhost',
  //   database: 'master',
  // });

  // setup Express server
  const app: express.Application = express();
  app.use(cors({
    origin: '*',
    credentials: true,
  }));
  app.use(express.json());
  // app.use(express.urlencoded());

  // setup Graphql - apollo
  const apolloServer = new ApolloServer({
    schema: await buildSchema({
      resolvers: [
        path.resolve(__dirname, './resolvers/**/*.resolver.ts'),
        path.resolve(__dirname, './resolvers/**/*.resolver.js'),
      ],
      // globalMiddlewares: [],
      validate: false,
    }),
    playground,
    context: ({ req, res }): MyContext => ({ req, res, connection }),
  });

  apolloServer.applyMiddleware({ app });

  // Run server
  app.listen(port, () => {
    console.log(`GraphQL Server is now running on port ${port}`);
  });

  app.use('/', (_, res: Response) => res.send(`
  Graphql Server ran successful !!!<br/> 
  Click here to <a href='http://localhost:${port}/graphql' target='_blank'>read graphql document</a>
  `));

})().catch(err => console.log(err));
