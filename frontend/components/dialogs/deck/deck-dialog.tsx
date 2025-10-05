"use client"

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { TextAlignStart } from "lucide-react";
import React from "react";
import z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
} from "@/components/ui/form";

interface DeckDialogProps {
  trigger: React.ReactNode;
}

const FormSchema = z.object({
  module: z
    .string()
    .min(2, {
      message: "Das Modul muss mindestens zwei Zeichen lang sein",
    })
    .max(35, { message: "Es sind maximal 35 Zeichen erlaubt" }),
  moduleAlt: z
    .string()
    .min(1, { message: "Kurzform darf nicht leer sein" })
    .max(8, { message: "Es sind maximal 8 Zeichen erlaubt." }),
  topic: z
    .string()
    .min(1, { message: "Bitte beschreibe kurz worum es geht" })
    .max(45, { message: "Es sind maximal 45 Zeichen erlaubt" }),
  examiner: z
    .string()
    .min(1, { message: "Bitte gib an, wer die Veranstaltung gehalten hat" })
    .max(35, { message: "Es sind maximal 35 Zeichen erlaubt" }),
});

export default function DeckDialog({ trigger }: DeckDialogProps) {
  const form = useForm<z.infer<typeof FormSchema>>({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      module: "",
      moduleAlt: "",
      topic: "",
      examiner: "",
    },
  });

  function onSubmit(data: z.infer<typeof FormSchema>) {}

  return (
    <Dialog>
      <DialogTrigger asChild>{trigger}</DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Anki Stapel einreichen</DialogTitle>
        </DialogHeader>
        <DialogDescription>
          Danke, dass du bereit bist deine Anki-Karten zur Verfügung zu stellen!
          Wir werden den Stapel prüfen und ihn anschließend freigeben.
        </DialogDescription>
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)}>
            <FormField
              control={form.control}
              name="module"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Modul</FormLabel>
                  <FormControl>
                    <InputWithIcon
                      onChange={field.onChange}
                      value={field.value}
                      placeholder="Modul"
                      icon={<TextAlignStart className="size-4" />}
                    />
                  </FormControl>
                </FormItem>
              )}
            />
          </form>
        </Form>
      </DialogContent>
    </Dialog>
  );
}

interface InputWithIconProps {
  placeholder?: string;
  icon: React.ReactNode;
  inputLimit?: number;
  required?: boolean;
  onChange: (input: string) => void;
  value: string;
}

function InputWithIcon({
  placeholder,
  icon,
  inputLimit,
  required,
  onChange,
  value,
}: InputWithIconProps) {
  return (
    <div className="flex flex-row gap-x-2 items-center">
      {icon}
      <Input
        placeholder={placeholder}
        onChange={(e) => onChange(e.target.value)}
        value={value}
      />
    </div>
  );
}
