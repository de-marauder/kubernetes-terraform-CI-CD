import React from "react";

import classes from "./ProjectCard.module.css";

export default function ProjectCard(props) {
  const tech = props.tech.map((el, id) => (
    <li key={id} className={classes.Tag}>
      {el}
    </li>
  ));
  const links = props.links.map((el, id) => (
    <a key={id} target="_blank" rel="noreferrer" href={el}>
      {id === 0 ? "Open Site" : "View Code"}
    </a>
  ));

  return (
    <div className={classes.ProjectCard}>
      <img loading="lazy" className={classes.ProjectImg} src={props.img} alt="project" />
      <article className={classes.desc}>
        <div className={classes.Title}>
          <h3>{props.name}</h3>
          <hr className={classes.hr} />
          <p>{props.desc}</p>
        </div>
        <ul className={classes.Tags}>{tech}</ul>
        <div className={classes.Links}>{links}</div>
      </article>
    </div>
  );
}
