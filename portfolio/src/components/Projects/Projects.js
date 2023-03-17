import React from "react";
import ProjectCards from "./ProjectCards/ProjectCards";
import { motion } from "framer-motion";
import classes from "./Projects.module.css";

export default function Projects() {
  return (
    <motion.div
      className={`${classes.Projects} ${classes.ProjectPage}`}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, animation: { delay: 1 } }}
    >
      <h1 className={classes.Title}>My Projects</h1>
      <ProjectCards />
    </motion.div>
  );
}
