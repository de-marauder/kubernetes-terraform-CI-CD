import { Routes, Route, useLocation } from 'react-router-dom';

import Navbar from './Navbar/Navbar';

import './App.css';
import Title from './Title/Title';
import Projects from './Projects/Projects';
import About from './About/About';
import Resume from './Resume/Resume';
import Contact from './Contact/Contact';

import {AnimatePresence} from 'framer-motion'


function App() {
  const location = useLocation()
  return (
    <section className='App'>
      <Navbar />
      <div className="Landing">
        <AnimatePresence>
          <Routes location={location} key={location.pathname}>
            <Route path='/' index element={<Title />} />
            <Route path='/projects' element={<Projects />} />
            <Route path='/about' element={<About />} />
            <Route path='/resume' element={<Resume />} />
            <Route path='/contact' element={<Contact />} />
            <Route path='/*' element={<Title />} />
          </Routes>
        </AnimatePresence>
      </div>
    </section>
  );
}

export default App;
