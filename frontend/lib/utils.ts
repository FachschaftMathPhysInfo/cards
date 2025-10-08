import { clsx, type ClassValue } from "clsx";
import { toast } from "sonner";
import { twMerge } from "tailwind-merge";
import { Deck } from "./gql/generated/graphql";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export async function downloadDeck(deck: Deck) {
  try {
    const apiUrl = "/deckfiles/" + encodeURIComponent(deck.hash + deck.fileType);
    const res = await fetch(apiUrl);

    if (!res.ok) {
      toast.error("Download failed: " + res.status);
      return;
    }

    // Construct the desired filename
    const filename = `${deck.moduleAlt}-${deck.semester}${deck.year}${deck.fileType}`;

    // Get the file as a blob
    const blob = await res.blob();

    // Create a temporary link to trigger download
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    a.remove();
    URL.revokeObjectURL(url);
  } catch (err) {
    console.error(err);
    toast.error("Download failed");
  }
}
