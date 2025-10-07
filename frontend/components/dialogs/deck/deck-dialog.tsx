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
  Trash,
  User,
} from "lucide-react";
import React, { useEffect, useState } from "react";
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
import { toast } from "sonner";
import { Spinner } from "@/components/ui/spinner";
import { useAuth } from "@/components/providers/auth-provider";
import { useRefetch } from "@/components/providers/refetch-provider";
import {
  Deck,
  useCreateDeckMutation,
  useUpdateDeckMutation,
} from "@/lib/gql/generated/graphql";

interface DeckDialogProps {
  trigger: React.ReactNode;
  deck?: Deck;
}

const createFormSchema = (requireFile: boolean) =>
  z.object({
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
    examiners: z
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
    deck: requireFile
      ? z
          .instanceof(File, { message: "Bitte wähle eine Datei" })
          .refine((f) => f.size <= 1024 * 1024 * 100, {
            message: "Datei ist zu groß. Maximal sind 100MB erlaubt",
          })
      : z.instanceof(File).optional(),
  });

export default function DeckDialog({ trigger, deck }: DeckDialogProps) {
  const isEditing = !!deck;
  const schema = createFormSchema(!isEditing);

  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);

  const { isAuthenticated } = useAuth();
  const { triggerRefetch } = useRefetch();

  const [
    createDeck,
    { loading: newDeckLoading, error: newDeckError, data: newDeckData },
  ] = useCreateDeckMutation();
  const [
    updateDeck,
    {
      loading: updateDeckLoading,
      error: updateDeckError,
      data: updateDeckData,
    },
  ] = useUpdateDeckMutation();

  useEffect(() => {
    if (newDeckError || updateDeckError) {
      toast.error(
        `Ein Fehler ist aufgetreten: ${newDeckError ?? updateDeckError}`
      );
      console.log(newDeckError)
    }
  }, [newDeckError, updateDeckError]);

  useEffect(() => {
    setLoading(updateDeckLoading || newDeckLoading);
  }, [updateDeckLoading, newDeckLoading]);

  useEffect(() => {
    if (newDeckData || updateDeckData) {
      toast.success(
        `Stapel erfolgreich ${isEditing ? "bearbeitet" : "eingereicht"}!`
      );
      if (isAuthenticated) triggerRefetch();
      setOpen(false);
    }
  }, [newDeckData, updateDeckData]);

  const form = useForm<z.infer<typeof schema>>({
    resolver: zodResolver(schema),
    defaultValues: deck ?? {
      module: "",
      moduleAlt: "",
      subject: "",
      examiners: "",
      semester: "WiSe",
      year: new Date().getFullYear(),
      language: "de",
    },
  });

  function onNewDeckSubmit(data: z.infer<typeof schema>) {
    const { deck, ...metaWithoutDeck } = data
    createDeck({
      variables: {
        meta: metaWithoutDeck,
        file: data.deck,
      },
    });
  }

  function onUpdateDeckSubmit(data: z.infer<typeof schema>) {
    updateDeck({
      variables: { hash: deck!.hash, meta: { ...data } },
    });
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>{trigger}</DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>
            Anki Stapel {isEditing ? "bearbeiten" : "einreichen"}
          </DialogTitle>
          {!isEditing && (
            <DialogDescription>
              Danke, dass du bereit bist deine Anki-Karten zur Verfügung zu
              stellen! Wir werden den Stapel prüfen und ihn anschließend
              freigeben.
            </DialogDescription>
          )}
        </DialogHeader>
        <Form {...form}>
          <form
            onSubmit={form.handleSubmit(
              isEditing ? onUpdateDeckSubmit : onNewDeckSubmit
            )}
            className="space-y-4"
          >
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
              name="examiners"
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
                          className="w-[85px]"
                          type="number"
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
            {!isEditing && (
              <FormField
                control={form.control}
                name="deck"
                render={({ field }) => (
                  <FormItem>
                    <FormControl>
                      <Dropzone
                        maxFiles={1}
                        accept={{ ".colpkg": [], ".apkg": [] }}
                        maxSize={1024 * 1024 * 100}
                        onDrop={(f) => field.onChange(f[0])}
                        src={field.value ? [field.value] : undefined}
                      >
                        <DropzoneEmptyState />
                        <DropzoneContent />
                      </Dropzone>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            )}
            <DialogFooter>
              {isEditing && (
                <Button className="mr-auto" variant="destructive" type="button">
                  <Trash />
                </Button>
              )}
              <DialogClose asChild>
                <Button type="button" variant="outline">
                  Abbrechen
                </Button>
              </DialogClose>
              <Button disabled={loading} type="submit">
                {loading && <Spinner />}
                {isEditing ? "Speichern" : "Einreichen"}
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
