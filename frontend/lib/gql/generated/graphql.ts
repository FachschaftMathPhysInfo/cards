/* eslint-disable */
import { TypedDocumentNode as DocumentNode } from '@graphql-typed-document-node/core';
export type Maybe<T> = T | null;
export type InputMaybe<T> = T | null | undefined;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  Upload: { input: any; output: any; }
};

export type Deck = {
  __typename?: 'Deck';
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
  __typename?: 'Mutation';
  createDeck: Scalars['String']['output'];
  deleteDeck: Scalars['String']['output'];
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
  __typename?: 'Query';
  decks: Array<Deck>;
};


export type QueryDecksArgs = {
  search?: InputMaybe<Scalars['String']['input']>;
  semester?: InputMaybe<Scalars['String']['input']>;
  year?: InputMaybe<Scalars['Int']['input']>;
};

export type DecksQueryVariables = Exact<{
  search?: InputMaybe<Scalars['String']['input']>;
  year?: InputMaybe<Scalars['Int']['input']>;
  semester?: InputMaybe<Scalars['String']['input']>;
}>;


export type DecksQuery = { __typename?: 'Query', decks: Array<{ __typename?: 'Deck', subject: string, module: string, moduleAlt: string, examiners: string, language: string, semester: string, year: number, hash: string, fileType: string, isValid: boolean }> };


export const DecksDocument = {"kind":"Document","definitions":[{"kind":"OperationDefinition","operation":"query","name":{"kind":"Name","value":"decks"},"variableDefinitions":[{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"search"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"String"}}},{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"year"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"Int"}}},{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"semester"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"String"}}}],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"decks"},"arguments":[{"kind":"Argument","name":{"kind":"Name","value":"search"},"value":{"kind":"Variable","name":{"kind":"Name","value":"search"}}},{"kind":"Argument","name":{"kind":"Name","value":"year"},"value":{"kind":"Variable","name":{"kind":"Name","value":"year"}}},{"kind":"Argument","name":{"kind":"Name","value":"semester"},"value":{"kind":"Variable","name":{"kind":"Name","value":"semester"}}}],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"subject"}},{"kind":"Field","name":{"kind":"Name","value":"module"}},{"kind":"Field","name":{"kind":"Name","value":"moduleAlt"}},{"kind":"Field","name":{"kind":"Name","value":"examiners"}},{"kind":"Field","name":{"kind":"Name","value":"language"}},{"kind":"Field","name":{"kind":"Name","value":"semester"}},{"kind":"Field","name":{"kind":"Name","value":"year"}},{"kind":"Field","name":{"kind":"Name","value":"hash"}},{"kind":"Field","name":{"kind":"Name","value":"fileType"}},{"kind":"Field","name":{"kind":"Name","value":"isValid"}}]}}]}}]} as unknown as DocumentNode<DecksQuery, DecksQueryVariables>;