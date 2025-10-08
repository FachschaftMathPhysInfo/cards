import { gql } from '@apollo/client';
import * as Apollo from '@apollo/client/react';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
const defaultOptions = {} as const;
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  Upload: { input: unknown; output: unknown; }
};

export type Deck = {
  __typename: 'Deck';
  examiners: Scalars['String']['output'];
  fileType: Scalars['String']['output'];
  hash: Scalars['String']['output'];
  isValid: Scalars['Boolean']['output'];
  language: Scalars['String']['output'];
  module: Scalars['String']['output'];
  moduleAlt: Scalars['String']['output'];
  semester: Scalars['String']['output'];
  subject: Scalars['String']['output'];
  year: Scalars['Int']['output'];
};

export type Mutation = {
  __typename: 'Mutation';
  createDeck: Scalars['String']['output'];
  deleteDeck: Scalars['String']['output'];
  logout: Scalars['String']['output'];
  setValid: Scalars['String']['output'];
  updateDeck: Scalars['String']['output'];
};


export type MutationCreateDeckArgs = {
  file: Scalars['Upload']['input'];
  meta: NewDeck;
};


export type MutationDeleteDeckArgs = {
  hash: Scalars['String']['input'];
};


export type MutationLogoutArgs = {
  token: Scalars['String']['input'];
};


export type MutationSetValidArgs = {
  hash: Scalars['String']['input'];
};


export type MutationUpdateDeckArgs = {
  hash: Scalars['String']['input'];
  meta: NewDeck;
};

export type NewDeck = {
  examiners: Scalars['String']['input'];
  language: Scalars['String']['input'];
  module: Scalars['String']['input'];
  moduleAlt: Scalars['String']['input'];
  semester: Scalars['String']['input'];
  subject: Scalars['String']['input'];
  year: Scalars['Int']['input'];
};

export type Query = {
  __typename: 'Query';
  decks: Maybe<Array<Deck>>;
  isActiveSession: Scalars['Boolean']['output'];
};


export type QueryDecksArgs = {
  languages?: InputMaybe<Array<Scalars['String']['input']>>;
  search?: InputMaybe<Scalars['String']['input']>;
  semester?: InputMaybe<Scalars['String']['input']>;
  year?: InputMaybe<Scalars['Int']['input']>;
};


export type QueryIsActiveSessionArgs = {
  token: Scalars['String']['input'];
};

export type CreateDeckMutationVariables = Exact<{
  meta: NewDeck;
  file: Scalars['Upload']['input'];
}>;


export type CreateDeckMutation = { createDeck: string };

export type UpdateDeckMutationVariables = Exact<{
  hash: Scalars['String']['input'];
  meta: NewDeck;
}>;


export type UpdateDeckMutation = { updateDeck: string };

export type DeleteDeckMutationVariables = Exact<{
  hash: Scalars['String']['input'];
}>;


export type DeleteDeckMutation = { deleteDeck: string };

export type SetValidMutationVariables = Exact<{
  hash: Scalars['String']['input'];
}>;


export type SetValidMutation = { setValid: string };

export type LogoutMutationVariables = Exact<{
  token: Scalars['String']['input'];
}>;


export type LogoutMutation = { logout: string };

export type DecksQueryVariables = Exact<{
  search?: InputMaybe<Scalars['String']['input']>;
  year?: InputMaybe<Scalars['Int']['input']>;
  semester?: InputMaybe<Scalars['String']['input']>;
  languages?: InputMaybe<Array<Scalars['String']['input']> | Scalars['String']['input']>;
}>;


export type DecksQuery = { decks: Array<{ __typename: 'Deck', subject: string, module: string, moduleAlt: string, examiners: string, language: string, semester: string, year: number, hash: string, fileType: string, isValid: boolean }> | null };

export type IsActiveSessionQueryVariables = Exact<{
  token: Scalars['String']['input'];
}>;


export type IsActiveSessionQuery = { isActiveSession: boolean };


export const CreateDeckDocument = gql`
    mutation CreateDeck($meta: NewDeck!, $file: Upload!) {
  createDeck(meta: $meta, file: $file)
}
    `;
