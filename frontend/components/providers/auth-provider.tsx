"use client";

import {
  useIsActiveSessionQuery,
  useLogoutMutation,
} from "@/lib/gql/generated/graphql";
import { useRouter, useSearchParams } from "next/navigation";
import {
  createContext,
  ReactNode,
  useContext,
  useEffect,
  useState,
} from "react";
import { toast } from "sonner";

type AuthContextType = {
  isAuthenticated: boolean;
  logout: () => void;
};

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const searchParams = useSearchParams();
  const router = useRouter();

  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const { data: sessionData, refetch: sessionRefetch } =
    useIsActiveSessionQuery();

  useEffect(() => {
    if (searchParams.get("l") === "1") {
      router.push("/");
      sessionRefetch();
    }
  }, [searchParams]);

  useEffect(() => {
    if (sessionData) {
      setIsAuthenticated(sessionData.isActiveSession);
    }
  }, [sessionData]);

  const [triggerLogout, { error: logoutError }] = useLogoutMutation();

  if (logoutError) {
    toast.error(`Beim abmelden ist ein Fehler aufgetreten: ${logoutError}`);
  }

  function logout() {
    triggerLogout();
    sessionRefetch()
  }

  return (
    <AuthContext.Provider value={{ isAuthenticated, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = (): AuthContextType => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("useAuth must be used within a AuthProvider");
  }
  return context;
};
