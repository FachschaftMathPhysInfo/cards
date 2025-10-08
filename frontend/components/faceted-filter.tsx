// See https://github.com/shadcn-ui/ui/blob/main/apps/www/app/(app)/examples/tasks/components/data-table-faceted-filter.tsx
import * as React from "react";
import { Check, PlusCircle } from "lucide-react";

import { cn } from "@/lib/utils";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandItem,
  CommandList,
  CommandSeparator,
} from "@/components/ui/command";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";
import { Separator } from "@/components/ui/separator";
import ReactCountryFlag from "react-country-flag";

interface FacetedFilterProps {
  title?: string;
  options: string[];
  filters: string[];
  setFilter: React.Dispatch<React.SetStateAction<string[]>>;
  className?: string;
  hideIcon?: boolean;
}

export function FacetedFilter({
  title,
  options,
  filters,
  setFilter,
  hideIcon = false,
  className,
}: FacetedFilterProps) {
  return (
    <Popover>
      <PopoverTrigger asChild>
        <Button variant="outline" size="sm" className="h-8 border-dashed">
          {!hideIcon && <PlusCircle />}
          {title}
          {filters?.length > 0 && (
            <>
              <Separator orientation="vertical" className="mx-2 h-4" />
              <Badge
                variant="secondary"
                className="rounded-sm px-1 font-normal lg:hidden"
              >
                {filters.length}
              </Badge>
              <div className="hidden space-x-1 lg:flex">
                {filters.length > 2 ? (
                  <Badge
                    variant="secondary"
                    className="rounded-sm px-1 font-normal"
                  >
                    {filters.length} ausgewählt
                  </Badge>
                ) : (
                  options
                    .filter((option) => filters.includes(option))
                    .map((option) => (
                      <Badge
                        variant="secondary"
                        key={option}
                        className="rounded-sm px-1 font-normal"
                      >
                        <ReactCountryFlag countryCode={option} />
                      </Badge>
                    ))
                )}
              </div>
            </>
          )}
        </Button>
      </PopoverTrigger>
      <PopoverContent className={cn("w-[200px] p-0", className)} align="start">
        <Command className={"h-full"}>
          <CommandList>
            <CommandEmpty>Keine Ergebnisse gefunden.</CommandEmpty>
            <CommandGroup>
              {options.map((option) => {
                const isSelected = filters.includes(option);
                return (
                  <CommandItem
                    key={option}
                    onSelect={() => {
                      const newFilters = [...filters];
                      if (isSelected) {
                        const index = newFilters.indexOf(option);
                        if (index > -1) newFilters.splice(index, 1);
                      } else {
                        newFilters.push(option);
                      }
                      setFilter(newFilters);
                    }}
                  >
                    <div
                      className={cn(
                        "mr-2 flex h-4 w-4 items-center justify-center rounded-sm border border-primary",
                        isSelected
                          ? "bg-primary text-primary-foreground"
                          : "opacity-50 [&_svg]:invisible"
                      )}
                    >
                      <Check />
                    </div>
                    <ReactCountryFlag countryCode={option} />
                  </CommandItem>
                );
              })}
            </CommandGroup>
            {filters.length > 0 && (
              <>
                <CommandSeparator />
                <CommandGroup>
                  <CommandItem
                    onSelect={() => setFilter([])}
                    className="justify-center text-center"
                  >
                    Filter löschen
                  </CommandItem>
                </CommandGroup>
              </>
            )}
          </CommandList>
        </Command>
      </PopoverContent>
    </Popover>
  );
}
