import { useState } from 'react'
import SignIn from './SignIn'
import SignUp from './SignUp'

const HomeForm = () => {
  const [signType, setSignType] = useState<'login' | 'register'>('login')

  return (
    <>
      {signType === 'login' ? <SignIn setSignType={setSignType} /> : <SignUp setSignType={setSignType} />}
    </>
  )
}

export default HomeForm

