import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import { RefetchProvider } from "@/components/providers/refetch-provider";
import { Suspense } from "react";
import { Metadata } from "next";

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
    <html lang="de" suppressHydrationWarning>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <Suspense>
          <RefetchProvider>{children}</RefetchProvider>
        </Suspense>
      </body>
    </html>
  );
}
