import React from 'react'
import ProjectCard from './ProjectCard/ProjectCard'

import altschool from '../../../assets/images/altschool-cloud-projects.jpg'
import quickterms from '../../../assets/images/quickterms.png'
import spicy from '../../../assets/images/spicy soups 1.png'
import zombrary from '../../../assets/images/zombrary.png'
import wordle from '../../../assets/images/wordle 1.png'
import decaden from '../../../assets/images/decaden 1.png'
import calculator from '../../../assets/images/calculator.png'
import classes from "./ProjectCards.module.css"

export default function ProjectCards() {
  return (
    <div className={classes.ProjectCards}>
      <ProjectCard 
      name="AltSchool"
      img={altschool} 
      desc="A repo of my cloud projects while in AltSchool"
      tech={['AWS', 'GCP', 'CI/CD', 'Docker', 'Kubernetes', 'Helm', 'Terraform', 'Ansible', 'bash', 'linux']}
      links={["https://quickterms.onrender.com", "https://github.com/de-marauder/altschool-cloud-exercises"]} />

      <ProjectCard 
      name="QuickTerms"
      img={quickterms} 
      desc="A Terms & Conditions and Privacy Policy Generator."
      tech={['Django', 'Javascript', 'Bootstrap5']}
      links={["https://quickterms.onrender.com", "https://github.com/zuri-training/Proj-T_C_Gen-Team-74"]} />
      
      <ProjectCard 
      name="Spicy soups"
      img={spicy} 
      desc="An Online Restaurant for Ordering Local Cuisine."
      tech={['React', 'Redux', 'Tailwindcss', 'React-router-dom', 'stripe API']}
      links={["https://spicy-soups.netlify.app", "https://github.com/de-marauder/spicy_soups"]} />
      
      <ProjectCard 
      name="Zombrary"
      img={zombrary} 
      desc="Never forget a book again. Add the author and add the book. Find it anytime."
      tech={['NodeJs', 'ExpressJs', 'EJS', 'CSS3', 'HTML5']}
      links={["https://zombrary.onrender.com/", "https://github.com/de-marauder/zombrary"]} />
      
      <ProjectCard 
      name="Wordle clone"
      img={wordle} 
      desc="A game where the player tries to guess a word in 6 tries. Can you guess the word?"
      tech={['React', 'CSS3', 'JavaScript', 'HTML5']}
      links={["https://de-marauder.github.io/wordle/", "https://github.com/de-marauder/wordle"]} />
      
      <ProjectCard 
      name="Decaden"
      img={decaden} 
      desc="A landing page offered to a client to boost their online presence"
      tech={['React', 'CSS3', 'React-router-dom', 'HTML5']}
      links={["https://de-marauder.github.io/decaden/", "https://github.com/de-marauder/decaden"]} />
      
      <ProjectCard 
      name="Simple Calculator" 
      img={calculator}
      desc="A simple calculator. performs basic arithmetic operations."
      tech={['React', 'CSS3', 'HTML5']}
      links={["https://de-marauder.github.io/Calculator/", "https://github.com/de-marauder/calculator"]} />
      
      <div style={{height: '20px', width: '100%'}}></div>
    </div>
  )
}
