import Link, { LinkProps } from "next/link";
import { useRouter } from "next/router";
import { cn } from "@/lib/utils";

interface NavLinkProps extends LinkProps {
  className?: string;
  activeClassName?: string;
}

const NavLink = ({ href, className, activeClassName, ...props }: NavLinkProps) => {
  const router = useRouter();
  const isActive = router.asPath === href;

  return (
    <Link
      href={href}
      className={cn(className, isActive && activeClassName)}
      {...props}
    />
  );
};

export { NavLink };
