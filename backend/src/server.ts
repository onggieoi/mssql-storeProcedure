import 'reflect-metadata';
import { getConnectionManager } from 'typeorm';
import express, { Response } from 'express';
import cors from 'cors';
import { ApolloServer } from 'apollo-server-express';
import { buildSchema } from 'type-graphql';
import path from 'path';

import { port } from './config';
import DbConnectionOptions from './dbConfig';
import { playground } from './playground';
import { MyContext } from './types';

(async () => {
  // setup database
  const connectionManager = getConnectionManager();
  const connection = connectionManager.create(DbConnectionOptions);
  await connection.connect();

  // setup Express server
  const app: express.Application = express();
  app.use(cors({
    origin: '*',
    credentials: true,
  }));
  app.use(express.json());

  // setup Graphql - apollo
  const apolloServer = new ApolloServer({
    schema: await buildSchema({
      resolvers: [path.resolve(__dirname, './resolvers/**/*.resolver.[tj]s')],
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
