import Head from '../components/head/Head'
import '../styles/list.css'
import {motion} from 'framer-motion'
import {Link} from 'react-router-dom';




import { Container, Row, Col } from 'reactstrap'
import Listpro1 from '../assets/images/pro1.jpg'
import Listpro2 from '../assets/images/pro2.jpg'
import Listpro3 from '../assets/images/pro3.jpg'
import Listpro4 from '../assets/images/pro4.jpg'
import Listpro5 from '../assets/images/pro5.jpg'
import Listpro6 from '../assets/images/pro6.jpg'




function List() {
  return (
    <Head title = {'List'}>
      <section className='section'>
        <Container>
          <Row>
            <Col lg='12' className='text_center'>
              
              <div className='content'>
                
                <h2 className='section_title'> <center>Choose your Counselor </center> </h2>
                <p> </p>
                


              </div>
            </Col>
           
<Row>
<Col lg='3' md='4'>
           <div className='profile_item'>
        <div className='profile_img1'>
          <img src={Listpro1} width= '300px' height='300px' alt='' />

          <div className='p-2' profile_info>
          <h3 className='profile_name'><center><b>Mr. Henry Wilson</b> </center></h3>
         
         

          </div>

          
        <br></br>
            <span>
            <motion.button whileTap={{scale:1.2}} className='work_btn'> <Link to = '/ProfileOne'>Work with me</Link> </motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>

</Row>
            
      
<Container>
  <Row>
  <Col lg='3' md='4'>
           <div className='profile_item'>
        <div className='profile_img1'>
          <img src={Listpro2} width= '300px' height='300px' alt='' />

          <h3 className='profile_name'><center><b>Mr. Allan Lewis</b> </center></h3>
        
        <br></br>
            <span>
            <motion.button whileTap={{scale:1.2}} className='work_btn'><Link to = '/ProfileTwo'> Work with me </Link> </motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>


  </Row>
</Container>

<Container>
  <Row>
  <Col lg='3' md='4'>
           <div className='profile_item'>
        <div className='profile_img1'>
          <img src={Listpro3} width= '300px' height='300px' alt='' />

          <h3 className='profile_name'><center><b>Mrs. Jessica Megan</b> </center></h3>
        
        <br></br>
            <span>
            <motion.button whileTap={{scale:1.2}} className='work_btn'> <Link to = '/ProfileThree'> Work with me </Link></motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>

  </Row>
</Container>
    
    

    <Col lg='3' md='4'>
           <div className='profile_item_new'>
        <div className='profile_img2'>
          <img src={Listpro4} width= '300px' height='300px' alt='' />

          <h3 className='profile_name1'><center><b>Mr. Harry Jake</b></center></h3>
       
        <br></br>
            <span>
            <motion.button whileTap={{scale:1.2}} className='work_btn'> <Link to = '/ProfileFour'> Work with me </Link></motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>

    <Col lg='3' md='4'>
           <div className='profile_item'>
        <div className='profile_img3'>
          <img src={Listpro5} width= '300px' height='300px' alt='' />

          <h3 className='profile_name2'><center><b>Miss. Isla Lauren</b></center></h3>
       
        <br></br>
        <span>
        <motion.button whileTap={{scale:1.2}} className='work_btn'> <Link to = '/ProfileFive'> Work with me </Link></motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>

    <Col lg='3' md='4'>
           <div className='profile_item'>
        <div className='profile_img4'>
          <img src={Listpro6} width= '300px' height='300px' alt='' />

          <h3 className='profile_name3'><center><b>Mr. Peter Nelson</b> </center></h3>
       
        <br></br>
            <span>
            <motion.button whileTap={{scale:1.2}} className='work_btn'> <Link to = '/ProfileSix'> Work with me </Link></motion.button>
            </span>
            
        </div>

        
        </div>
    
    </Col>

            

            

          </Row>
        </Container>

      </section>
    
      
    </Head>
  )
}

export default List