import React from 'react'

import classes from './Menu.module.css'

export default function Menu({toggle, sidebar}) {
  return (
    <div onClick={() => toggle(!sidebar)} className={classes.Outer}>
          <p>{sidebar ? 'X' : 'Menu'}</p>
    </div>
  )
}
