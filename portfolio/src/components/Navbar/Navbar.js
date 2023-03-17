import React from "react";
import { BsGithub, BsLinkedin, BsTwitter } from "react-icons/bs";
import { SiHomeassistant, SiHashnode } from "react-icons/si";
import { NavLink as Link } from "react-router-dom";
import classes from "./Navbar.module.css";
// import classes2 from "../Resume/Resume.module.css";

export default function Navbar(props) {
  return (
    <nav
      style={props.sidebar ? { display: "none" } : null}
      className={classes.Navbar}
    >
      <Link to="/" title="home" className={({ isActive }) =>
        isActive
          ? `${classes.HomeIcon} ${classes.active}`
          : classes.HomeIcon
      }>
        <SiHomeassistant />
      </Link>
      <div className={classes.Links}>
        <div className={classes.Socials}>
          <div className={classes.SocialsInnerWrapper}>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://github.com/de-marauder"
              title='github'
            >
              <BsGithub className={classes.SocialIcons} />
            </a>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://www.linkedin.com/in/obiajulu-ezike"
              title='linkedin'
            >
              <BsLinkedin className={classes.SocialIcons} />
            </a>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://twitter.com/De_marauder"
              title='twitter'
            >
              <BsTwitter className={classes.SocialIcons} />
            </a>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://de-marauder.hashnode.dev"
              title='blog'
            >
              <SiHashnode title="blog" className={classes.SocialIcons} />
            </a>
          </div>
        </div>
        <div className={classes.Routes}>
          <Link
            to="/projects"
            className={({ isActive }) =>
              isActive
                ? `${classes.NavItem} ${classes.active}`
                : classes.NavItem
            }
          >
            Projects
          </Link>
          <Link
            to="/about"
            className={({ isActive }) =>
              isActive
                ? `${classes.NavItem} ${classes.active}`
                : classes.NavItem
            }
          >
            About
          </Link>
          <a
            href="https://drive.google.com/file/d/1QzN3df3SukF_b1rQSlcY9WjJVH8Y6bgaOzBREJYgCno/view?usp=sharing"
            className={classes.NavItem}
            download target="_blank" rel="noreferrer"
          >
            Resume
          </a>
          <Link
            to="/contact"
            className={({ isActive }) =>
              isActive
                ? `${classes.NavItem} ${classes.active}`
                : classes.NavItem
            }
          >
            Contact
          </Link>
        </div>
      </div>
    </nav>
  );
}
