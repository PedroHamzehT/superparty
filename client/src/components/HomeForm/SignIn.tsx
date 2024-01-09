import useHomeContext from "./useHomeContext"

const SignIn = () => {
  const { formState, handleFormChange, handleSignTypeChange } = useHomeContext()

  return (
    <form className="mt-5">
      <div className='grid grid-cols-2 gap-4'>
        <input name="email" value={formState.email} onChange={handleFormChange} type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input name="password" value={formState.password} onChange={handleFormChange} type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className='flex justify-end gap-3 mt-14'>
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign in</button>
        <button type="button" className='p-2 rounded-md border mt-5' onClick={() => handleSignTypeChange('register')}>Register</button>
      </div>
    </form>
  )
}

export default SignIn