export type CreateDeckMutationFn = Apollo.MutationFunction<CreateDeckMutation, CreateDeckMutationVariables>;

/**
 * __useCreateDeckMutation__
 *
 * To run a mutation, you first call `useCreateDeckMutation` within a React component and pass it any options that fit your needs.
 * When your component renders, `useCreateDeckMutation` returns a tuple that includes:
 * - A mutate function that you can call at any time to execute the mutation
 * - An object with fields that represent the current status of the mutation's execution
 *
 * @param baseOptions options that will be passed into the mutation, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options-2;
 *
 * @example
 * const [createDeckMutation, { data, loading, error }] = useCreateDeckMutation({
 *   variables: {
 *      meta: // value for 'meta'
 *      file: // value for 'file'
 *   },
 * });
 */
export function useCreateDeckMutation(baseOptions?: Apollo.MutationHookOptions<CreateDeckMutation, CreateDeckMutationVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useMutation<CreateDeckMutation, CreateDeckMutationVariables>(CreateDeckDocument, options);
      }
export type CreateDeckMutationHookResult = ReturnType<typeof useCreateDeckMutation>;
export type CreateDeckMutationResult = Apollo.MutationResult<CreateDeckMutation>;
export type CreateDeckMutationOptions = Apollo.BaseMutationOptions<CreateDeckMutation, CreateDeckMutationVariables>;
export const UpdateDeckDocument = gql`
    mutation UpdateDeck($hash: String!, $meta: NewDeck!) {
  updateDeck(hash: $hash, meta: $meta)
}
    `;
export type UpdateDeckMutationFn = Apollo.MutationFunction<UpdateDeckMutation, UpdateDeckMutationVariables>;

/**
 * __useUpdateDeckMutation__
 *
 * To run a mutation, you first call `useUpdateDeckMutation` within a React component and pass it any options that fit your needs.
 * When your component renders, `useUpdateDeckMutation` returns a tuple that includes:
 * - A mutate function that you can call at any time to execute the mutation
 * - An object with fields that represent the current status of the mutation's execution
 *
 * @param baseOptions options that will be passed into the mutation, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options-2;
 *
 * @example
 * const [updateDeckMutation, { data, loading, error }] = useUpdateDeckMutation({
 *   variables: {
 *      hash: // value for 'hash'
 *      meta: // value for 'meta'
 *   },
 * });
 */
export function useUpdateDeckMutation(baseOptions?: Apollo.MutationHookOptions<UpdateDeckMutation, UpdateDeckMutationVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useMutation<UpdateDeckMutation, UpdateDeckMutationVariables>(UpdateDeckDocument, options);
      }
export type UpdateDeckMutationHookResult = ReturnType<typeof useUpdateDeckMutation>;
export type UpdateDeckMutationResult = Apollo.MutationResult<UpdateDeckMutation>;
export type UpdateDeckMutationOptions = Apollo.BaseMutationOptions<UpdateDeckMutation, UpdateDeckMutationVariables>;
export const DeleteDeckDocument = gql`
    mutation DeleteDeck($hash: String!) {
  deleteDeck(hash: $hash)
}
    `;
export type DeleteDeckMutationFn = Apollo.MutationFunction<DeleteDeckMutation, DeleteDeckMutationVariables>;

/**
 * __useDeleteDeckMutation__
 *
 * To run a mutation, you first call `useDeleteDeckMutation` within a React component and pass it any options that fit your needs.
 * When your component renders, `useDeleteDeckMutation` returns a tuple that includes:
 * - A mutate function that you can call at any time to execute the mutation
 * - An object with fields that represent the current status of the mutation's execution
 *
 * @param baseOptions options that will be passed into the mutation, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options-2;
 *
 * @example
 * const [deleteDeckMutation, { data, loading, error }] = useDeleteDeckMutation({
 *   variables: {
 *      hash: // value for 'hash'
 *   },
 * });
 */
