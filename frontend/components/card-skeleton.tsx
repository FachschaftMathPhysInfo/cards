import React from "react";
import { Card, CardContent } from "./ui/card";
import { Skeleton } from "./ui/skeleton";
import { cn } from "@/lib/utils";

interface CardSkeletonProps extends React.HTMLAttributes<HTMLDivElement> {
  count?: number;
}

export default function CardSkeleton({ className, count }: CardSkeletonProps) {
  function Item() {
    return (
      <Card>
        <CardContent
          className={cn(
            className,
            "h-full w-70 flex flex-col justify-between gap-y-4"
          )}
        >
          <div className="space-y-2">
            <Skeleton className="w-50 h-5" />
            <Skeleton className="w-60 h-15" />
          </div>
          <div className="flex flex-wrap gap-2">
            <Skeleton className="h-5 w-10" />
            <Skeleton className="h-5 w-20" />
            <Skeleton className="h-5 w-15" />
            <Skeleton className="h-5 w-35" />
          </div>
          <Skeleton className="h-10 w-10" />
        </CardContent>
      </Card>
    );
  }

  const items: React.ReactNode[] = [];
  if (count === undefined) count = 1;
  for (let i = 0; i < count; i++) {
    items.push(<Item key={i} />);
  }

  return items;
}
