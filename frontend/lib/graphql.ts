import { ApolloClient, InMemoryCache } from "@apollo/client";
import UploadHttpLink from "apollo-upload-client/UploadHttpLink.mjs";

const uploadLink = new UploadHttpLink({
  uri: "/graphql",
  credentials: "include",
});

export const client = new ApolloClient({
  link: uploadLink,
  cache: new InMemoryCache(),
});