export function useDeleteDeckMutation(baseOptions?: Apollo.MutationHookOptions<DeleteDeckMutation, DeleteDeckMutationVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useMutation<DeleteDeckMutation, DeleteDeckMutationVariables>(DeleteDeckDocument, options);
      }
export type DeleteDeckMutationHookResult = ReturnType<typeof useDeleteDeckMutation>;
export type DeleteDeckMutationResult = Apollo.MutationResult<DeleteDeckMutation>;
export type DeleteDeckMutationOptions = Apollo.BaseMutationOptions<DeleteDeckMutation, DeleteDeckMutationVariables>;
export const SetValidDocument = gql`
    mutation SetValid($hash: String!) {
  setValid(hash: $hash)
}
    `;
export type SetValidMutationFn = Apollo.MutationFunction<SetValidMutation, SetValidMutationVariables>;

/**
 * __useSetValidMutation__
 *
 * To run a mutation, you first call `useSetValidMutation` within a React component and pass it any options that fit your needs.
 * When your component renders, `useSetValidMutation` returns a tuple that includes:
 * - A mutate function that you can call at any time to execute the mutation
 * - An object with fields that represent the current status of the mutation's execution
 *
 * @param baseOptions options that will be passed into the mutation, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options-2;
 *
 * @example
 * const [setValidMutation, { data, loading, error }] = useSetValidMutation({
 *   variables: {
 *      hash: // value for 'hash'
 *   },
 * });
 */
export function useSetValidMutation(baseOptions?: Apollo.MutationHookOptions<SetValidMutation, SetValidMutationVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useMutation<SetValidMutation, SetValidMutationVariables>(SetValidDocument, options);
      }
export type SetValidMutationHookResult = ReturnType<typeof useSetValidMutation>;
export type SetValidMutationResult = Apollo.MutationResult<SetValidMutation>;
export type SetValidMutationOptions = Apollo.BaseMutationOptions<SetValidMutation, SetValidMutationVariables>;
export const LogoutDocument = gql`
    mutation Logout($token: String!) {
  logout(token: $token)
}
    `;
export type LogoutMutationFn = Apollo.MutationFunction<LogoutMutation, LogoutMutationVariables>;

/**
 * __useLogoutMutation__
 *
 * To run a mutation, you first call `useLogoutMutation` within a React component and pass it any options that fit your needs.
 * When your component renders, `useLogoutMutation` returns a tuple that includes:
 * - A mutate function that you can call at any time to execute the mutation
 * - An object with fields that represent the current status of the mutation's execution
 *
 * @param baseOptions options that will be passed into the mutation, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options-2;
 *
 * @example
 * const [logoutMutation, { data, loading, error }] = useLogoutMutation({
 *   variables: {
 *      token: // value for 'token'
 *   },
 * });
 */
export function useLogoutMutation(baseOptions?: Apollo.MutationHookOptions<LogoutMutation, LogoutMutationVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useMutation<LogoutMutation, LogoutMutationVariables>(LogoutDocument, options);
      }
export type LogoutMutationHookResult = ReturnType<typeof useLogoutMutation>;
export type LogoutMutationResult = Apollo.MutationResult<LogoutMutation>;
export type LogoutMutationOptions = Apollo.BaseMutationOptions<LogoutMutation, LogoutMutationVariables>;
export const DecksDocument = gql`
    query decks($search: String, $year: Int, $semester: String, $languages: [String!]) {
  decks(search: $search, year: $year, semester: $semester, languages: $languages) {
    subject
    module
    moduleAlt
    examiners
    language
    semester
    year
    hash
    fileType
    isValid
  }
}
    `;

/**
 * __useDecksQuery__
 *
 * To run a query within a React component, call `useDecksQuery` and pass it any options that fit your needs.
 * When your component renders, `useDecksQuery` returns an object from Apollo Client that contains loading, error, and data properties
 * you can use to render your UI.
 *
 * @param baseOptions options that will be passed into the query, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options;
 *
 * @example
 * const { data, loading, error } = useDecksQuery({
 *   variables: {
 *      search: // value for 'search'
 *      year: // value for 'year'
 *      semester: // value for 'semester'
 *      languages: // value for 'languages'
 *   },
 * });
 */
