import React from 'react'
import { Container} from 'reactstrap'
import '../styles/commonsec.css'


function CommonSec( {title}) {
  return (
    <section className='common_section'>
        <Container className='text-center'>
            <h1>
                {title}
            </h1>
        </Container>

    </section>
  )
}

export default CommonSec
