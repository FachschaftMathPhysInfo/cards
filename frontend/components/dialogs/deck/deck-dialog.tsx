"use client";

import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import {
  Asterisk,
  GraduationCap,
  Library,
  TextAlignStart,
  User,
} from "lucide-react";
import React, { useState } from "react";
import z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import {
  Dropzone,
  DropzoneContent,
  DropzoneEmptyState,
} from "@/components/ui/shadcn-io/dropzone";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import ReactCountryFlag from "react-country-flag";
import { getClient } from "@/lib/graphql";
import {
  CreateDeckDocument,
  CreateDeckMutation,
} from "@/lib/gql/generated/graphql";
import { toast } from "sonner";
import { Spinner } from "@/components/ui/spinner";

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
  subject: z
    .string()
    .min(1, { message: "Bitte beschreibe kurz worum es geht" })
    .max(45, { message: "Es sind maximal 45 Zeichen erlaubt" }),
  examiner: z
    .string()
    .min(1, { message: "Bitte gib an, wer die Veranstaltung gehalten hat" })
    .max(35, { message: "Es sind maximal 35 Zeichen erlaubt" }),
  semester: z.string({
    error: "Bitte wähle das Semester aus dem die Karten stammen",
  }),
  year: z
    .number()
    .min(1990, { message: "Bitte gib ein gültiges Jahr an" })
    .max(new Date().getFullYear(), {
      message: "Bitte gib ein gültiges Jahr an",
    }),
  language: z
    .string()
    .min(1, { message: "Bitte wähle die Sprache deines Stapels" }),
});

export default function DeckDialog({ trigger }: DeckDialogProps) {
  const [file, setFile] = useState<File | undefined>();
  const [loading, setLoading] = useState(false);

  const form = useForm<z.infer<typeof FormSchema>>({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      module: "",
      moduleAlt: "",
      subject: "",
      examiner: "",
      semester: "WiSe",
      year: new Date().getFullYear(),
      language: "de",
    },
  });

  async function onSubmit(data: z.infer<typeof FormSchema>) {
    setLoading(true);

    try {
      const client = getClient();
      await client.request<CreateDeckMutation>(CreateDeckDocument, data);
      toast.success("Dein Stapel wurde erfolgreich eingereicht!");
    } catch {
      toast.error("Beim einreichen deines Stapels ist ein Fehler aufgetreten.");
    }
  }

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
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
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
                      placeholder="Lineare Algebra 1"
                      required
                      icon={<TextAlignStart className="size-4" />}
                      inputLimit={35}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="moduleAlt"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Kurzform</FormLabel>
                  <FormControl>
                    <InputWithIcon
                      onChange={field.onChange}
                      value={field.value}
                      placeholder="LA1"
                      required
                      icon={<Library className="size-4" />}
                      inputLimit={8}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="subject"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Thema</FormLabel>
                  <FormControl>
                    <InputWithIcon
                      onChange={field.onChange}
                      value={field.value}
                      placeholder="Vektorräume, lineare Abbildungen, Matrizenrechnung"
                      required
                      icon={<GraduationCap className="size-4" />}
                      inputLimit={45}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="examiner"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Dozent/in</FormLabel>
                  <FormControl>
                    <InputWithIcon
                      onChange={field.onChange}
                      value={field.value}
                      placeholder="Prof. Musterfrau"
                      required
                      icon={<User className="size-4" />}
                      inputLimit={35}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <div className="flex flex-row justify-between gap-x-2">
              <div className="flex flex-row items-end gap-x-2">
                <FormField
                  control={form.control}
                  name="semester"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>Semester</FormLabel>
                      <Select
                        onValueChange={field.onChange}
                        defaultValue={field.value}
                      >
                        <FormControl>
                          <SelectTrigger>
                            <SelectValue placeholder="Wähle ein Semester" />
                          </SelectTrigger>
                        </FormControl>
                        <FormMessage />
                        <SelectContent>
                          <SelectItem value="WiSe">WiSe</SelectItem>
                          <SelectItem value="SoSe">SoSe</SelectItem>
                        </SelectContent>
                      </Select>
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="year"
                  render={({ field }) => (
                    <FormItem>
                      <FormControl>
                        <Input
                          placeholder={new Date().getFullYear().toString()}
                          className="w-[60px]"
                          maxLength={4}
                          {...field}
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
              </div>
              <FormField
                control={form.control}
                name="language"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Sprache</FormLabel>
                    <Select
                      onValueChange={field.onChange}
                      defaultValue={field.value}
                    >
                      <FormControl>
                        <SelectTrigger>
                          <SelectValue placeholder="Wähle eine Sprache" />
                        </SelectTrigger>
                      </FormControl>
                      <FormMessage />
                      <SelectContent className="w-[50px]">
                        <SelectItem value="de">
                          <ReactCountryFlag countryCode="de" />
                        </SelectItem>
                        <SelectItem value="gb">
                          <ReactCountryFlag countryCode="gb" />
                        </SelectItem>
                        <SelectItem value="fr">
                          <ReactCountryFlag countryCode="fr" />
                        </SelectItem>
                        <SelectItem value="es">
                          <ReactCountryFlag countryCode="es" />
                        </SelectItem>
                      </SelectContent>
                    </Select>
                  </FormItem>
                )}
              />
            </div>
            <Dropzone
              maxFiles={1}
              accept={{ ".colpkg": [], ".apkg": [] }}
              onDrop={(f) => setFile(f[0])}
              src={file && [file]}
            >
              <DropzoneEmptyState />
              <DropzoneContent />
            </Dropzone>
            <DialogFooter>
              <DialogClose asChild>
                <Button type="button" variant="outline">
                  Abbrechen
                </Button>
              </DialogClose>
              <Button disabled={loading} type="submit">
                {loading && <Spinner />}
                Einreichen
              </Button>
            </DialogFooter>
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
    <div className="flex flex-row gap-x-3 items-center">
      {icon}
      <Input
        placeholder={placeholder}
        onChange={(e) => onChange(e.target.value)}
        value={value}
        maxLength={inputLimit}
      />
      {(required || inputLimit) && (
        <div className="w-5">
          {required && <Asterisk className="size-3" />}
          {inputLimit && (
            <p className="text-xs text-muted-foreground">{`${value.length}/${inputLimit}`}</p>
          )}
        </div>
      )}
    </div>
  );
}