export function useDecksQuery(baseOptions?: Apollo.QueryHookOptions<DecksQuery, DecksQueryVariables>) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useQuery<DecksQuery, DecksQueryVariables>(DecksDocument, options);
      }
export function useDecksLazyQuery(baseOptions?: Apollo.LazyQueryHookOptions<DecksQuery, DecksQueryVariables>) {
          const options = {...defaultOptions, ...baseOptions}
          return Apollo.useLazyQuery<DecksQuery, DecksQueryVariables>(DecksDocument, options);
        }
export function useDecksSuspenseQuery(baseOptions?: Apollo.SkipToken | Apollo.SuspenseQueryHookOptions<DecksQuery, DecksQueryVariables>) {
          const options = baseOptions === Apollo.skipToken ? baseOptions : {...defaultOptions, ...baseOptions}
          return Apollo.useSuspenseQuery<DecksQuery, DecksQueryVariables>(DecksDocument, options);
        }
export type DecksQueryHookResult = ReturnType<typeof useDecksQuery>;
export type DecksLazyQueryHookResult = ReturnType<typeof useDecksLazyQuery>;
export type DecksSuspenseQueryHookResult = ReturnType<typeof useDecksSuspenseQuery>;
export type DecksQueryResult = Apollo.QueryResult<DecksQuery, DecksQueryVariables>;
export const IsActiveSessionDocument = gql`
    query IsActiveSession($token: String!) {
  isActiveSession(token: $token)
}
    `;

/**
 * __useIsActiveSessionQuery__
 *
 * To run a query within a React component, call `useIsActiveSessionQuery` and pass it any options that fit your needs.
 * When your component renders, `useIsActiveSessionQuery` returns an object from Apollo Client that contains loading, error, and data properties
 * you can use to render your UI.
 *
 * @param baseOptions options that will be passed into the query, supported options are listed on: https://www.apollographql.com/docs/react/api/react-hooks/#options;
 *
 * @example
 * const { data, loading, error } = useIsActiveSessionQuery({
 *   variables: {
 *      token: // value for 'token'
 *   },
 * });
 */
export function useIsActiveSessionQuery(baseOptions: Apollo.QueryHookOptions<IsActiveSessionQuery, IsActiveSessionQueryVariables> & ({ variables: IsActiveSessionQueryVariables; skip?: boolean; } | { skip: boolean; }) ) {
        const options = {...defaultOptions, ...baseOptions}
        return Apollo.useQuery<IsActiveSessionQuery, IsActiveSessionQueryVariables>(IsActiveSessionDocument, options);
      }
export function useIsActiveSessionLazyQuery(baseOptions?: Apollo.LazyQueryHookOptions<IsActiveSessionQuery, IsActiveSessionQueryVariables>) {
          const options = {...defaultOptions, ...baseOptions}
          return Apollo.useLazyQuery<IsActiveSessionQuery, IsActiveSessionQueryVariables>(IsActiveSessionDocument, options);
        }
export function useIsActiveSessionSuspenseQuery(baseOptions?: Apollo.SkipToken | Apollo.SuspenseQueryHookOptions<IsActiveSessionQuery, IsActiveSessionQueryVariables>) {
          const options = baseOptions === Apollo.skipToken ? baseOptions : {...defaultOptions, ...baseOptions}
          return Apollo.useSuspenseQuery<IsActiveSessionQuery, IsActiveSessionQueryVariables>(IsActiveSessionDocument, options);
        }
export type IsActiveSessionQueryHookResult = ReturnType<typeof useIsActiveSessionQuery>;
export type IsActiveSessionLazyQueryHookResult = ReturnType<typeof useIsActiveSessionLazyQuery>;
export type IsActiveSessionSuspenseQueryHookResult = ReturnType<typeof useIsActiveSessionSuspenseQuery>;
export type IsActiveSessionQueryResult = Apollo.QueryResult<IsActiveSessionQuery, IsActiveSessionQueryVariables>;