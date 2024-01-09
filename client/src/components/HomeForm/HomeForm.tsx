import SignIn from './SignIn'
import SignUp from './SignUp'
import useHomeContext from './useHomeContext'

const HomeForm = () => {
  const { formState: { sign_type } } = useHomeContext()

  return (
    <>
      {sign_type === 'login' && <SignIn />}
      {sign_type === 'register' && <SignUp />}
    </>
  )
}

export default HomeForm

