"use client";

import { LogIn, LogOut, Upload } from "lucide-react";
import DeckDialog from "./dialogs/deck/deck-dialog";
import { Button } from "./ui/button";
import Link from "next/link";
import { GithubIcon } from "./social-icons";
import Image from "next/image";
import { Tooltip, TooltipContent, TooltipTrigger } from "./ui/tooltip";
import { useAuth } from "./providers/auth-provider";
import { Separator } from "@radix-ui/react-separator";
import { useIsMobile } from "@/hooks/use-mobile";

export default function Header() {
  const { isAuthenticated, logout } = useAuth();
  const isMobile = useIsMobile();

  return (
    <div className="justify-between z-20 fixed w-screen h-fit flex items-center p-5 dark:bg-black/30 light:bg-white/30 backdrop-blur-md border-b-[1px]">
      <Link href="/" className="flex flex-row items-center gap-x-2">
        <Image
          src="/logo.png"
          alt="Stapel Logo"
          width="0"
          height="0"
          sizes="100vw"
          className="h-8 w-auto flex-shrink-0"
        />
        {!isMobile && <p className="text-xl">Stapel</p>}
      </Link>
      <div className="flex flex-row gap-x-4 items-center">
        <DeckDialog
          trigger={
            <Button variant="outline">
              <Upload />
              Stapel einreichen
            </Button>
          }
        />
        {isAuthenticated ? (
          <Button onClick={() => logout()}>
            <LogOut /> Abmelden
          </Button>
        ) : (
          <Tooltip>
            <TooltipTrigger asChild>
              <Link prefetch={false} href="/login">
                <Button variant="ghost">
                  <LogIn />
                </Button>
              </Link>
            </TooltipTrigger>
            <TooltipContent>Fachschaftslogin</TooltipContent>
          </Tooltip>
        )}
        <Separator orientation="vertical" className="h-8 border-1" />
        <Link href="https://github.com/FachschaftMathPhysInfo/cards">
          <GithubIcon />
        </Link>
      </div>
    </div>
  );
}
