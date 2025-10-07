"use client";

import { deleteCookie, getCookie, setCookie } from "@/lib/cookie";
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
  const [token, setToken] = useState<string | undefined>();

  const { error: sessionError, data: sessionData } = useIsActiveSessionQuery({
    skip: !token,
    variables: { token: token! },
  });

  if (sessionError) {
    toast.error(
      `Bei der Überprüfung der Session ist ein Fehler aufgetreten: ${sessionError.message}`
    );
  }

  useEffect(() => {
    if (sessionData) {
      setIsAuthenticated(sessionData.isActiveSession);
      if (sessionData.isActiveSession) setCookie("token", token!, 7);
    }
  }, [sessionData]);

  useEffect(() => {
    const tokenCookie = getCookie("token");
    if (tokenCookie) {
      setToken(tokenCookie);
    }

    const tokenSearchParam = searchParams.get("token");
    if (tokenSearchParam) {
      setToken(tokenSearchParam);
      router.push("/");
    }
  }, [searchParams]);

  const [triggerLogout, { error: logoutError }] = useLogoutMutation();

  if (logoutError) {
    toast.error(`Beim abmelden ist ein Fehler aufgetreten: ${logoutError}`);
  }

  function logout() {
    if (!token) return;
    triggerLogout({ variables: { token: token } });
    deleteCookie("token");
    setToken(undefined);
    setIsAuthenticated(false);
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
