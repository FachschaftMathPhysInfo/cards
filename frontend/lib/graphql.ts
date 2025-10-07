import { ApolloClient, ApolloLink, InMemoryCache } from '@apollo/client';
import UploadHttpLink from 'apollo-upload-client/UploadHttpLink.mjs';
import { getCookie } from './cookie';

const authLink = new ApolloLink((operation, forward) => {
  const token = getCookie('token');
  operation.setContext(({ headers = {} }) => ({
    headers: { ...headers, TOKEN: token ?? '' },
  }));
  return forward(operation);
});

const uploadLink = new UploadHttpLink({
  uri: '/graphql',
  credentials: 'include',
});

export const client = new ApolloClient({
  link: authLink.concat(uploadLink),
  cache: new InMemoryCache(),
});
