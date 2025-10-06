"use client";

import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import {
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "@/components/ui/tooltip";
import { useIsMobile } from "@/hooks/use-mobile";
import {
  Deck,
  DecksDocument,
  DecksQuery,
  DecksQueryVariables,
} from "@/lib/gql/generated/graphql";
import { getClient } from "@/lib/graphql";
import { cn, downloadDeck } from "@/lib/utils";
import { Calendar, Download, Languages, Library, User } from "lucide-react";
import React from "react";
import ReactCountryFlag from "react-country-flag";

export default function Home() {
  const [decks, setDecks] = React.useState<Deck[]>([]);
  const [searchString, setSearchString] = React.useState<string | undefined>();

  const isMobile = useIsMobile();

  React.useEffect(() => {
    const fetchDecks = async () => {
      const client = getClient();
      try {
        const vars: DecksQueryVariables = {
          search: searchString,
        };
        const deckData = await client.request<DecksQuery>(DecksDocument, vars);
        setDecks(deckData.decks);
      } catch (err) {
        console.log(err);
      }
    };

    void fetchDecks();
  }, [searchString]);

  return (
    <div className="space-y-4">
      <Input
        placeholder="Nach Modul, Dozent/in oder Abkürzung suchen..."
        onChange={(e) => setSearchString(e.target.value)}
        className="max-w-[400px]"
      />
      <div className="flex flex-wrap gap-4">
        {decks.map((d) => (
          <Card className={cn(isMobile ? "w-full" : "w-70")} key={d.hash}>
            <CardHeader>
              <CardTitle>{d.module}</CardTitle>
              <CardDescription>{d.subject}</CardDescription>
            </CardHeader>
            <CardContent className="flex flex-wrap gap-2">
              <InfoBadge tooltip="Sprache" variant="outline">
                <Languages className="size-4" />
                <ReactCountryFlag countryCode={d.language} />
              </InfoBadge>
              <InfoBadge tooltip="Dozent/in">
                <User className="size-4" />
                {d.examiners}
              </InfoBadge>
              <InfoBadge tooltip="Semester" variant="outline">
                <Calendar className="size-4" />
                {`${d.semester} ${d.year}`}
              </InfoBadge>
              <InfoBadge tooltip="Modul ALT">
                <Library className="size-4" />
                {d.moduleAlt}
              </InfoBadge>
            </CardContent>
            <CardFooter>
              <Button onClick={() => downloadDeck(d.hash)}>
                <Download className="size-4" />
              </Button>
            </CardFooter>
          </Card>
        ))}
      </div>
    </div>
  );
}

interface InfoBadgeProps extends React.HTMLAttributes<HTMLDivElement> {
  tooltip: string;
  children: React.ReactNode;
  variant?: "secondary" | "outline";
}

function InfoBadge({ tooltip, variant, children, className }: InfoBadgeProps) {
  return (
    <Tooltip>
      <TooltipTrigger asChild className={className}>
        <Badge className="gap-x-2" variant={variant ?? "default"}>
          {children}
        </Badge>
      </TooltipTrigger>
      <TooltipContent>
        <p>{tooltip}</p>
      </TooltipContent>
    </Tooltip>
  );
}
