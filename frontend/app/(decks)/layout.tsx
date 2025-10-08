"use client";

import { ApolloProvider } from "@apollo/client/react";
import { client } from "@/lib/graphql";
import Header from "@/components/header";
import { Toaster } from "@/components/ui/sonner";
import { AuthProvider } from "@/components/providers/auth-provider";

export default function Layout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <ApolloProvider client={client}>
      <AuthProvider>
        <Header />
        <main className="mx-4 pt-25">{children}</main>
        <Toaster />
      </AuthProvider>
    </ApolloProvider>
  );
}
