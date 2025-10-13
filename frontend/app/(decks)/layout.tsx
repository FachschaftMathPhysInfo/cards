"use client";

import { ApolloProvider } from "@apollo/client/react";
import { client } from "@/lib/graphql";
import Header from "@/components/header";
import { Toaster } from "@/components/ui/sonner";
import { AuthProvider } from "@/components/providers/auth-provider";
import Footer from "@/components/footer";
import { ThemeProvider } from "@/components/providers/theme-provider";

export default function Layout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <ThemeProvider
      attribute="class"
      defaultTheme="system"
      enableSystem
      disableTransitionOnChange
    >
      <ApolloProvider client={client}>
        <AuthProvider>
          <Header />
          <div className="flex flex-col h-screen">
            <main className="mx-4 pt-25 mb-auto">{children}</main>
            <footer className="mt-4">
              <Footer />
            </footer>
          </div>
          <Toaster richColors position="top-center" />
        </AuthProvider>
      </ApolloProvider>
    </ThemeProvider>
  );
}
