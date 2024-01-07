interface SignInProps {
  setSignType: React.Dispatch<React.SetStateAction<'login' | 'register'>>
}

const SignIn = ({setSignType}: SignInProps) => {
  return (
    <form className="mt-5">
      <div className='grid grid-cols-2 gap-4'>
        <input type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className='flex justify-end gap-3 mt-14'>
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign in</button>
        <button type="button" className='p-2 rounded-md border mt-5' onClick={() => setSignType('register')}>Register</button>
      </div>
    </form>
  )
}

export default SignIn
