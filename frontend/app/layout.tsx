import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Header from "@/components/header";
import { AuthProvider } from "@/components/providers/auth-provider";
import { Toaster } from "@/components/ui/sonner";
import { RefetchProvider } from "@/components/providers/refetch-provider";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Stapel",
  description:
    "Anki Karten für deine Veranstaltungen an der Uni Heidelberg. Bereitgestellt von der Fachschaft MathPhysInfo·",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="de">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <AuthProvider>
          <RefetchProvider>
            <Header />
            <main className="mx-4 pt-25">{children}</main>
            <Toaster />
          </RefetchProvider>
        </AuthProvider>
      </body>
    </html>
  );
}
