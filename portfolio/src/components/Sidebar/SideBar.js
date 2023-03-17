import React from 'react'
import {
    BsGithub,
    BsLinkedin,
    BsTwitter
} from 'react-icons/bs'
import { NavLink as Link } from 'react-router-dom'
import HomeImg from '../../assets/images/user.png'

import classes from './Sidebar.module.css'


export default function SideBar({ toggle, sidebar }) {
    return (
        <aside className={classes.SidebarWrapper} style={sidebar ? { transform: 'scale(1, 1)' } : null}>
            <nav onClick={() => toggle(!sidebar)} className={classes.Sidebar}>
                <Link to='/' className={classes.HomeIcon}><img style={{ width: '60%' }} src={HomeImg} alt='home' /></Link>
                <div>
                    <div className={classes.Socials}>
                        <div className={classes.SocialsInnerWrapper}>
                            <a target='_blank' rel="noreferrer" href="https://github.com/de-marauder" ><BsGithub className={classes.SocialIcon} /></a>
                            <a target='_blank' rel="noreferrer" href="https://www.linkedin.com/in/obiajulu-ezike" ><BsLinkedin className={classes.SocialIcon} /></a>
                            <a target='_blank' rel="noreferrer" href="https://twitter.com/De_marauder" ><BsTwitter className={classes.SocialIcon} /></a>
                        </div>
                    </div>

                    <div className={classes.NavItems}>
                        <Link to='/projects' className={classes.NavItem}>Projects</Link>
                        <Link to='/about' className={classes.NavItem}>About</Link>
                        <Link to='/resume' className={classes.NavItem}>Resume</Link>
                    </div>
                </div>

            </nav>
        </aside>
    )
}
