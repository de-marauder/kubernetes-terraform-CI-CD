import React from "react";
import { motion } from "framer-motion";
import classes from "../Projects/Projects.module.css";
import classes2 from "./About.module.css";

export default function About() {
  return (
    <motion.div
      className={`${classes.Projects} ${classes2.AboutPage}`}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, animation: { delay: 1 } }}
      >
      <div className={`${classes.svgContainer} ${classes2.svg}`}></div>
      <div>
        <h1 className={classes.Title}>About</h1>
        <section className={classes2.about}>
          <motion.p
            className={classes2.P}
            initial={{ opacity: 0, transform: "translate(-50%)" }}
            animate={{ opacity: 1, transform: "translate(0%)" }}
            exit={{ opacity: 0 }}
          >
            Hello, my name is{" "}
            <span className={classes2.Name}>Ezike Obiajulu.</span>&nbsp;
            <span>
              I am a self taught software developer with an academic background
              in chemical engineering and skills in
            </span>
            &nbsp;
            <span className={classes2.skills}>CSS</span>,&nbsp;
            <span className={classes2.skills}>JavaScript</span>,&nbsp;
            <span className={classes2.skills}>React</span>,&nbsp;
            <span className={classes2.skills}>Express</span>,&nbsp;
            <span className={classes2.skills}>MongoDB</span>,&nbsp;
            <span className={classes2.skills}>python</span>&nbsp; and a specific
            interest in web development.
          </motion.p>
          <motion.p
            className={classes2.P}
            initial={{ opacity: 0, transform: "translate(-75%)" }}
            animate={{ opacity: 1, transform: "translate(0%)" }}
            exit={{ opacity: 0 }}
          >
            Researching and implementing nouvelle methods to improve the UI/UX,
            responsiveness and optimization of websites is something I take
            pride in. I constantly strive to improve my skills.
          </motion.p>
          <motion.p
            className={classes2.P}
            initial={{ opacity: 0, transform: "translate(-100%)" }}
            animate={{ opacity: 1, transform: "translate(0%)" }}
            exit={{ opacity: 0 }}
          >
            I am open to oppurtunities to collaborate and up for hire. I am
            certain that given the opportunity I will be able to provide your
            company with valuable and top notch service.
          </motion.p>
        </section>
      </div>
    </motion.div>
  );
}
