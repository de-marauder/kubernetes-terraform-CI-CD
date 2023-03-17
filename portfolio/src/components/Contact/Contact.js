import React, { useState } from "react";

import { useForm, ValidationError } from "@formspree/react";
import { AnimatePresence, motion } from "framer-motion";

import classes1 from "./Contact.module.css";
import classes from "../Projects/Projects.module.css";

export default function Contact() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [subject, setSubject] = useState("");
  const [message, setMessage] = useState("");

  const [submit, handleSubmit] = useForm("xlezogrg");

  const contactForm = !submit.succeeded ? (
    <section className={classes1.ContactWrapper}>
      <div className={classes1.TitleWrapper}>
        <h1 className={`${classes.Title} ${classes1.Title}`}>Hit me up! </h1>
      </div>

      <div className={classes1.contact}>
        <AnimatePresence>
          <form className={classes1.form}
            onSubmit={(e) => {
              e.preventDefault();
              handleSubmit(e);
              if (submit.succeeded) {
                console.log("state update");
                setEmail("");
                setName("");
                setSubject("");
                setMessage("");
              }
            }}
          >
            <motion.input
              initial={{
                opacity: 0,
                translateX: "-100%",
                animation: { delay: 1 },
              }}
              animate={{ opacity: 1, translateX: 0 }}
              exit={{ opacity: 0, animation: { delay: 1 } }}
              type="text"
              name="name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              placeholder="Name"
            />
            <ValidationError
              prefix="Name"
              field="name"
              errors={submit.errors}
              className={classes1.error}
            />
            <motion.input
              initial={{
                opacity: 0,
                translateX: "-100%",
                animation: { delay: 2.1 },
              }}
              animate={{ opacity: 1, translateX: 0 }}
              exit={{ opacity: 0, animation: { delay: 1 } }}
              type="email"
              name="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              placeholder="E-mail"
            />
            <ValidationError
              prefix="Email"
              field="email"
              errors={submit.errors}
              className={classes1.error}
            />
            <motion.input
              initial={{
                opacity: 0,
                translateX: "-100%",
                animation: { delay: 3.2 },
              }}
              animate={{ opacity: 1, translateX: 0 }}
              exit={{ opacity: 0, animation: { delay: 1 } }}
              type="text"
              name="subject"
              value={subject}
              onChange={(e) => setSubject(e.target.value)}
              required
              placeholder="Subject"
            />
            <ValidationError
              prefix="Subject"
              field="subject"
              errors={submit.errors}
              className={classes1.error}
            />
            <motion.textarea
              initial={{
                opacity: 0,
                translateX: "-100%",
                animation: { delay: 4.3 },
              }}
              animate={{ opacity: 1, translateX: 0 }}
              exit={{ opacity: 0, animation: { delay: 1 } }}
              type="text"
              name="message"
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              required
              rows={4}
              placeholder="Message"
            />
            <ValidationError
              prefix="Message"
              field="messagge"
              errors={submit.errors}
              className={classes1.error}
            />
            <motion.input
              disabled={submit.submitting}
              initial={{
                opacity: 0,
                translateX: "-100%",
                animation: { delay: 1.4 },
              }}
              animate={{ opacity: 1, translateX: 0 }}
              exit={{ opacity: 0, animation: { delay: 1 } }}
              type="submit"
              value="SUBMIT"
            />
          </form>
        </AnimatePresence>
      </div>
    </section>
  ) : (
    <div className={classes1.response}>
      {/* <Cancel className={classes1.cancel} onClick={()=>setModal(false)} /> */}
      <p>Thanks for Contacting me!</p>
      <p>Have a great DAY!!!</p>
    </div>
  );

  return (
    <motion.div
      className={`${classes.Projects} ${classes1.ContactPage}`}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, animation: { delay: 1 } }}
    >
      {contactForm}
      <div className={`${classes.svgContainer} ${classes1.svg}`}></div>
    </motion.div>
  );
}
