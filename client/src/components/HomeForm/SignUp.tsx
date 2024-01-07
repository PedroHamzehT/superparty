interface SignUpProps {
  setSignType: React.Dispatch<React.SetStateAction<'login' | 'register'>>
}


const SignUp = ({setSignType}: SignUpProps) => {
  return (
    <form className="mt-5">
      <div className='grid grid-cols-2 gap-4'>
        <input type="text" placeholder='Type your name' className='border border-gray-300 p-2 rounded-md'/>
        <input type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
        <input type="password" placeholder='Confirm your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className='flex justify-end gap-3'>
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign up</button>
        <button type="button" className='p-2 rounded-md border mt-5' onClick={() => setSignType('login')}>Log in</button>
      </div>
    </form>
  );
}

export default SignUp
