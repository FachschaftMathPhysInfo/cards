import { Badge } from "./ui/badge";
import { Tooltip, TooltipContent, TooltipTrigger } from "./ui/tooltip";

interface InfoBadgeProps extends React.HTMLAttributes<HTMLDivElement> {
  tooltip: string;
  children: React.ReactNode;
  variant?: "secondary" | "outline";
}

export default function InfoBadge({
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
