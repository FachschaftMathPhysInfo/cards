import { GraphQLClient } from "graphql-request";

const getEndpoint = () => {
  if (typeof window !== "undefined") {
    return new URL("/graphql", window.location.origin).toString();
  }
  return "";
};

export const getClient = (token?: string) => {
  return new GraphQLClient(getEndpoint(), {
    headers: {
      TOKEN: token ?? "",
    },
  });
};
