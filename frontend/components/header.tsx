import { Upload } from "lucide-react";
import DeckDialog from "./dialogs/deck/deck-dialog";

export default function Header() {
  return (
    <div className="justify-between z-20 fixed w-screen h-fit flex items-center p-5 dark:bg-black/30 light:bg-white/30 backdrop-blur-md border-b-[1px]">
      Stapel
      <DeckDialog trigger={<Upload />} />
    </div>
  );
}
