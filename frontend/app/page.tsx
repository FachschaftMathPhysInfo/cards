"use client";

import DeckDialog from "@/components/dialogs/deck/deck-dialog";
import { FacetedFilter } from "@/components/faceted-filter";
import { useAuth } from "@/components/providers/auth-provider";
import {useRefetch} from "@/components/providers/refetch-provider";
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
import {
  Calendar,
  Check,
  Download,
  Edit3,
  Languages,
  Library,
  User,
} from "lucide-react";
import React, { useState } from "react";
import ReactCountryFlag from "react-country-flag";

export default function Home() {
  const { isAuthenticated } = useAuth();
  const { refetchKey } = useRefetch()

  const [decks, setDecks] = React.useState<Deck[]>([]);
  const [searchString, setSearchString] = React.useState<string | undefined>();
  const [languageFilter, setLanguageFilter] = useState<string[]>([]);

  const isMobile = useIsMobile();

  React.useEffect(() => {
    const fetchDecks = async () => {
      const client = getClient();
      try {
        const vars: DecksQueryVariables = {
          search: searchString,
          language: languageFilter.length ? languageFilter : undefined,
        };
        const deckData = await client.request<DecksQuery>(DecksDocument, vars);
        setDecks(deckData.decks);
      } catch (err) {
        console.log(err);
      }
    };

    void fetchDecks();
  }, [searchString, languageFilter, refetchKey]);

  return (
    <div className="space-y-4">
      <div className="flex flex-row items-center gap-x-2">
        <Input
          placeholder="Nach Modul, Dozent/in oder Abkürzung suchen..."
          onChange={(e) => setSearchString(e.target.value)}
          className="max-w-[400px]"
        />
        <FacetedFilter
          title="Sprache"
          options={["de", "gb", "fr", "es"]}
          setFilter={setLanguageFilter}
          filters={languageFilter}
        />
      </div>
      <div className="flex flex-wrap gap-4 items-start content-start">
        {decks.map(
          (d) =>
            (d.isValid || isAuthenticated) && (
              <Card
                className={cn(
                  isMobile ? "w-full" : "w-70",
                  "self-start flex-none"
                )}
                key={d.hash}
              >
                <CardHeader>
                  <CardTitle>{d.module}</CardTitle>
                  <CardDescription>{d.subject}</CardDescription>
                </CardHeader>
                <CardContent className="flex flex-wrap gap-2">
                  <InfoBadge tooltip="Sprache">
                    <Languages className="size-4" />
                    <ReactCountryFlag countryCode={d.language} />
                  </InfoBadge>
                  <InfoBadge tooltip="Semester">
                    <Calendar className="size-4" />
                    {`${d.semester} ${d.year}`}
                  </InfoBadge>
                  <InfoBadge tooltip="Modul ALT">
                    <Library className="size-4" />
                    {d.moduleAlt}
                  </InfoBadge>
                  <InfoBadge tooltip="Dozent/in">
                    <User className="size-4" />
                    {d.examiners}
                  </InfoBadge>
                </CardContent>
                <CardFooter>
                  <Tooltip>
                    <TooltipTrigger asChild>
                      <Button onClick={() => downloadDeck(d.hash)}>
                        <Download />
                      </Button>
                    </TooltipTrigger>
                    <TooltipContent>Stapel herunterladen</TooltipContent>
                  </Tooltip>
                  {isAuthenticated && (
                    <>
                      <DeckDialog
                        trigger={
                          <Button variant="secondary" className="ml-2">
                            <Edit3 />
                          </Button>
                        }
                        deck={d}
                      />
                      {!d.isValid && (
                        <Tooltip>
                          <TooltipTrigger asChild>
                            <Button className="ml-auto bg-green-500 hover:bg-green-400">
                              <Check />
                            </Button>
                          </TooltipTrigger>
                          <TooltipContent>Stapel akzeptieren</TooltipContent>
                        </Tooltip>
                      )}
                    </>
                  )}
                </CardFooter>
              </Card>
            )
        )}
      </div>
    </div>
  );
}

interface InfoBadgeProps extends React.HTMLAttributes<HTMLDivElement> {
  tooltip: string;
  children: React.ReactNode;
  variant?: "secondary" | "outline";
}

function InfoBadge({
  tooltip,
  variant = "secondary",
  children,
  className,
}: InfoBadgeProps) {
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
