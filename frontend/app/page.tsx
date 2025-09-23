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
import { Deck, DecksDocument, DecksQuery } from "@/lib/gql/generated/graphql";
import { getClient } from "@/lib/graphql";
import { Calendar, Download, Languages, User } from "lucide-react";
import React from "react";
import ReactCountryFlag from "react-country-flag";

export default function Home() {
  const [decks, setDecks] = React.useState<Deck[]>([]);

  React.useEffect(() => {
    const fetchDecks = async () => {
      const client = getClient();
      try {
        const deckData = await client.request<DecksQuery>(DecksDocument);
        setDecks(deckData.decks);
      } catch (err) {
        console.log(err);
      }
    };

    void fetchDecks();
  }, []);

  return (
    <div className="space-y-4">
      <Input placeholder="Nach Modul, Dozent/in oder Abkürzung suchen..." />
      <div className="flex flex-wrap gap-4">
        {decks.map((d) => (
          <Card className="w-70" key={d.hash}>
            <CardHeader>
              <CardTitle>{d.module}</CardTitle>
              <CardDescription>{d.subject}</CardDescription>
            </CardHeader>
            <CardContent className="flex flex-wrap gap-2">
              <InfoBadge tooltip="Sprache">
                <Languages className="size-4" />
                <ReactCountryFlag countryCode="de" />
              </InfoBadge>
              <InfoBadge tooltip="Dozent/in">
                <User className="size-4" />
                {d.examiners}
              </InfoBadge>
              <InfoBadge tooltip="Semester" variant="outline">
                <Calendar className="size-4" />
                {`${d.semester} ${d.year}`}
              </InfoBadge>
            </CardContent>
            <CardFooter>
              <Button>
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
