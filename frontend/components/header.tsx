import { LogIn, Upload } from "lucide-react";
import DeckDialog from "./dialogs/deck/deck-dialog";
import { Button } from "./ui/button";
import Link from "next/link";
import { GithubIcon } from "./social-icons";

export default function Header() {
  return (
    <div className="justify-between z-20 fixed w-screen h-fit flex items-center p-5 dark:bg-black/30 light:bg-white/30 backdrop-blur-md border-b-[1px]">
      Stapel
      <div className="flex flex-row gap-x-4 items-center">
        <DeckDialog
          trigger={
            <Button variant="outline">
              <Upload />
              Stapel einreichen
            </Button>
          }
        />
        <Link href="/login">
          <Button variant="ghost">
            <LogIn />
          </Button>
        </Link>
        <Link
          href="https://github.com/FachschaftMathPhysInfo/cards"
          className="mx-3"
        >
          <GithubIcon />
        </Link>
      </div>
    </div>
  );
}
