"use client";

import Link from "next/link";
import { Switch } from "./ui/switch";
import { useTheme } from "next-themes";
import { Label } from "./ui/label";

export default function Footer() {
  const { theme, setTheme } = useTheme();
  const isDarkMode = theme === "dark";
  return (
    <div className="flex flex-row justify-between border-t-1 p-4 text-sm">
      <div>
        <div className="flex flex-row gap-x-4 mb-2">
          <Link href={"https://www.stura.uni-heidelberg.de/impressum"}>
            Impressum
          </Link>
          <Link
            href={
              "https://www.stura.uni-heidelberg.de/impressum/datenschutzerklaerung/"
            }
          >
            Datenschutz
          </Link>
        </div>
        <p className="text-sm text-muted-foreground">
          Build v{process.env.NEXT_PUBLIC_APP_VERSION}
        </p>
      </div>
      <div className="flex flex-row gap-x-4 items-center text-muted-foreground">
        <Label>{isDarkMode ? "Heller Modus" : "Dunkler Modus"}</Label>
        <Switch
          checked={isDarkMode}
          onCheckedChange={(checked) => setTheme(checked ? "dark" : "light")}
        />
      </div>
    </div>
  );
}
