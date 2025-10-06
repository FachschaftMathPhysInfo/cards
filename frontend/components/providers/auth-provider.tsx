"use client";

import { deleteCookie, getCookie, setCookie } from "@/lib/cookie";
import {
  IsActiveSessionDocument,
  IsActiveSessionQuery,
  IsActiveSessionQueryVariables,
  LogoutDocument,
  LogoutMutation,
  LogoutMutationVariables,
} from "@/lib/gql/generated/graphql";
import { getClient } from "@/lib/graphql";
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
  token: string | undefined;
  logout: () => void;
};

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const searchParams = useSearchParams();
  const router = useRouter();

  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [token, setToken] = useState<string | undefined>();

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

  useEffect(() => {
    if (!token) return;

    const validateSession = async () => {
      try {
        const client = getClient();
        const vars: IsActiveSessionQueryVariables = { token: token };
        const res = await client.request<IsActiveSessionQuery>(
          IsActiveSessionDocument,
          vars
        );
        setIsAuthenticated(res.isActiveSession);
        setCookie("token", token, 7);
      } catch {
        toast.error("Beim überprüfen der Session ist ein Fehler aufgetreten");
      }
    };

    void validateSession();
  }, [token]);

  async function logout() {
    if (!token) return;
    try {
      const client = getClient();
      const vars: LogoutMutationVariables = { token: token };
      await client.request<LogoutMutation>(LogoutDocument, vars);
      deleteCookie("token");
      setIsAuthenticated(false);
      setToken(undefined);
    } catch {
      toast.error("Beim ausloggen ist ein Fehler aufgetreten");
    }
  }

  return (
    <AuthContext.Provider value={{ isAuthenticated, token, logout }}>
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
