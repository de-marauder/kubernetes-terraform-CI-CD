import React from "react";
import { motion } from "framer-motion";
import { AiOutlineDownload } from "react-icons/ai";

import classes from "../Projects/Projects.module.css";
import classes1 from "../About/About.module.css";
import classes2 from "./Resume.module.css";

export default function Resume() {

  return (
    <motion.div
      className={`${classes.Projects} ${classes2.ResumePage}`}
      style={{ minHeight: "100vh" }}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, animation: { delay: 1 } }}
    >
      <div className={classes2.Resume}>
        <h1 className={classes.Title}>Resume</h1>
        <div className={classes2.ResumeWrapper}>
          {/* <a href="https://drive.google.com/file/d/1Ub4Er5bTubYPJn6rwTKa0biHBrzjbw8w/view?usp=sharing" download target="_blank" rel="noreferrer" className={classes2.Download}> */}
          <a href="https://drive.google.com/file/d/1QzN3df3SukF_b1rQSlcY9WjJVH8Y6bgaOzBREJYgCno/view?usp=sharing" download target="_blank" rel="noreferrer" className={classes2.Download}>
            <AiOutlineDownload />
            <p className={classes1.P}>Download</p>
          </a>
          {/* <img className={classes2.ResumeImg} src="https://drive.google.com/uc?export=view&id=1Ej7dIncDrLgEQJEL-y42rGq8M4ZpbHST" alt="resume" /> */}
          <img className={classes2.ResumeImg} src="https://drive.google.com/uc?export=view&id=1QzN3df3SukF_b1rQSlcY9WjJVH8Y6bgaOzBREJYgCno" alt="resume" />
        </div>
      </div>
      <div className={`${classes.svgContainer} ${classes2.svg}`}></div>
    </motion.div>
  );
}
