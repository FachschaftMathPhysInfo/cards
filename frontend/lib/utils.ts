import { clsx, type ClassValue } from "clsx";
import {toast} from "sonner";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export async function downloadDeck(hash: string) {
  try {
    const apiUrl = "/deckfiles/" + encodeURIComponent(hash);
    const res = await fetch(apiUrl);
    if (!res.ok) toast.error("Proxy failed: " + res.status);

    let filename = "download";
    const cd = res.headers.get("Content-Disposition");
    if (cd) {
      const match = cd.match(/filename\*=UTF-8''(.+)|filename="?([^";]+)"?/); // naive
      if (match) filename = decodeURIComponent(match[1] || match[2]);
    } else {
      filename = filename.split("/").pop() || "download";
    }

    if (!res.ok) toast.error("Network response not ok");
    if (!res.body)
      toast.error("ReadableStream not supported or empty body");
    const reader = res.body!.getReader();

    const chunks = [];
    let received = 0;
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;
      chunks.push(value);
      received += value.length;
    }

    const blob = new Blob(chunks);
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
  }
}
